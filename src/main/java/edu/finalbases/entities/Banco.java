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
@Table(name="BANCO")
public class Banco implements Serializable {
    
    @Id
    @Column(name="idbanco")
    @SequenceGenerator(name = "seq_banco",sequenceName = "SEQ_BANCO_IDBANCO",allocationSize=1)
    @GeneratedValue(strategy=GenerationType.SEQUENCE,generator="seq_banco")
    private Long idBanco;
    
    @Column(name="nombrebanco")
    private String nombreBanco;

    public Long getIdBanco() {
        return idBanco;
    }

    public void setIdBanco(Long idBanco) {
        this.idBanco = idBanco;
    }

    public String getNombreBanco() {
        return nombreBanco;
    }

    public void setNombreBanco(String nombreBanco) {
        this.nombreBanco = nombreBanco;
    }
    
    
    
    
}
