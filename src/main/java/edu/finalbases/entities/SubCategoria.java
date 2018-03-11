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
@Table(name="SUBCATEGORIA")
public class SubCategoria implements Serializable{
    
    
    @Id
    @Column(name="idsubcategoria")
    @SequenceGenerator(name = "seq_sub_categoria",sequenceName = "SEQ_SUBCRIA_IDSUBCRIA",allocationSize=1)
    @GeneratedValue(strategy=GenerationType.SEQUENCE,generator="seq_sub_categoria")
    private Long idSubCategoria;
    
    @Column(name="nombresubcategoria")
    private String nombreSubCategoria;

    public Long getIdSubCategoria() {
        return idSubCategoria;
    }

    public void setIdSubCategoria(Long idSubCategoria) {
        this.idSubCategoria = idSubCategoria;
    }

    public String getNombreSubCategoria() {
        return nombreSubCategoria;
    }

    public void setNombreSubCategoria(String nombreSubCategoria) {
        this.nombreSubCategoria = nombreSubCategoria;
    }
    
    
    
}
