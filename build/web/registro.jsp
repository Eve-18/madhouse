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

  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/estilo.css">

  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>

<body>

<div class="app">

 

    <div class="card">

        <h2>Crear Cuenta</h2>
        <p>Únete a la experiencia MadHouse</p>

        <hr>
        <form action="${pageContext.request.contextPath}/RegistroServlet" method="post">
            <input type="hidden" name="test" value="ok">
         
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input type="text" name="nombre" placeholder="Nombre completo" required>
            </div>

          
            <div class="input-group">
                <i class="fas fa-phone"></i>
                <input type="text" name="telefono" placeholder="Teléfono" required>
            </div>

           
            <div class="input-group">
                <i class="fas fa-envelope"></i>
                <input type="email" name="correo" placeholder="Correo electrónico" required>
            </div>

            
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" placeholder="Contraseña" required>
            </div>

           
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" name="confirmar" placeholder="Confirmar contraseña" required>
            </div>

           <button type="submit">REGISTRARSE</button>

        </form>

        <a href="login.jsp">¿Ya tienes cuenta? Inicia sesión</a>

    </div>

</div>

</body>
</html>