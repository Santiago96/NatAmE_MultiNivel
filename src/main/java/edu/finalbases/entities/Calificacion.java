/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.entities;

/**
 *
 * @author Santiago
 */
public class Calificacion {
    
    private int idCalificacion;
    private Persona cliente;
    private Persona representante;
    private int puntajeCalificacion;
    private String comentario;

    public Calificacion() {
    }

    public int getIdCalificacion() {
        return idCalificacion;
    }

    public void setIdCalificacion(int idCalificacion) {
        this.idCalificacion = idCalificacion;
    }

    public int getPuntajeCalificacion() {
        return puntajeCalificacion;
    }

    public void setPuntajeCalificacion(int puntajeCalificacion) {
        this.puntajeCalificacion = puntajeCalificacion;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public Persona getCliente() {
        return cliente;
    }

    public void setCliente(Persona cliente) {
        this.cliente = cliente;
    }

    public Persona getRepresentante() {
        return representante;
    }

    public void setRepresentante(Persona representante) {
        this.representante = representante;
    }
    
    
    
    
    
    
    
         
    
}
