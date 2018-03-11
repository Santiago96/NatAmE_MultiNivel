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
@Table(name="PAIS")
public class Pais implements Serializable{
    
    @Id
    @Column(name="idpais")
    @SequenceGenerator(name = "seq_pais",sequenceName = "SEQ_PAIS_IDPAIS",allocationSize=1)
    @GeneratedValue(strategy=GenerationType.SEQUENCE,generator="seq_pais")
    private Long idPais;
    
    @Column(name="nombrepais")
    private String nombrePais;

    public Long getIdPais() {
        return idPais;
    }

    public void setIdPais(Long idPais) {
        this.idPais = idPais;
    }

    public String getNombrePais() {
        return nombrePais;
    }

    public void setNombrePais(String nombrePais) {
        this.nombrePais = nombrePais;
    }
}
