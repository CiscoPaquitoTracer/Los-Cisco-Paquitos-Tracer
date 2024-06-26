<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es-MX">
<head>
  <meta charset='utf-8'>
  <meta http-equiv='X-UA-Compatible' content='IE=edge'>
  <title>Iniciar sesión</title>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
  <link rel='stylesheet' type='text/css' media='screen' href='CSS/bootstrap.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='CSS/StyleLogin.css'>
</head>
<body>
<header class="mb-auto">
  <nav class="navbar-brand">
    <div class="container-fluid">
      <p class="navbar-brand" id="textheader2">
        <img src="IMG/cajaIcon.png" alt="Logo" width="60" height="60">
        GESTIÓN DE ALMACÉN
      </p>
    </div>
  </nav>
</header>
<main class="form-signin w-auto m-auto">
  <div class="container-fluid">
    <!--<div class="row">-->
    <div class="col-6 offset-0 col-xs-4 offset-2 col-sm-4 offset-1 col-md-4 offset-2 col-lg-4 offset-2 col-xl-4 offset-4"><!--form-->
      <center>
        <img src="IMG/cajaIcon.png" alt="Logo provisional" width="120" height="120">
      </center>
      <div class="form-container sign-in-container">
        <form class="cover-container" action="Inicio.jsp" method="post" id="miFormulario">
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
      <!--</div>-->
    </div>
  </div>
</main>
<script src='JS/bootstrap.js'></script>
<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>