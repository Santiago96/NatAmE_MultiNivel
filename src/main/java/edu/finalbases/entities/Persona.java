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
public class Persona {
    
    private Long idPersona;    
    private String nombre;    
    private String apellido;    
    private char[] genero;    
    private Ciudad ciudad;    
    private Pais pais;    
    private Region region;        
    private TipoRepresentanteVentas tipoRepVentas;
    private Persona id_rep_ventas;
    private Cargo cargo;
    private Date ultimaConexion;
    
    

    //Constructor para RepresentanteVentas
    public Persona(Long idPersona, String nombre, String apellido, char[] genero, Ciudad ciudad, Pais pais, Region region, TipoRepresentanteVentas tipoRepVentas, Cargo cargo, Date ultimaConexion) {
        this.idPersona = idPersona;
        this.nombre = nombre;
        this.apellido = apellido;
        this.genero = genero;
        this.ciudad = ciudad;
        this.pais = pais;
        this.region = region;
        this.tipoRepVentas = tipoRepVentas;        
        this.cargo = cargo;
        this.ultimaConexion = ultimaConexion;
    }
    
    //Constructor para clientes
    public Persona(Long idPersona, String nombre, String apellido, char[] genero, Ciudad ciudad, Pais pais, Region region,Persona id_rep_ventas) {
        this.idPersona = idPersona;
        this.nombre = nombre;
        this.apellido = apellido;
        this.genero = genero;
        this.ciudad = ciudad;
        this.pais = pais;
        this.region = region;
        this.id_rep_ventas = id_rep_ventas;
    }

    public Long getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(Long idPersona) {
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

    public TipoRepresentanteVentas getTipoRepVentas() {
        return tipoRepVentas;
    }

    public void setTipoRepVentas(TipoRepresentanteVentas tipoRepVentas) {
        this.tipoRepVentas = tipoRepVentas;
    }

    public Persona getId_rep_ventas() {
        return id_rep_ventas;
    }

    public void setId_rep_ventas(Persona id_rep_ventas) {
        this.id_rep_ventas = id_rep_ventas;
    }

    public Cargo getCargo() {
        return cargo;
    }

    public void setCargo(Cargo cargo) {
        this.cargo = cargo;
    }

    public Date getUltimaConexion() {
        return ultimaConexion;
    }

    public void setUltimaConexion(Date ultimaConexion) {
        this.ultimaConexion = ultimaConexion;
    }
    
    
    
}
