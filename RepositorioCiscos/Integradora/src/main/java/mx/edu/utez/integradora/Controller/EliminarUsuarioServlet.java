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

@WebServlet(name="EliminarUsuarioServlet", value="/delete")
public class EliminarUsuarioServlet extends HttpServlet
{
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String ruta;
            Usuario u = new Usuario();
            u.setId(Integer.parseInt(req.getParameter("id")));
            HttpSession session = req.getSession();
            session.setAttribute("usuario", u);
            UsuarioDao dao = new UsuarioDao();
            if (dao.delete(u)){
                    req.getSession().setAttribute("mensaje","Usuario eliminado");
                    System.out.println("<p style=\"color: red;\">Usuario Eliminado</p>");
                    ruta = "gestionUsuario.jsp";
            } else {
                    //Mandar un mensaje de errror y regesar al formulario de registro
                    req.getSession().setAttribute("mensaje","No se pudo eliminar el usuario");
                    ruta = "index.jsp";
                    System.out.println("<p style=\"color: red;\">No se pudo, UnU, XD</p>");
            }
            resp.sendRedirect(ruta);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //
    }
}
