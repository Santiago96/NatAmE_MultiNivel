/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.entities;

import java.io.Serializable;
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
@Table(name="CARGO")
public class Cargo implements Serializable{
    @Id
    @Column(name="idcargo")
    @SequenceGenerator(name = "seq_cargo",sequenceName = "SEQ_CARGO_IDCARGO",allocationSize=1)
    @GeneratedValue(strategy=GenerationType.SEQUENCE,generator="seq_cargo")
    private Long idCargo;
    
    @Column(name="detallecargo")
    private String detalleCargo;

    public Long getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(Long idCargo) {
        this.idCargo = idCargo;
    }

    public String getDetalleCargo() {
        return detalleCargo;
    }

    public void setDetalleCargo(String detalleCargo) {
        this.detalleCargo = detalleCargo;
    }    
}
