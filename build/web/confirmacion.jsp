<%-- 
    Document   : confirmacion
    Created on : 14/04/2026, 11:40:33 p. m.
    Author     : Agude
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("correo") == null){
        response.sendRedirect("login.jsp");
        return;
    }

    String servicio = (request.getAttribute("servicio") != null) ? (String) request.getAttribute("servicio") : "N/A";
    String barbero = (request.getAttribute("barbero") != null) ? (String) request.getAttribute("barbero") : "N/A";
    String precio = (request.getAttribute("precio") != null) ? (String) request.getAttribute("precio") : "0";
    String fecha = (request.getAttribute("fecha") != null) ? (String) request.getAttribute("fecha") : "N/A";
    String hora = (request.getAttribute("hora") != null) ? (String) request.getAttribute("hora") : "N/A";
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Cita Confirmada - MadHouse</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/estilo.css">
</head>
<body>

<div class="app">
    <div class="confirmacion-card">
        <div style="color: var(--oro); font-size: 3rem;">✓</div>
        
        <h2>¡Cita Confirmada!</h2>
        <p style="color: var(--gris-texto); font-size: 0.9rem;">Gracias por elegir MadHouse Barbería</p>

        <hr>

        <h3>Detalles de tu reserva</h3>

        <div class="detalles-reserva">
            <p><strong>Servicio:</strong> <span><%= servicio %></span></p>
            <p><strong>Barbero:</strong> <span><%= barbero %></span></p>
            <p><strong>Precio:</strong> <span class="precio-total">$<%= precio %></span></p>
            <p><strong>Fecha:</strong> <span><%= fecha %></span></p>
            <p><strong>Hora:</strong> <span><%= hora %></span></p>
        </div>

        <hr>

        <p style="font-style: italic; color: #666; font-size: 0.8rem;">
            "Donde tu estilo cobra vida."
        </p>

        <a href="servicios.jsp" class="btn-volver">⬅ VOLVER AL INICIO</a>
    </div>
</div>

</body>
</html>

