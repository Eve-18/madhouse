<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
    if (session.getAttribute("correo") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String servicio = (request.getAttribute("servicio") != null) ? (String) request.getAttribute("servicio") : "";
    String precio = (request.getAttribute("precio") != null) ? (String) request.getAttribute("precio") : "0";
    String barbero = (request.getAttribute("barbero") != null) ? (String) request.getAttribute("barbero") : "";

    List<String> horasOcupadas = (List<String>) request.getAttribute("horasOcupadas");
    if (horasOcupadas == null) {
        horasOcupadas = new ArrayList<>();
    }

    String fechaActual = (request.getAttribute("fechaActual") != null) ? (String) request.getAttribute("fechaActual") : "";
%>

<html>
<head>
    <title>Reserva - MADHOUSE</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/estilo.css">
</head>

<body>

<div class="app">
    <div class="card">

        <% if (request.getAttribute("error") != null) { %>
            <div class="alerta-error">
                 <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form action="FechaServlet" method="POST" id="formReserva">

            <input type="hidden" name="servicio" value="<%= servicio %>">
            <input type="hidden" name="precio" value="<%= precio %>">
            <input type="hidden" name="barbero" value="<%= barbero %>">
            <input type="hidden" name="hora" id="horaSeleccionada" required>

            <header>
                <h2 style="color:#c5a059;">RESERVAR TURNO</h2>
                <p><strong>Servicio:</strong> <%= servicio %> | <strong>Con:</strong> <%= barbero %></p>
            </header>

            <div class="campo">
                <label>1. Selecciona el día:</label>
              
                <input type="date" name="fecha" id="fechaInput" value="<%= fechaActual %>" required onchange="recargarHoras()">
            </div>

            <label>2. Selecciona la hora:</label>

            <div class="grid-horas">
                <%
                    String[] horarios = {"09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00"};
                    for (String h : horarios) {
                        boolean ocupado = horasOcupadas.contains(h);
                %>

                <button type="button"
                        class="btn-hora <%= ocupado ? "bloqueado" : "" %>"
                        <%= ocupado ? "disabled" : "" %>
                        onclick="seleccionarHora('<%= h %>', this)">

                    <%= h %>
                    <% if(ocupado){ %><br><small>Ocupado</small><% } %>

                </button>

                <% } %>
            </div>

            <button type="submit" class="btn-confirmar">AGENDAR CITA</button>

            <div class="contenedor-volver">
                <a href="barberos.jsp">← VOLVER</a>
            </div>

        </form>
    </div>
</div>

<script>

    document.getElementById('fechaInput').min = new Date().toISOString().split("T")[0];

    function seleccionarHora(valor, elemento) {
        document.querySelectorAll('.btn-hora').forEach(btn => btn.classList.remove('seleccionado'));
        elemento.classList.add('seleccionado');
        document.getElementById('horaSeleccionada').value = valor;
    }

    function recargarHoras() {
        const fecha = document.getElementById("fechaInput").value;
        const barbero = "<%= barbero %>";
        const servicio = "<%= servicio %>";
        const precio = "<%= precio %>";

        window.location.href =
            "FechaServlet?barbero=" + barbero +
            "&fecha=" + fecha +
            "&servicio=" + servicio +
            "&precio=" + precio;
    }

    document.getElementById('formReserva').onsubmit = function(e) {
        if (!document.getElementById('horaSeleccionada').value) {
            e.preventDefault();
            alert("Selecciona una hora");
        }
    };
</script>

</body>
</html>