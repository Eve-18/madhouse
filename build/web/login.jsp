<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - MadHouse</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/estilo.css">

    <!-- Iconos -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>

<body>

<div class="app">

    <!-- Uso leve de Bootstrap -->
    <div class="card shadow-lg">

        <h2 class="text-center">Bienvenido</h2>
        <p class="text-center">Inicia sesión con tu correo y reserva tu próxima transformación.</p>

        <hr>

        <% if(request.getParameter("error") != null){ %>
            <p class="text-danger text-center">Correo o contraseña incorrectos</p>
        <% } %>

        <% if(request.getParameter("registro") != null){ %>
            <div class="alerta-exito text-center">
                <i class="fas fa-check-circle"></i>
                Registro exitoso, ahora inicia sesión
            </div>
        <% } %>   

        <form action="${pageContext.request.contextPath}/LoginServlet" method="post">

            <div class="input-group">
                <i class="fas fa-envelope"></i>
                <input type="email" name="correo" placeholder="Correo electrónico" required class="form-control">
            </div>

            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" placeholder="Contraseña" required class="form-control">
            </div>

            <!-- Botón con Bootstrap -->
            <button type="submit" class="btn btn-dark w-100">INICIAR SESIÓN</button>

        </form>

        <a href="registro.jsp" class="text-center d-block mt-3">Crear cuenta</a>

    </div>

</div>

</body>
</html>