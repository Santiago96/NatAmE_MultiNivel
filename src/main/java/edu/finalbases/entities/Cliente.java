/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.entities;

/**
 *
 * @author Santiago
 */
public class Cliente extends Persona{
    
    private Persona representante;

    public Cliente() {
    }
    

    public Cliente(int idPersona, String nombre, String apellido, char[] genero, Ciudad ciudad, Pais pais, Region region) {
        super(idPersona, nombre, apellido, genero, ciudad, pais, region);
        
    }

    public Persona getRepresentante() {
        return representante;
    }

    public void setRepresentante(Persona representante) {
        this.representante = representante;
    }
    
    
    
    
    
}
