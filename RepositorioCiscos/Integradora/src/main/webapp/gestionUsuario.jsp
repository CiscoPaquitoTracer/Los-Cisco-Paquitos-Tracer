<%@ page import="mx.edu.utez.integradora.Dao.UsuarioDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.integradora.Model.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: Lenny
  Date: 21/06/2024
  Time: 02:47 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es-MX">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Usuarios</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/datatables.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/StyleLogin.css">
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/CSS/StyleUser.css'>
</head>
<body bgcolor="#F1FAEE">
<jsp:include page="/Templates/Header.jsp" />
<table id="example" class="table table-striped table-hover table-bordered" style="width: 100%">
    <thead id="theadx" style="background-color:  #595959;  align-items: center; color: white;">
    <tr>
        <th>id</th>
        <th>nombre</th>
        <!--<th>contraseña</th>-->
        <th>correo</th>
        <th>tipo</th>
        <th>estado</th>
        <th>actualizar</th>
        <th>eliminar</th>
    </tr>
    </thead>
    <tbody>
    <%
        UsuarioDao dao = new UsuarioDao();
        ArrayList<Usuario> lista = dao.getAll();
        for(Usuario u : lista){%>
    <tr>
        <td><%=u.getId()%></td>
        <td><%=u.getNombre_usuario()%></td>
        <!--<td><%=u.getContra()%></td>-->
        <td><%=u.getCorreo()%></td>
        <td><%=u.getTipo_usuario()%></td>
        <td><%=u.isEstado()%></td>
        <td><a href="log_in?id=<%=u.getId()%>">Actualizar</a></td>
        <td><a href="delete?id=<%=u.getId()%>">Eliminar</a></td>
    </tr>
    <% } %>
    </tbody>
</table>
<br>
<center><h1 class="featurette-heading fw-normal lh-1" id="tit">
    MENÚ DE USUARIOS
    <br>
    <a href="registrarUsuario.jsp" class="btn btn-outline-dark">Agregar usuario</a>
</h1></center>
<svg>
<symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
</symbol>
</svg>
<%
    HttpSession sesion = (HttpSession) request.getSession();
    String mensaje = (String) sesion.getAttribute("mensaje");
    String mensaje2 = (String) sesion.getAttribute("mensaje2");
%>

<%
    if(mensaje2!=null){
        System.out.println(mensaje2);%>
<div class="alert alert-success d-flex align-items-center" role="alert">
    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
    <div>
        <%=mensaje2%>
    </div>
</div>

<% } %>
    <%if(mensaje!=null){ %>
<div class="alert alert-danger d-flex align-items-center" role="alert">
    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
    <div>
        <%=mensaje%>
    </div>
</div>
<% } %>
<script>
    document.addEventListener("DOMContentLoaded", () => {
        const table = document.getElementById("example");
        new DataTable(table, {
            language: {
                url: '${pageContext.request.contextPath}/JS/es-MX.json'
            }
        })
    });
</script>
<%
    sesion.removeAttribute("usuario");
    sesion.removeAttribute("mensaje");
    sesion.removeAttribute("mensaje2");
%>
<script src="${pageContext.request.contextPath}/JS/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/JS/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/JS/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/JS/dataTables.bootstrap5.js"></script>
<script src="${pageContext.request.contextPath}/JS/datatables.js"></script>
<script src="${pageContext.request.contextPath}/JS/es-MX.json"></script>
</body>
</html>
