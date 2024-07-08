<%@ page import="mx.edu.utez.integradora.Model.Usuario" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es-MX">
<head>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Iniciar sesión</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/CSS/bootstrap.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/CSS/StyleLogin.css'>
</head>
<body>
<header class="container-fluid">
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <p class="container-fluid" id="tituloLogin" style="color: white">
                <img src="IMG/cajaIcon.png" alt="Logo" width="60" height="60">
                GESTIÓN DE ALMACÉN
            </p>
        </div>
    </nav>
</header>
<script>const laAlerta = document.getElementById("alertaa");</script>
<main>
    <div class="wrapper">
        <!--<div class="row">-->
        <div class="col"><div class="container-fluid"></div></div>
        <div class="col-4 offset-4 col-xs-8 offset-2"><!--form-->
            <center>
                <div class="container-fluid" id="logito"><img src="${pageContext.request.contextPath}/IMG/cajaIcon.png" alt="Logo provisional" width="120" height="120"></div>
            </center>
            <div class=" form-container sign-in-container">
                <form action="log_in" method="post" id="miFormulario">
                    <h1 id="tituloLogin">INICIAR SESIÓN AHORA</h1>
                    <div class="form-group mt-3 mb-2">
                        <label for="correo">Correo electrónico:* </label>
                        <div class="">
                            <input class="form-control" id="correo" type="email" name="correo" required placeholder="Ingresa el correo electrónico">
                        </div>
                        <label for="contra">Contraseña:* </label>
                        <div class="">
                            <input class="form-control" id="contra" type="password" name="contra" required placeholder="Ingresa tu contraseña">
                        </div>
                        <a href="#">¿Olvidaste tu contraseña?</a>
                        <br>
                        <center><p><input class="w-100 btn btn-lg btn btn-info mt-3 mb-0" type="submit" id="enter" value="INICIAR SESIÓN" /></p></center>
                    </div>
                </form>
            </div>
            <%
                HttpSession sesion = request.getSession();
                String mensaje = (String) sesion.getAttribute("mensaje");

                if(mensaje!=null){
                    System.out.println(mensaje);%>
            <div id="alertaa" class="alert alert-danger" role="alert">
                <%=mensaje%>
            </div>
            <script>
                laAlerta.style.display = "block";
            </script>
            <% } %>
        </div>
        <div class="col"><div class="container-fluid"></div></div>
        <!--</div>-->
    </div>
</main>
<br>
<br>
<%
    sesion.removeAttribute("usuario");
    sesion.removeAttribute("mensaje");
%>
<script src='${pageContext.request.contextPath}/JS/bootstrap.js'></script>
<script src="${pageContext.request.contextPath}/JS/bootstrap.bundle.min.js"></script>
<jsp:include page="/Templates/Footer.jsp" />
</body>
</html>