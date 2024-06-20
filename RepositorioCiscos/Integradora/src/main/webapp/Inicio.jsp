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
            <a class="navbar-brand" href="menu">
                <img src="#" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
                Menú desplegable aqui
            </a>
            <label class="navbar-brand" href="menu" id="textheader2">
                <img src="IMG/cajaIcon.png" alt="Logo" width="60" height="60">
                SISTEMA DE GESTIÓN DE ALMACÉN
            </label>
            <label id="UserData">¡Bienvenido, <strong id="name">User</strong>!</label>
            <a data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
                <img src="IMG/UserI.png" id="perfil" width="60" height="60">
            </a>
        </div>
    </nav>
</header>
<div class="container">
    <div class="col-8 offset-2">
        <br>
        <div class="form-container" id="contInicio">
            <h1 id="tituloInicio">MENÚ DE ALMACÉN</h1>
            <br>
            <div class="row" id="theRow">
                <img id="btns" src="IMG/Btn3_Admin.png">
                <img id="btns" src="IMG/Btn2_Admin.png">
                <img id="btns" src="IMG/Btn1_Admin.png">
            </div>
            <br>
            <div class="row" id="theRow2">
                <div class="col"><button class="btn btn-secondary" id="btnAdmin">USUARIOS</button></div>
                <div class="col"><button class="btn btn-secondary" id="btnAdmin">HISTORIAL</button></div>
                <div class="col"><button class="btn btn-secondary" id="btnAdmin">ALMACÉN</button></div>
            </div>
            <br>
            <button class="btn btn-info mt-3 mb-1" id="exit">SALIR</button>
        </div>
    </div>
</div>
</body>
</html>
