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
@Table(name="CATEGORIA")
public class Categoria implements Serializable{
    
    @Id
    @Column(name="idcategoria")
    @SequenceGenerator(name = "seq_categoria",sequenceName = "SEQ_CATEGORIA_IDCATEGORIA",allocationSize=1)
    @GeneratedValue(strategy=GenerationType.SEQUENCE,generator="seq_categoria")
    private Long idCategoria;
    
    @Column(name="nombrecategoria")
    private String nombreCategoria;
    
    @ManyToOne
    @JoinColumn(name = "idsubcategoria")
    private SubCategoria subCategoria;

    public Long getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(Long idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getNombreCategoria() {
        return nombreCategoria;
    }

    public void setNombreCategoria(String nombreCategoria) {
        this.nombreCategoria = nombreCategoria;
    }

    public SubCategoria getSubCategoria() {
        return subCategoria;
    }

    public void setSubCategoria(SubCategoria subCategoria) {
        this.subCategoria = subCategoria;
    }
    
}
