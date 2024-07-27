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
</head>
<body bgcolor="#F1FAEE">
<jsp:include page="/Templates/Header.jsp" />
<br>
<table id="example" class="table table-striped table-hover" style="width: 100%">
    <thead class="table-dark">
    <tr>
        <th>id</th>
        <th>nombre</th>
        <th>contraseña</th>
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
        <td><%=u.getContra()%></td>
        <td><%=u.getCorreo()%></td>
        <td><%=u.getTipo_usuario()%></td>
        <td><%=u.isEstado()%></td>
        <td><a href="log_in?id=<%=u.getId()%>">Actualizar</a></td>
        <td><a href="delete?id=<%=u.getId()%>">Eliminar</a></td>
    </tr>
    <% } %>
    </tbody>
</table>
<%
    HttpSession sesion = (HttpSession) request.getSession();
    String mensaje = (String) sesion.getAttribute("mensaje");

    if(mensaje!=null){ %>
<p style="color: red;"><%=mensaje%></p>
<% } %>
<center><h2 class="featurette-heading fw-normal lh-1">
    SANCHEZ ROCHA LEONARDO OBED
    <br>
    <span class="text-muted">20233tn094</span>
    <br>
    <a href="index.jsp">Volver</a>
</h2></center>

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
%>
<script src="${pageContext.request.contextPath}/JS/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/JS/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/JS/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/JS/dataTables.bootstrap5.js"></script>
<script src="${pageContext.request.contextPath}/JS/datatables.js"></script>
<script src="${pageContext.request.contextPath}/JS/es-MX.json"></script>
</body>
</html>
