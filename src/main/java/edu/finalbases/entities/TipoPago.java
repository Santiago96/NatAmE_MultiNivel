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
@Table(name="TIPOPAGO")
public class TipoPago implements Serializable{
    
    @Id
    @Column(name="idtipopago")
    @SequenceGenerator(name = "seq_tipo_pago",sequenceName = "SEQ_TIPOPAGO_IDTIPOPAGO",allocationSize=1)
    @GeneratedValue(strategy=GenerationType.SEQUENCE,generator="seq_tipo_pago")
    private Long idTipoPago;
    
    @Column(name="nombretipopago")
    private String nombreTipoPago;

    public Long getIdTipoPago() {
        return idTipoPago;
    }

    public void setIdTipoPago(Long idTipoPago) {
        this.idTipoPago = idTipoPago;
    }

    public String getNombreTipoPago() {
        return nombreTipoPago;
    }

    public void setNombreTipoPago(String nombreTipoPago) {
        this.nombreTipoPago = nombreTipoPago;
    }
    
    
    
    
}
