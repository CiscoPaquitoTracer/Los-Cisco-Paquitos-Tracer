package mx.edu.utez.integradorademopizza.Model;

import java.io.Serializable;

public class Ingrediente implements Serializable
{
    private int idIngrediente;
    private String nombreIngrediente;
    private int proveedorIngrediente;

    public Ingrediente()
    {
        //Constructor vacio
    }

    public Ingrediente(int idIngrediente, String nombreIngrediente, int proveedorIngrediente)
    {
        this.idIngrediente = idIngrediente;
        this.nombreIngrediente = nombreIngrediente;
        this.proveedorIngrediente = proveedorIngrediente;
    }

    public Ingrediente(String nombreIngrediente, int proveedorIngrediente)
    {
        //Otro constructor, pero usará los valores entrantes
    }

    //Getters y Setters

    public int getIdIngrediente()
    {
        return idIngrediente;
    }

    public String getNombreIngrediente()
    {
        return nombreIngrediente;
    }

    public double getPrecioIngrediente()
    {
        return proveedorIngrediente;
    }

    public void setIdIngrediente(int idIngrediente){this.idIngrediente = idIngrediente;}

    public void setNombreIngrediente(String nombreIngrediente) {this.nombreIngrediente = nombreIngrediente;}

    public void setProveedorIngrediente(int proveedorIngrediente) {this.proveedorIngrediente = proveedorIngrediente;}
}
