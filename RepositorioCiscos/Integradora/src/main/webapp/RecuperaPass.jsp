<%@ page import="mx.edu.utez.integradora.Model.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: Lenny
  Date: 13/07/2024
  Time: 06:36 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es-MX">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Recuperacion</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/StyleRecupera.css">
</head>
<body>
<%
    Usuario u = new Usuario();
%>
<!-- Quitar despues -->
<header class="container-fluid">
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <p class="container-fluid" id="textheader2">
                <img src="IMG/cajaIcon.png" alt="Logo" width="60" height="60">
                GESTIÓN DE ALMACÉN
            </p>
        </div>
    </nav>
</header>
<!-- Quitar despues -->
<main>
    <br>
    <div class="wrapper">
        <!--<div class="row">-->
        <div class="col"><div class="container-fluid"></div></div>
        <div class="col-5 col-xs-6 offset-2 col-sm-4 offset-2 col-md-4 offset-2 col-lg-8 offset-2 col-xl-4 offset-4"><!--form-->
            <center>
                <div class="container-fluid"><img src="IMG/cajaIcon.png" alt="Logo provisional" width="120" height="120" id="logos"></div>
            </center>
            <div class=" form-container sign-in-container">
                <form action="recuContra" method="post" id="miFormulario">
                    <label id="textheader" class=" d-flex align-items-center mb-3 mb-md-0 me-md-auto">
                        <img src="IMG/Cajon.png" alt="Logo" width="90" height="90" id="logo">
                        RECUPERA TU CONTRASEÑA
                    </label>
                    <div class="row">
                        <h5 class="mt-4">Podemos ayudarte a reestablecer tu contraseña.</h5>
                        <h5>Primero ingresa tu correo electrónico:</h5>
                    </div>
                    <div class="form-group mt-3 mb-2">
                        <label for="correo">Correo electrónico:* </label>
                        <div class="">
                            <input class="form-control" id="correo" type="email" name="correo" required placeholder="Ingresa el correo electrónico">
                            <input type="hidden" name="nombre" value="<%=u.getNombre_usuario()%>" required>
                        </div>
                        <br>
                        <center><input type="button" class="btn btn-info mt-2 mb-0" onclick="location.href='index.jsp'" id="enter" value="CANCELAR" /><input class="btn btn-info mt-2 mb-0" type="submit" id="enter" value="SIGUIENTE"/></center>
                    </div>
                </form>
                <br>
                <%
                    HttpSession sesion = (HttpSession) request.getSession();
                    String mensaje = (String) sesion.getAttribute("mensaje");

                    if(mensaje!=null){ %>
                <div class="alert alert-danger d-flex align-items-center" role="alert">
                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                    <div>
                        <%=mensaje%>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
        <div class="col"><div class="container-fluid"></div></div>
        <!--</div>-->
    </div>
</main>
<br>
<script src='${pageContext.request.contextPath}/JS/bootstrap.js'></script>
<script src="${pageContext.request.contextPath}/JS/bootstrap.bundle.min.js"></script>
<jsp:include page="/Templates/Footer.jsp" />
</body>
</html>
