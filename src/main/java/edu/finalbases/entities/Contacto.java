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
@Table(name="CONTACTO")
public class Contacto implements Serializable{
    
    @Id
    @Column(name="idcontacto")
    @SequenceGenerator(name = "seq_contacto",sequenceName = "SEQ_CONTACTO_IDCONTACTO",allocationSize=1)
    @GeneratedValue(strategy=GenerationType.SEQUENCE,generator="seq_contacto")
    private Long idContacto;
    
    
    @ManyToOne
    @JoinColumn(name = "idpersona")
    private Persona idPersona;
    
    @ManyToOne
    @JoinColumn(name = "idtipocontacto")
    private TipoContacto tipoContacto;
    
    
    @Column(name="detallecontacto")
    private String detalleContacto;

    public Long getIdContacto() {
        return idContacto;
    }

    public void setIdContacto(Long idContacto) {
        this.idContacto = idContacto;
    }

    public Persona getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(Persona idPersona) {
        this.idPersona = idPersona;
    }

    public TipoContacto getTipoContacto() {
        return tipoContacto;
    }

    public void setTipoContacto(TipoContacto tipoContacto) {
        this.tipoContacto = tipoContacto;
    }

    public String getDetalleContacto() {
        return detalleContacto;
    }

    public void setDetalleContacto(String detalleContacto) {
        this.detalleContacto = detalleContacto;
    }
    
    

    
}
