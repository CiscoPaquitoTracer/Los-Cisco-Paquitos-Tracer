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

@WebServlet(name="UsuarioServlet", value="/log_in")
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        UsuarioDao uDao = new UsuarioDao();
        Usuario U = uDao.getOne(id);
        HttpSession session = req.getSession();
        session.setAttribute("usuario", U);
        resp.sendRedirect(req.getContextPath()+"/registrarUsuario.jsp");
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1) Obtener la información del formulario
        String correo = req.getParameter("correo");
        String contra = req.getParameter("contra");
        String ruta = "index.jsp";

        //2) conectarme a la base de datos y buscar al usuario segun
        // las credenciales del form
        UsuarioDao dao = new UsuarioDao();
        Usuario u = dao.getOne(correo,contra);

        if(u.getCorreo() == null){
            //No existe el usuario en la base de datos
            HttpSession sesion = req.getSession();
            sesion.setAttribute("mensaje","El usuario no existe en la BD");
            resp.sendRedirect(ruta);
        }else{
            //Si existe el usuario
            ruta="Inicio.jsp";
            HttpSession sesion = req.getSession();
            sesion.setAttribute("name",u.getNombre_usuario());
            sesion.setAttribute("usuario",u);
            resp.sendRedirect(ruta);
        }
    }
}
