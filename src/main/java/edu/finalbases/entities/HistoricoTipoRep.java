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
public class HistoricoTipoRep {
    
    private int idHistoricoTipoRep;
    private Persona representante;
    private TipoRepresentanteVentas tipoRep;
    private Date fechaCambio;

    public HistoricoTipoRep() {
    }

    public HistoricoTipoRep(int idHistoricoTipoRep, Persona representante, TipoRepresentanteVentas tipoRep, Date fechaCambio) {
        this.idHistoricoTipoRep = idHistoricoTipoRep;
        this.representante = representante;
        this.tipoRep = tipoRep;
        this.fechaCambio = fechaCambio;
    }

    public int getIdHistoricoTipoRep() {
        return idHistoricoTipoRep;
    }

    public void setIdHistoricoTipoRep(int idHistoricoTipoRep) {
        this.idHistoricoTipoRep = idHistoricoTipoRep;
    }

    public Persona getRepresentante() {
        return representante;
    }

    public void setRepresentante(Persona representante) {
        this.representante = representante;
    }

    public TipoRepresentanteVentas getTipoRep() {
        return tipoRep;
    }

    public void setTipoRep(TipoRepresentanteVentas tipoRep) {
        this.tipoRep = tipoRep;
    }

    public Date getFechaCambio() {
        return fechaCambio;
    }

    public void setFechaCambio(Date fechaCambio) {
        this.fechaCambio = fechaCambio;
    }
    
    
    
    
    
    
}
