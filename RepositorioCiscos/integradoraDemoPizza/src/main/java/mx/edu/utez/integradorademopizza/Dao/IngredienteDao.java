package mx.edu.utez.integradorademopizza.Dao;

import mx.edu.utez.integradorademopizza.Model.Proveedor;
import mx.edu.utez.integradorademopizza.Utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class IngredienteDao
{
    public Proveedor getOne(int idProveedor)
    {
        Proveedor prov = new Proveedor();
        String query ="select nombre from proveedor where id = ?";
        //String query = "select * from ingredientes where nombre_Proveedor = '" + nombre_Proveedor + "'";
        try{
            //1) conectarnos a la BD
            Connection con = DatabaseConnectionManager.getConnection();
            //2) Configurar el query y ejecutarlo
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,idProveedor);
            ResultSet rs = ps.executeQuery();
            //3) Obtener la información
            if(rs.next()){
                //Entonces llenamos la información del usuario
                u.setNombre_usuario(rs.getString("nombre"));
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return prov;
    }
}
