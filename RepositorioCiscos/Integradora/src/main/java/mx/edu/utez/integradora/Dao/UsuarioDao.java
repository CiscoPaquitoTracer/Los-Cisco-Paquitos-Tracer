package mx.edu.utez.integradora.Dao;


import mx.edu.utez.integradora.Model.Usuario;
import mx.edu.utez.integradora.Utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

// Estas clases DAO permiten el uso de funciones CRUD
public class UsuarioDao {

    //Programar una función R (lectura) para obtener un usuario
    //con el fin de hacer el inicio de sesión
    public Usuario getOne(String correo_usuario, String contra){
        Usuario u = new Usuario();
        String query = "select * from usuarios where correo = ? and contra = sha2(?,256)";

        try{
            //1) conectarnos a la BD
            Connection con = DatabaseConnectionManager.getConnection();
            //2) Configurar el query y ejecutarlo
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,correo_usuario);
            ps.setString(2,contra);
            ResultSet rs = ps.executeQuery();
            //3) Obtener la información
            if(rs.next()){
                //Entonces llenamos la información del usuario
                u.setNombre_usuario(rs.getString("nombre"));
                u.setContra(rs.getString("contra"));
                u.setCorreo(rs.getString("correo"));
                u.setTipo_usuario(rs.getInt("tipo_cuenta"));
                u.setEstado(rs.getBoolean("estado"));
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return u;
    }

    public ArrayList<Usuario> getAll(){
        ArrayList<Usuario> Lista = new ArrayList<>();
        String query = "select * from usuarios";

        try{
            //1) conectarnos a la BD
            Connection con = DatabaseConnectionManager.getConnection();
            //2) Configurar el query y ejecutarlo
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            //3) Obtener la información
            while (rs.next()){
                Usuario u = new Usuario();
                //Entonces llenamos la información del usuario
                u.setId(rs.getInt("id"));
                u.setNombre_usuario(rs.getString("nombre"));
                u.setContra(rs.getString("contra"));
                u.setCorreo(rs.getString("correo"));
                u.setTipo_usuario(rs.getInt("tipo_cuenta"));
                u.setEstado(rs.getBoolean("estado"));
                Lista.add(u);
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return Lista;
    }

    public boolean insertUsuario(Usuario u)
    {
        boolean respuesta = false;
        String query = "insert into usuarios(nombre,contra,correo,tipo_cuenta)values(?,sha2(?,256),?,?)";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,u.getNombre_usuario());
            ps.setString(2,u.getContra());
            ps.setString(3,u.getCorreo());
            ps.setInt(4,u.getTipo_usuario());
            if(ps.executeUpdate()==1){
                respuesta = true;
            }
            ps.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return respuesta;
    }

    public Usuario getOne(int id)
    {
        Usuario u = new Usuario();
        String query = "select * from usuarios where id = ?";
        try{
            PreparedStatement ps = DatabaseConnectionManager.getConnection().prepareStatement(query);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                u.setId(rs.getInt("id"));
                u.setNombre_usuario(rs.getString("nombre_usuario"));
                u.setContra(rs.getString("contra"));
                u.setCorreo(rs.getString("correo"));
                u.setTipo_usuario(rs.getInt("tipo_usuario"));
                u.setEstado(rs.getBoolean("estado"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return u;
    }

    public Usuario getEmail(String correo){
        Usuario u = new Usuario();
        String query = "select * from usuarios where correo = ?";

        try{
            //1) conectarnos a la BD
            Connection con = DatabaseConnectionManager.getConnection();
            //2) Configurar el query y ejecutarlo
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,correo);
            ResultSet rs = ps.executeQuery();
            //3) Obtener la información
            if(rs.next()){
                //Entonces llenamos la información del usuario
                u.setNombre_usuario(rs.getString("nombre_usuario"));
                u.setCorreo(rs.getString("correo"));
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return u;
    }

    public boolean update(Usuario u) {
        boolean respuesta = false;
        String query = "update usuarios set nombre = ?, contra = sha2(?,256), correo = ?, tipo_cuenta = ? where id = ?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,u.getNombre_usuario());
            ps.setString(2,u.getContra());
            ps.setString(3,u.getCorreo());
            ps.setInt(4,u.getTipo_usuario());
            ps.setInt(5,u.getId());
            if(ps.executeUpdate()>0){
                respuesta = true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return respuesta;
    }

    public boolean delete (Usuario u){
        boolean respuesta = false;
        String query = "delete from usuarios where id = ?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,u.getId());
            System.out.println(u.getId());
            if(ps.executeUpdate()>0){
                respuesta = true;
            }
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return respuesta;
    }

    public boolean insertCod(String codigo, String correo)
    {
        boolean respuesta = false;
        String query = "update usuarios set codigoVerif = ? where correo = ?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,codigo);
            ps.setString(2,correo);
            if(ps.executeUpdate()>0){
                respuesta = true;

            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return respuesta;
    }

    public boolean updatePass(String contra, String codigo) {
        boolean respuesta = false;
        String query = "update usuarios set contra = sha2(?,256) where codigoVerif = ?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,contra);
            ps.setString(2,codigo);
            if(ps.executeUpdate()>0){
                respuesta = true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return respuesta;
    }

    public boolean findCodigo(String codigo) {
        boolean respuesta = false;
        Usuario usr = new Usuario();
        String query = "select * from usuarios where codigoverif = ?";
        try {
            PreparedStatement ps = DatabaseConnectionManager.getConnection().prepareStatement(query);
            ps.setString(1,codigo);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                respuesta = true;
                usr.setId(rs.getInt("id"));
                usr.setCorreo(rs.getString("correo"));
                usr.setContra(rs.getString("contra"));
                usr.setCodigo_usuario(rs.getString("codigo_verif"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return respuesta;
    }
}
