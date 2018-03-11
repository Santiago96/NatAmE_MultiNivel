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
@Table(name="ESTADOVENTA")
public class EstadoVenta implements Serializable{
    
    @Id
    @Column(name="idestadoventa")
    @SequenceGenerator(name = "seq_estado_venta",sequenceName = "SEQ_ESTADOVENTA_IDESTADOVENTA",allocationSize=1)
    @GeneratedValue(strategy=GenerationType.SEQUENCE,generator="seq_estado_venta")
    private Long idEstadoVenta;
    
    @Column(name="nombreestadoventa")
    private String nombreEstadoVenta;

    public Long getIdEstadoVenta() {
        return idEstadoVenta;
    }

    public void setIdEstadoVenta(Long idEstadoVenta) {
        this.idEstadoVenta = idEstadoVenta;
    }

    public String getNombreEstadoVenta() {
        return nombreEstadoVenta;
    }

    public void setNombreEstadoVenta(String nombreEstadoVenta) {
        this.nombreEstadoVenta = nombreEstadoVenta;
    }
}
