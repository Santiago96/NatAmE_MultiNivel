/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.entities;

import java.util.Date;

/**
 *
 * @author Santiago
 */
public abstract class Persona {
    
    protected int idPersona;    
    protected String nombre;    
    protected String apellido;    
    protected char[] genero;    
    protected Ciudad ciudad;    
    protected Pais pais;    
    protected Region region;       
    protected Date ultimaConexion;
    

    public Persona() {
    }
    
    public Persona(int idP) {
        this.idPersona = idP;
    }
    
    //Constructor para clientes
    public Persona(int idPersona, String nombre, String apellido, char[] genero, Ciudad ciudad, Pais pais, Region region) {
        this.idPersona = idPersona;
        this.nombre = nombre;
        this.apellido = apellido;
        this.genero = genero;
        this.ciudad = ciudad;
        this.pais = pais;
        this.region = region;
        
    }

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public char[] getGenero() {
        return genero;
    }

    public void setGenero(char[] genero) {
        this.genero = genero;
    }

    public Ciudad getCiudad() {
        return ciudad;
    }

    public void setCiudad(Ciudad ciudad) {
        this.ciudad = ciudad;
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
    public Date getUltimaConexion() {
        return ultimaConexion;
    }

    public void setUltimaConexion(Date ultimaConexion) {
        this.ultimaConexion = ultimaConexion;
    }
    
    
}
