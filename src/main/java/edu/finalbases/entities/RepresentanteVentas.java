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
public class RepresentanteVentas extends Persona{
    
    
    private int director;
    private TipoRepresentanteVentas tipoRepresentante;

    public RepresentanteVentas(int idPesona) {
        super(idPesona);
        
    }
    
    

    public RepresentanteVentas(int director, int idPersona, String nombre, String apellido, char[] genero, Ciudad ciudad, Pais pais, Region region) {
        super(idPersona, nombre, apellido, genero, ciudad, pais, region);
        this.director = director;
    }

    public RepresentanteVentas() {
        
    }

    
    public int getDirector() {
        return director;
    }

    public void setDirector(int director) {
        this.director = director;
    }

    public TipoRepresentanteVentas getTipoRepresentante() {
        return tipoRepresentante;
    }

    public void setTipoRepresentante(TipoRepresentanteVentas tipoRepresentante) {
        this.tipoRepresentante = tipoRepresentante;
    }
    
    
    
    
    
}
