<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>
  <meta http-equiv='X-UA-Compatible' content='IE=edge'>
  <title>Inicio</title>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
  <link rel='stylesheet' type='text/css' media='screen' href='CSS/bootstrap.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='CSS/StyleLogin.css'>
  <script src="JS/scriptIndex4.js"></script>
</head>
<body>
<header>
  <nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <a class="navbar-brand" href="menu" id="textheader">
        <img src="IMG/cajaIcon.png" alt="Logo" width="60" height="60" class="d-inline-block align-text-center">
        SISTEMA DE GESTIÓN DE ALMACÉN
      </a>
    </div>
  </nav>
</header>
<main>
  <div class="container">
    <!--<div class="row">-->
    <div class="col-4 offset-4"><!--form-->
      <center>
        <img src="IMG/cajaIcon.png" alt="Logo provisional" width="120" height="120">
      </center>
      <div class="form-container sign-in-container">
        <form action="#" method="post" id="miFormulario">
          <h1 id="tituloLogin">INICIAR SESIÓN AHORA</h1>
          <div class="form-group mt-3 mb-2">
            <label for="nombre">Correo electrónico:* </label>
            <input class="form-control" id="nombre" type="text" name="nombre" placeholder="Ingresa el correo electrónico">
            <label for="contra">Contraseña:* </label>
            <input class="form-control" id="contra" type="password" name="contra" placeholder="Ingresa tu contraseña">
          </div>
          <div id="nuevos"></div>
          <center><input class="btn btn-info mt-3 mb-2" type="submit" id="enter" value="INICIAR SESIÓN" /></center>
        </form>
      </div>
      <!--</div>-->
    </div>
  </div>
</main>
<script src='JS/bootstrap.js'></script>
</body>
</html>