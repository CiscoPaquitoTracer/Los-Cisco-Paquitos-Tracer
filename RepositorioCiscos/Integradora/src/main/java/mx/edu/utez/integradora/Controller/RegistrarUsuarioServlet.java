package mx.edu.utez.integradora.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.integradora.Dao.UsuarioDao;
import mx.edu.utez.integradora.Model.Usuario;

import java.io.IOException;

@WebServlet(name="RegistrarUsuarioServlet", value="/sign_in")
public class RegistrarUsuarioServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Registro de usuario
        String operacion = req.getParameter("operacion");
        String ruta = "index.jsp";
        if (operacion.equals("registrar")) {
            String nombre_user = req.getParameter("nombre_usuario");
            String contra1_user = req.getParameter("pass1");
            String contra2_user = req.getParameter("pass2");
            String correo_user = req.getParameter("correo");
            int tipo_usuario = Integer.parseInt(req.getParameter("tipo_usuario"));
                //2) conectarme a la base de datos y buscar al usuario segun
                // las credenciales del form
                Usuario u = new Usuario();
                u.setNombre_usuario(nombre_user);
                System.out.println(nombre_user);
                u.setContra(contra1_user);
                u.setCorreo(correo_user);
                u.setTipo_usuario(tipo_usuario);
                UsuarioDao dao = new UsuarioDao();
                //Mandar una respuesta
                if (dao.insertUsuario(u)) {
                    //Mandar al usuario al inicio de sesión
                    req.getSession().setAttribute("mensaje","Si se registró");
                    req.getSession().setAttribute("name",nombre_user);
                    System.out.println("<p style=\"color: red;\">Ususario Registrado</p>");
                    ruta = "bienvenido.jsp";
                } else {
                    //Mandar un mensaje de errror y regesar al formulario de registro
                    req.getSession().setAttribute("mensaje","No se pudo registrar");
                    ruta = "index.jsp";
                    System.out.println("<p style=\"color: red;\">No se pudo, UnU</p>");
                }
        }else if (operacion.equals("actualizar")){
            //Actualizar usuario
            String nombre_usuario = req.getParameter("nombre_usuario");
            String pass = req.getParameter("pass");
            String correo = req.getParameter("correo");
            int tipo_usuario = Integer.parseInt(req.getParameter("tipo_usuario"));
            int id = Integer.parseInt(req.getParameter("id"));
            Usuario u = new Usuario();
            u.setNombre_usuario(nombre_usuario);
            u.setContra(pass);
            u.setCorreo(correo);
            u.setTipo_usuario(tipo_usuario);
            u.setId(id);

            UsuarioDao dao = new UsuarioDao();
            if(dao.update(u)){
                //Si se hizo el update
                ruta = "gestionUsuario.jsp";
                req.getSession().setAttribute("mensaje","Usuario Actualizado");
            }else{
                //pues no y mando un error
                req.getSession().setAttribute("mensaje","No se pudo actualizar");
                ruta = "index.jsp";
            }
        }
        resp.sendRedirect(ruta);
    }
    //configurar la clase para que sea servlet Ya
    //manejar el metodo dePost para obtener la info del formulario de registro Ya
    //usar el dao con el insert de una persona Ya?
    //una vez registreado el usuario, redirigir al index Ya
}