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
@Table(name="TIPOCONTACTO")
public class TipoContacto implements Serializable{
    
    @Id
    @Column(name="idtipocontacto")
    @SequenceGenerator(name = "seq_tipo_contacto",sequenceName = "SEQ_TIPOCTO_IDTIPOCTO",allocationSize=1)
    @GeneratedValue(strategy=GenerationType.SEQUENCE,generator="seq_tipo_contacto")
    private Long idTipoRepresentante;
    
    @Column(name="nombretipocontacto")
    private String nombreTipoContacto;

    public Long getIdTipoRepresentante() {
        return idTipoRepresentante;
    }

    public void setIdTipoRepresentante(Long idTipoRepresentante) {
        this.idTipoRepresentante = idTipoRepresentante;
    }

    public String getNombreTipoContacto() {
        return nombreTipoContacto;
    }

    public void setNombreTipoContacto(String nombreTipoContacto) {
        this.nombreTipoContacto = nombreTipoContacto;
    }
    
    
    
}
