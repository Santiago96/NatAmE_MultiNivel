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
@Table(name="CIUDAD")
public class Ciudad implements Serializable{
    
    @Id
    @Column(name="idciudad")
    @SequenceGenerator(name = "seq_ciudad",sequenceName = "SEQ_CIUDAD_IDCIUDAD",allocationSize=1)
    @GeneratedValue(strategy=GenerationType.SEQUENCE,generator="seq_ciudad")
    private Long idCiudad;
    
    @Column(name="nombreciudad")
    private String nombreCiudad;
    
    @ManyToOne
    @JoinColumn(name = "idregion")
    private Region region;

    public Long getIdCiudad() {
        return idCiudad;
    }

    public void setIdCiudad(Long idCiudad) {
        this.idCiudad = idCiudad;
    }

    public String getNombreCiudad() {
        return nombreCiudad;
    }

    public void setNombreCiudad(String nombreCiudad) {
        this.nombreCiudad = nombreCiudad;
    }

    public Region getRegion() {
        return region;
    }

    public void setRegion(Region region) {
        this.region = region;
    }
    
    
    
}
