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
public class Stock {
    
    private int idStock;
    private Region region;
    private Pais pais;
    private String direccionPais;

    public Stock() {
    }

    public int getIdStock() {
        return idStock;
    }

    public void setIdStock(int idStock) {
        this.idStock = idStock;
    }

    public Region getRegion() {
        return region;
    }

    public void setRegion(Region region) {
        this.region = region;
    }

    public Pais getPais() {
        return pais;
    }

    public void setPais(Pais pais) {
        this.pais = pais;
    }

    public String getDireccionPais() {
        return direccionPais;
    }

    public void setDireccionPais(String direccionPais) {
        this.direccionPais = direccionPais;
    }
    
    
    
}
