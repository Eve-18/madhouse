<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - MadHouse</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/estilo.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>

<body>

<div class="app">

    <div class="card">

        <h2>Bienvenido</h2>
        <p>Inicia sesión con tu correo y reserva tu próxima transformación.</p>

        <hr>

       
        <% if(request.getParameter("error") != null){ %>
            <p style="color:red; text-align:center;">Correo o contraseña incorrectos</p>
        <% } %>

        <% if(request.getParameter("registro") != null){ %>
    <div class="alerta-exito">
        <i class="fas fa-check-circle"></i>
        Registro exitoso, ahora inicia sesión
    </div>
        <% } %>   

        
        <form action="${pageContext.request.contextPath}/LoginServlet" method="post">

          
            <div class="input-group">
                <i class="fas fa-envelope"></i>
                <input type="email" name="correo" placeholder="Correo electrónico" required>
            </div>

           
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" placeholder="Contraseña" required>
            </div>

            <button type="submit">INICIAR SESIÓN</button>

        </form>

        <a href="registro.jsp">Crear cuenta</a>

    </div>

</div>

</body>
</html>