package mx.edu.utez.integradorademopizza.Model;

import java.io.Serializable;

public class Pizza implements Serializable
{
    private int idPizza;
    private String nombrePizza;
    private double precioPizza;

    public Pizza ()
    {
        //Constructor vacio
    }

    public Pizza(int idPizza, String nombrePizza, double precioPizza)
    {
        this.idPizza = idPizza;
        this.nombrePizza = nombrePizza;
        this.precioPizza = precioPizza;
    }

    public Pizza(String nombrePizza, double precioPizza)
    {
        //Otro constructor, pero usará los valores entrantes
    }

    //Getters y Setters

    public int getIdPizza()
    {
        return idPizza;
    }

    public String getNombrePizza()
    {
        return nombrePizza;
    }

    public double getPrecioPizza()
    {
        return precioPizza;
    }

    public void setIdPizza(int idPizza) {this.idPizza = idPizza;}

    public void setNombrePizza(String nombrePizza) {this.nombrePizza = nombrePizza;}

    public void setPrecioPizza(double precioPizza) {this.precioPizza = precioPizza;}
}
