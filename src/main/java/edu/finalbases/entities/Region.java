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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
/**
 *
 * @author Santiago
 */
@Entity
@Table(name="REGION")
public class Region implements Serializable{
    
    
    @Id
    @Column(name="idregion")
    @SequenceGenerator(name = "seq_region",sequenceName = "SEQ_REGION_IDREGION",allocationSize=1)
    @GeneratedValue(strategy=GenerationType.SEQUENCE,generator="seq_region")
    private Long idRegion;
    
    @Column(name="nombreregion")
    private String nombreRegion;
    
    @ManyToOne
    @JoinColumn(name = "idpais")
    private Pais pais;

    public Long getIdRegion() {
        return idRegion;
    }

    public void setIdRegion(Long idRegion) {
        this.idRegion = idRegion;
    }

    public String getNombreRegion() {
        return nombreRegion;
    }

    public void setNombreRegion(String nombreRegion) {
        this.nombreRegion = nombreRegion;
    }

    public Pais getPais() {
        return pais;
    }

    public void setPais(Pais pais) {
        this.pais = pais;
    }
    
    
    
}
