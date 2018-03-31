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
public class Ciudad {
    
    private int idCiudad;    
    private String nombreCiudad;
    private Pais pais;
    private Region region;
        
    //Ok vale, finalizamos ?
    //Si, ya con esto puedo terminar la parte crear el select dinámicamente, ya la parte de verificar los campos ya está completada
    // que pena, creo que le borre algo de la vista.. bien emmm cuando finalice pues le comenta a sebas para que el haga el commit, que creo que el maneja git para ver que no genere algun error ok ?
    //Listo, no se si quiera verificar la parte que le acabé de comentar
    //si miremos
    public Ciudad() {
    }

    public int getIdCiudad() {
        return idCiudad;
    }

    public void setIdCiudad(int idCiudad) {
        this.idCiudad = idCiudad;
    }

    public String getNombreCiudad() {
        return nombreCiudad;
    }

    public void setNombreCiudad(String nombreCiudad) {
        this.nombreCiudad = nombreCiudad;
    }

    public Pais getPais() {
        return pais;
    }

    public void setPais(Pais pais) {
        this.pais = pais;
    }

    public Region getRegion() {
        return region;
    }

    public void setRegion(Region region) {
        this.region = region;
    }
    
    
    
    
    
    
}
