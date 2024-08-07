<%@ page import="com.mysql.cj.x.protobuf.MysqlxDatatypes" %>
<%@ page import="mx.edu.utez.integradora.Model.Usuario" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: Lenny
  Date: 18/06/2024
  Time: 02:47 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es-MX">
<head>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Regitrar usuario</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/CSS/bootstrap.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/CSS/StyleUser.css'>
</head>
<body>
<jsp:include page="/Templates/Header.jsp" />
<!-- un formulario para insertar el usuario -->
<%
    HttpSession sesion = (HttpSession) request.getSession();
    Usuario u = (Usuario) sesion.getAttribute("usuario");
    if (u == null) { // Que estoy registrando %>
<script>const laAlerta = document.getElementById("alertaa");</script>
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
        <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
    </symbol>
</svg>
<div class="container-fluid">
    <div class="col"></div>
    <div class="col-8 offset-2">
        <form action="sign_in" method="post" id="form">
            <div class="row" id="contInicio2">
                <div class="col"><button type="button" onclick="location.href='gestionUsuario.jsp'" id="back" class="btn btn-outline-info"><img src="IMG/Back.png" class="img-fluid" width="40" height="40"></button></div>
                <div class="col"></div>
                <div class="col"></div>
                <div class="col"><button onclick="compara()" id="confirm" class="btn btn-outline-success">Confirmar registro</button></div>
            </div>
            <br>
            <div class="container-fluid" id="contInicio">
                <div class="container-sm">
                    <p style="font-size: 5vw;" id="tit">REGISTRAR USUARIO</p>
                </div>
                <div><!-- Inicio de columna -->
                    <div class="row">
                        <div class="col">
                            <label>Nombre:*</label>
                            <input type="text" class="form-control" name="nombre_usuario" placeholder="Name">
                            <label for="pass1">Contraseña:*</label>
                            <input type="password" class="form-control" id="pass1" name="pass1" placeholder="Password" required>
                            <label>Tipo de usuario:*</label>
                            <br>
                            <select class="form-select form-control" name="tipo_usuario" id="types">
                                <option value="" disabled selected>Selecciona un usuario</option>
                                <option value="1">Administrador</option>
                                <option value="2">Almacenista</option>
                            </select>
                        </div>
                        <div class="col">
                            <label>Correo:*</label>
                            <input type="email" class="form-control" placeholder="Email" name="correo">
                            <label for="pass2">Confirmar contraseña:*</label>
                            <input type="password" class="form-control" placeholder="Confirm Password" id="pass2" name="pass2" required>
                            <input type="hidden" name="status" value="true">
                        </div>
                    </div>
                </div>
            </div>
            <script>
                function compara(){
                    var p1 = document.getElementById('pass1').value;
                    var p2 = document.getElementById('pass2').value;
                    const alertaa = document.getElementById("alertaa");
                    if(p1 === p2){
                        //Mandar el formulario
                        alertaa.style.display = "none";
                        document.getElementById('form').submit();
                    }else{
                        //Deberia advertirle y no mandar el formulario
                        alert("Tus contraseñas no coinciden");
                    }
                }
            </script>
            <input type="hidden" name="operacion" value="registrar">
        </form>
    </div><!-- Inicio de columna -->
</div>
<div class="col"></div>
<% }else{ %><div class="container-fluid">
    <div class="col"></div>
    <div class="col-8 offset-2">
        <form action="sign_in" method="post" id="form2">
            <div class="row" id="contInicio2">
                <div class="col"><button type="button" onclick="location.href='gestionUsuario.jsp'" id="back" class="btn btn-outline-info"><img src="IMG/Back.png" class="img-fluid" width="40" height="40"></button></div>
                <div class="col"></div>
                <div class="col"></div>
                <div class="col"><button onclick="compara()" id="confirm" class="btn btn-outline-success">Actualizar usuario</button></div>
            </div>
            <br>
            <div class="container-fluid" id="contInicio">
                <div class="container-sm">
                    <p style="font-size: 5vw;" id="tit">ACTUALIZAR USUARIO</p>
                </div>
                <div><!-- Inicio de columna -->
                    <div class="row">
                        <div class="col">
                            <label>Nombre:*</label>
                            <input type="text" class="form-control" name="nombre_usuario" value="<%=u.getNombre_usuario()%>">
                            <label for="pass1">Contraseña:*</label>
                            <input type="password" class="form-control" id="pass" name="pass" value="<%=u.getContra()%>" required>
                            <label>Tipo de usuario:*</label>
                            <br>
                            <select class="form-select form-control" name="tipo_usuario">
                                <% if(u.getTipo_usuario() == 1) { %>
                                <option value="1" selected>Administrador</option>
                                <option value="2">Almacenista</option>
                                <% } else { %>
                                <option value="1">Administrador</option>
                                <option value="2" selected>Almacenista</option>
                                <% } %>
                            </select>
                            <br>
                        </div>
                        <div class="col">
                            <label>Correo:*</label>
                            <input type="email" class="form-control" value="<%=u.getCorreo()%>" name="correo">
                            <label for="pass3">Confirmar contraseña:*</label>
                            <input type="password" class="form-control" placeholder="Confirm Password" id="pass3" name="pass3" required>
                            <label>Estatus actual:*</label>
                            <br>
                            <select class="form-select form-control" name="status" id="status">
                                <option value="" disabled selected>Selecciona su estatus</option>
                                <option value="true">Activo</option>
                                <option value="false">Inactivo</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <input type="hidden" name="operacion" value="actualizar">
            <input type="hidden" name="id" value="<%=u.getId()%>">
            <script>
                function compara(){
                    var p1 = document.getElementById('pass').value;
                    var p2 = document.getElementById('pass3').value;
                    const alertaa = document.getElementById("alertaa");
                    if(p1 === p2){
                        //Mandar el formulario
                        document.getElementById('form2').submit();
                    }else{
                        //Deberia advertirle y no mandar el formulario
                        alert("Tus contraseñas no coinciden");
                    }
                }
            </script>
        </form>
    </div><!-- Inicio de columna -->
</div>
<div class="col"></div>
<% } %>
<%
    String mensaje = (String) sesion.getAttribute("mensaje");

    if(mensaje!=null){ %>
<!--<p style="color: red;"><%=mensaje%></p>-->
<div class="alert alert-danger d-flex align-items-center" role="alert">
    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
    <div>
        <%=mensaje%>
    </div>
</div>
<% } %>
<%
    sesion.removeAttribute("usuario");
    sesion.removeAttribute("mensaje");
%>
<script src="${pageContext.request.contextPath}/JS/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/JS/bootstrap.js"></script>
<jsp:include page="/Templates/Footer.jsp" />
</body>
</html>
