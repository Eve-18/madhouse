<%-- 
    Document   : barberos
    Created on : 14/04/2026, 11:30:28 p. m.
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
<html>
<head>
    <title>Barberos - MadHouse</title>

 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/estilo.css">
</head>

<body>

<div class="app">
    <div class="card">

        <h2>Elige tu Barbero</h2>

        <p><strong>Servicio:</strong> ${servicio}</p>
        <p><strong>Precio:</strong> $${precio}</p>
        
        

        <hr>

        <form action="BarberoServlet" method="post">

            
            <input type="hidden" name="servicio" value="${servicio}">
            <input type="hidden" name="precio" value="${precio}">
            <input type="hidden" name="barbero" id="barberoSeleccionado">

         
            <div class="barberos-botones">

                <button type="button" onclick="seleccionar('Andres Hernandez', this)">
                    Andres Hernandez
                </button>

                <button type="button" onclick="seleccionar('Jose Garcia', this)">
                    Jose Garcia
                </button>

                <button type="button" onclick="seleccionar('Jeronimo Cepeda', this)">
                    Jeronimo Cepeda
                </button>

                <button type="button" onclick="seleccionar('Camilo Escobar', this)">
                    Camilo Escobar
                </button>

            </div>

            <br>

            <input type="submit" value="Continuar">
            
            <div class="contenedor-volver">
    <a href="servicios.jsp" class="btn-volver">
        <i class="fas fa-arrow-left"></i> ← volver a servicios
    </a>
</div>

        </form>

    </div>
</div>


<script>
function seleccionar(nombre, boton) {

   
    document.getElementById("barberoSeleccionado").value = nombre;

   
    document.querySelectorAll(".barberos-botones button")
        .forEach(btn => btn.classList.remove("activo"));

  
    boton.classList.add("activo");
}

document.querySelector("form").addEventListener("submit", function(e){
    if(document.getElementById("barberoSeleccionado").value === ""){
        alert("Por favor selecciona un barbero");
        e.preventDefault();
    }
});
</script>

</body>
</html>
    