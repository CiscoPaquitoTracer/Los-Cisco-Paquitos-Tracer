package mx.edu.utez.integradorademopizza.Model;

import java.io.Serializable;

public class Ingrediente_Pizza implements Serializable
{
    private int id_Pizza;
    private int id_Ingrediente;

    public Ingrediente_Pizza()
    {
        //Constructor vacio
    }

    public Ingrediente_Pizza (int id_Pizza, int id_Ingrediente)
    {
        this.id_Pizza = id_Pizza;
        this.id_Ingrediente = id_Ingrediente;
    }

    //Getters y Setters

    public int getId_Ingrediente()
    {
        return id_Ingrediente;
    }

    public int getId_Pizza()
    {
        return id_Pizza;
    }

    public void setId_Ingrediente(int id_Ingrediente) {this.id_Ingrediente = id_Ingrediente;}

    public void setId_Pizza(int id_Pizza) {this.id_Pizza = id_Pizza;}
}
