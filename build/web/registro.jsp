<%-- 
    Document   : registro
    Created on : 14/04/2026, 9:51:11 p. m.
    Author     : Agude
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registro - MadHouse</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Tu CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/estilo.css">

    <!-- Iconos -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>

<body>

<div class="app">

    <div class="card shadow-lg">

        <h2 class="text-center">Crear Cuenta</h2>
        <p class="text-center">Únete a la experiencia MadHouse</p>

        <hr>

        <form action="${pageContext.request.contextPath}/RegistroServlet" method="post">
            <input type="hidden" name="test" value="ok">

            <div class="input-group">
                <i class="fas fa-user"></i>
                <input type="text" name="nombre" placeholder="Nombre completo" required class="form-control">
            </div>

            <div class="input-group">
                <i class="fas fa-phone"></i>
                <input type="text" name="telefono" placeholder="Teléfono" required class="form-control">
            </div>

            <div class="input-group">
                <i class="fas fa-envelope"></i>
                <input type="email" name="correo" placeholder="Correo electrónico" required class="form-control">
            </div>

            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" placeholder="Contraseña" required class="form-control">
            </div>

            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" name="confirmar" placeholder="Confirmar contraseña" required class="form-control">
            </div>

            <!-- Botón con Bootstrap -->
            <button type="submit" class="btn btn-dark w-100 mt-3">REGISTRARSE</button>

        </form>

        <a href="login.jsp" class="text-center d-block mt-3">
            ¿Ya tienes cuenta? Inicia sesión
        </a>

    </div>

</div>

</body>
</html>