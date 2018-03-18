/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.entities;

import java.math.BigDecimal;

/**
 *
 * @author Santiago
 */
public class TipoRepresentanteVentas {
    
    private int idTipoRepresentante;
    private String nombreTipoRepresentante;
    private BigDecimal porcentaje;

    public TipoRepresentanteVentas() {
    }

    public int getIdTipoRepresentante() {
        return idTipoRepresentante;
    }

    public void setIdTipoRepresentante(int idTipoRepresentante) {
        this.idTipoRepresentante = idTipoRepresentante;
    }

    public String getNombreTipoRepresentante() {
        return nombreTipoRepresentante;
    }

    public void setNombreTipoRepresentante(String nombreTipoRepresentante) {
        this.nombreTipoRepresentante = nombreTipoRepresentante;
    }

    public BigDecimal getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(BigDecimal porcentaje) {
        this.porcentaje = porcentaje;
    }
    
    
    
    
    
}
