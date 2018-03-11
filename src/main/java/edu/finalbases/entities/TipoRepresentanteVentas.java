/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.entities;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 *
 * @author Santiago
 */
@Entity
@Table(name="TIPOREPRESENTANTEVENTAS")
public class TipoRepresentanteVentas implements Serializable{
    
    @Id
    @Column(name="idtiporepresentante")
    @SequenceGenerator(name = "seq_tipo_representante",sequenceName = "SEQ_TIPORPTEVENTAS_IDTIPORPTE",allocationSize=1)
    @GeneratedValue(strategy=GenerationType.SEQUENCE,generator="seq_tipo_representante")
    private Long idTipoRepresentante;
    
    @Column(name="nombretiporepresentante")
    private String nombreTipoRepresentante;
    
    @Column(name="porcentaje")
    private BigDecimal porcentaje;

    public Long getIdTipoRepresentante() {
        return idTipoRepresentante;
    }

    public void setIdTipoRepresentante(Long idTipoRepresentante) {
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
