package mx.edu.utez.integradorademopizza.Dao;

import mx.edu.utez.integradorademopizza.Model.Ingrediente;
import mx.edu.utez.integradorademopizza.Model.Proveedor;
import mx.edu.utez.integradorademopizza.Utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class IngredienteDao
{
    public Ingrediente getOne(int idIngrediente)
    {
        Ingrediente ingre = new Ingrediente();
        String query ="select nombre, proveedor from ingrediente where id = ?";
        String query2 ="update ingrediente set proveedor = (select nombre from proveedor where idProveedor = ?) where id = ?";
        //String query = "select * from ingredientes where nombre_Proveedor = '" + nombre_Proveedor + "'";
        try{
            //1) conectarnos a la BD
            Connection con = DatabaseConnectionManager.getConnection();
            //2) Configurar el query y ejecutarlo
            PreparedStatement ps = con.prepareStatement(query);
            PreparedStatement psi = con.prepareStatement(query2);
            ps.setInt(1,idIngrediente);
            ResultSet rs = ps.executeQuery();
            ResultSet rs2 = psi.executeQuery();
            //3) Obtener la información
            if(rs.next()){
                //Entonces llenamos la información del usuario
                ingre.setIdIngrediente(rs.getInt("id"));
                ingre.setNombreIngrediente(rs.getString("nombreIngrediente"));
                ingre.setProveedorIngrediente(rs.getInt("ProveedorIngrediente"));
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return ingre;
    }
}
