package mx.edu.utez.integradorademopizza.Dao;

import mx.edu.utez.integradorademopizza.Model.Ingrediente_Pizza;
import mx.edu.utez.integradorademopizza.Utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Ingred_PizzaDao
{
    public Ingrediente_Pizza getOne(int idIngrediente, int idPizza)
    {
        Ingrediente_Pizza ipi = new Ingrediente_Pizza();
        String query ="select * from pizza_ingrediente where id_pizza = ? and idIngrediente = ?";
        //String query = "select * from ingredientes where nombre_Proveedor = '" + nombre_Proveedor + "'";
        try{
            //1) conectarnos a la BD
            Connection con = DatabaseConnectionManager.getConnection();
            //2) Configurar el query y ejecutarlo
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,idIngrediente);
            ps.setInt(2,idPizza);
            ResultSet rs = ps.executeQuery();
            //3) Obtener la información
            if(rs.next()){
                //Entonces llenamos la información del usuario
                ipi.setId_Ingrediente(rs.getInt("id_ingrediente"));
                ipi.setId_Pizza(rs.getInt("id_pizza"));
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return ipi;
    }
}
