package mx.edu.utez.integradorademopizza.Model;

import java.io.Serializable;

public class Proveedor implements Serializable
{
    private int idProveedor;
    private String nombreProveedor;

    public Proveedor ()
    {
        //Constructor vacio
    }

    public Proveedor(int idProveedor, String nombreProveedor)
    {
        this.idProveedor = idProveedor;
        this.nombreProveedor = nombreProveedor;
    }

    public Proveedor(String nombreProveedo)
    {
        //Otro constructor, pero usará los valores entrantes
    }

    //Getters y Setters


    public int getIdProveedor()
    {
        return idProveedor;
    }

    public String getNombreProveedor()
    {
        return nombreProveedor;
    }

    public void setIdProveedor(int idProveedor) {this.idProveedor = idProveedor;}

    public void setNombreProveedor(String nombreProveedor) {this.nombreProveedor = nombreProveedor;}
}
