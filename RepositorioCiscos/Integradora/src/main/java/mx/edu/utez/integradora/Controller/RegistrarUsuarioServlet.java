package mx.edu.utez.integradora.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.integradora.Dao.UsuarioDao;
import mx.edu.utez.integradora.Model.Usuario;

import java.io.IOException;
import java.util.Objects;

@WebServlet(name="RegistrarUsuarioServlet", value="/sign-in")
public class RegistrarUsuarioServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nombre_user = req.getParameter("nombre_user");
        String contra1_user = req.getParameter("pass1");
        String contra2_user = req.getParameter("pass2");
        String correo_user = req.getParameter("correo");
        int tipo_usuario = Integer.parseInt(req.getParameter("tipo_cuenta"));
        String ruta = "index.jsp";

        if(!Objects.equals(contra2_user, contra2_user)){
            //Las contraseñas no coinciden
            HttpSession sesion = req.getSession();
            sesion.setAttribute("mensaje2","La contraseña no coincide con la confirmación");
        }else{

            //2) conectarme a la base de datos y buscar al usuario segun
            // las credenciales del form
            UsuarioDao dao = new UsuarioDao();
            Usuario u = new Usuario(nombre_user, contra1_user, correo_user, tipo_usuario);
            boolean o = dao.insertUsuario(u);
            //Se registró bien
            ruta="bienvenido.jsp";
            HttpSession sesion = req.getSession();
            sesion.setAttribute("usuario",o);
        } resp.sendRedirect(ruta);
    }
}
