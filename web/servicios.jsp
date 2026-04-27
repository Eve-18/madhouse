<%-- 
    Document   : servicios
    Created on : 14/04/2026, 10:14:25 p. m.
    Author     : Agude
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("correo") == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Servicios - MadHouse</title>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500;700&family=Montserrat:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/estilo.css">
</head>

<body>

<div class="app">

    <header class="header-principal">
        <div class="titulo-servicios">
            <span>7</span>
            FORMAS DE PRESENTAR TU MEJOR VERSIÓN
           
        </div>
        <hr>
    </header>

    <div class="contenedor-grid">
        
        <div class="servicio-card">
            <form action="ServicioServlet" method="post">
                <h3>Corte Sencillo - $30.000</h3>
                <p>Corte sencillo con asesoramiento de imagen, lavado y masaje capilar, peinado con los mejores productos y una bebida caliente.</p>
                <p>Duración: 45 min</p>
                <input type="hidden" name="servicio" value="Corte Sencillo">
                <input type="hidden" name="precio" value="30000">
                <input type="submit" value="Reservar" class="btn-reservar">
            </form>
        </div>

        <div class="servicio-card">
            <form action="ServicioServlet" method="post">
                <h3>Corte con Cuchilla - $35.000</h3>
                <p>Corte con cuchilla con asesoramiento de imagen, lavado y masaje capilar, peinado con los mejores productos y una bebida caliente.</p>
                <p>Duración: 50 min</p>
                <input type="hidden" name="servicio" value="Corte con Cuchilla">
                <input type="hidden" name="precio" value="35000">
                <input type="submit" value="Reservar" class="btn-reservar">
            </form>
        </div>

        <div class="servicio-card">
            <form action="ServicioServlet" method="post">
                <h3>Corte + Barba - $50.000</h3>
                <p>Corte  con asesoramiento de imagen + barba con vapor ozono sencilla o pigmentada, lavado y masaje capilar, peinado con los mejores productos y bebidas.</p>
                <p>Duración: 80 min</p>
                <input type="hidden" name="servicio" value="Corte + Barba">
                <input type="hidden" name="precio" value="50000">
                <input type="submit" value="Reservar" class="btn-reservar">
            </form>
        </div>

        <div class="servicio-card">
            <form action="ServicioServlet" method="post">
                <h3>Corte Barba Gold - $70.000</h3>
                <p>Corte  con asesoramiento de imagen + barba con vapor ozono sencilla o pigmentada, Incluye mascarilla facial, parches de colágeno, avado y masaje capilar, peinado con los mejores productos y bebidas.</p>
                <p>Duración: 105 min</p>
                <input type="hidden" name="servicio" value="Corte Barba Gold">
                <input type="hidden" name="precio" value="70000">
                <input type="submit" value="Reservar" class="btn-reservar">
            </form>
        </div>

        <div class="servicio-card">
            <form action="ServicioServlet" method="post">
                <h3>Diseño de Cejas - $10.000</h3>
                <p>Diseño de cejas con cuchilla.</p>
                <p>Duración: 15 min</p>
                <input type="hidden" name="servicio" value="Diseño de Cejas">
                <input type="hidden" name="precio" value="10000">
                <input type="submit" value="Reservar" class="btn-reservar">
            </form>
        </div>

        <div class="servicio-card">
            <form action="ServicioServlet" method="post">
                <h3>Barba - $25.000</h3>
                <p>Diseño de barba con vapor ozono, mascarilla facila, parches de colageno y una bebida caliente.</p>
                <p>Duración: 30 min</p>
                <input type="hidden" name="servicio" value="Barba">
                <input type="hidden" name="precio" value="25000">
                <input type="submit" value="Reservar" class="btn-reservar">
            </form>
        </div>

        <div class="servicio-card">
            <form action="ServicioServlet" method="post">
                <h3>Limpieza Facial - $25.000</h3>
                <p>Limpieza facial con mascarilla.</p>
                <p>Duración: 40 min</p>
                <input type="hidden" name="servicio" value="Limpieza Facial">
                <input type="hidden" name="precio" value="25000">
                <input type="submit" value="Reservar" class="btn-reservar">
            </form>
        </div>

    </div> </div> </body>
</html>