package mx.edu.utez.integradorademopizza.Dao;

import mx.edu.utez.integradorademopizza.Model.Pizza;
import mx.edu.utez.integradorademopizza.Utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PizzaDao
{
    public Pizza getOne(int idPizza)
    {
        Pizza pixa = new Pizza();
        String query ="select nombre from pizza where id = ?";
        try{
            //1) conectarnos a la BD
            Connection con = DatabaseConnectionManager.getConnection();
            //2) Configurar el query y ejecutarlo
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,idPizza);
            ResultSet rs = ps.executeQuery();
            //3) Obtener la información
            if(rs.next()){
                //Entonces llenamos la información del usuario
                pixa.setIdPizza(rs.getInt("id"));
                pixa.setNombrePizza(rs.getString("nombrePizza"));
                pixa.setPrecioPizza(rs.getDouble("precioPizza"));
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return pixa;
    }
}
