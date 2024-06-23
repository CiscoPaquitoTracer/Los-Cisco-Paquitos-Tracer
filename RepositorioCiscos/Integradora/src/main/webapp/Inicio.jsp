<%--
  Created by IntelliJ IDEA.
  User: Lenny
  Date: 19/06/2024
  Time: 08:54 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Inicio</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='CSS/bootstrap.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='CSS/StyleLogin.css'>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-sm bg-body-tertiary" id="nav">
        <div class="container-fluid">
            <a class="navbar-brand" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
                <svg width="30" height="24" viewBox="0 0 30 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <rect y="18.5454" width="30" height="5.45455" rx="2.72727" fill="white"/>
                    <rect y="9.27271" width="30" height="5.45455" rx="2.72727" fill="white"/>
                    <rect width="30" height="5.45455" rx="2.72727" fill="white"/>
                </svg>
            </a>
            <label class="navbar-brand" href="menu" id="textheader2">
                <img src="IMG/cajaIcon.png" alt="Logo" width="50" height="50">
                SISTEMA DE GESTIÓN DE ALMACÉN
            </label>
            <label id="UserData">¡Bienvenido, <strong id="name">User</strong>!</label>
            <a data-bs-toggle="#" href="#" role="button" aria-controls="#" >
                <img src="IMG/UserI.png" id="perfil" width="45" height="45" alt="Perfil">
            </a>
        </div>
    </nav>
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
        <div class="offcanvas-header bg-dark">
            <svg width="30" height="24" viewBox="0 0 30 24" fill="none" xmlns="http://www.w3.org/2000/svg"
                 data-bs-dismiss="offcanvas" aria-label="Close"></svg>
            <rect y="18.5454" width="30" height="5.45455" rx="2.72727" fill="#FFDF8E"/>
            <rect y="9.27271" width="30" height="5.45455" rx="2.72727" fill="#FFDF8E"/>
            <rect width="30" height="5.45455" rx="2.72727" fill="#FFDF8E"/>
            </svg>

            <h5 class="offcanvas-title" id="offcanvasExampleLabel">TU PERFIL</a></h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <div>
                <center><p><img src="IMG/UserI.png" width="150" height="150"></p></center>
                <p><strong>Tu correo: </strong><a href = "mailto: email"><strong id="email"></strong></a></p>
                <p><strong class="laContra" id="password"></strong></p>
            </div>
        </div>
        <div class="boton">
            <center><a href="Index2.html"><button type="button" id="nuevo" class="btn btn-success">Cerrar Sesión</button></a></center>
        </div>
</header>
<main class="px-3">
    <div class="d-flex h-100 text-center">
        <div class="col-xs-6 offset-1 col-sm-8 offset-2 col-md-6 offset-2 col-lg-6 offset-1 col-xl-8 offset-2">
            <br>
            <div class="form-container" id="contInicio">
                <h1 id="tituloInicio">MENÚ DE ALMACÉN</h1>
                <br>
                <div class="row" id="rw">
                    <div class="col">
                        <img id="btns" src="IMG/Btn3_Admin.png" alt="Gesionar usuarios">
                        <button class="btn btn-secondary.btn-sm mt-2 mb-3" id="btnAdmin">USUARIOS</button>
                    </div>
                    <div class="col">
                        <img id="btns" src="IMG/Btn2_Admin.png" alt="ver historial">
                        <button class="btn btn-secondary.btn-sm mt-2 mb-3" id="btnAdmin">HISTORIAL</button>
                    </div>
                    <div class="col">
                        <img id="btns" src="IMG/Btn1_Admin.png" alt="ver almacen">
                        <button class="btn btn-secondary.btn-sm mt-2 mb-3" id="btnAdmin">ALMACÉN</button>
                    </div>
                    <br>
                </div>
                <br>
                <div class="row" id="theRow">
                    <a class="btn btn-info mt-2 mb-1" id="exit" href="IndexIntegra.html">SALIR</a>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="JS/bootstrap.js"></script>
</body>
</html>
