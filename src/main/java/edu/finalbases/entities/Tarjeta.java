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
public class Tarjeta {
    
    private int idTarjeta;
    private String nombreTarjeta;

    public Tarjeta() {
    }

    public Tarjeta(int idTarjeta, String nombreTarjeta) {
        this.idTarjeta = idTarjeta;
        this.nombreTarjeta = nombreTarjeta;
    }

    public int getIdTarjeta() {
        return idTarjeta;
    }

    public void setIdTarjeta(int idTarjeta) {
        this.idTarjeta = idTarjeta;
    }

    public String getNombreTarjeta() {
        return nombreTarjeta;
    }

    public void setNombreTarjeta(String nombreTarjeta) {
        this.nombreTarjeta = nombreTarjeta;
    }
    
    
    
    
    
    

    
}