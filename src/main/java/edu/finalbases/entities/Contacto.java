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
public class Contacto {
    
    private int idContacto;    
    private Persona idPersona;    
    private TipoContacto tipoContacto;
    private String detalleContacto;

    public Contacto() {
    }

    public int getIdContacto() {
        return idContacto;
    }

    public void setIdContacto(int idContacto) {
        this.idContacto = idContacto;
    }

    public Persona getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(Persona idPersona) {
        this.idPersona = idPersona;
    }

    public TipoContacto getTipoContacto() {
        return tipoContacto;
    }

    public void setTipoContacto(TipoContacto tipoContacto) {
        this.tipoContacto = tipoContacto;
    }

    public String getDetalleContacto() {
        return detalleContacto;
    }

    public void setDetalleContacto(String detalleContacto) {
        this.detalleContacto = detalleContacto;
    }
    
    
    
}
