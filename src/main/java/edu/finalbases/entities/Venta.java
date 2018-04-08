/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.entities;

import java.util.Date;

/**
 *
 * @author Santiago
 */
public class Venta {
    
    private int idVenta;
    private Date fechaVenta;
    private double total;
    private Persona representante;
    private Persona cliente;


    public Venta() {
    
    }
    public Venta(int idVenta){
        this.idVenta = idVenta;
    }

    public Venta(int idVenta,double total, Persona representante, Persona cliente) {
        this.idVenta = idVenta;
        this.total = total;
        this.representante = representante;
        this.cliente = cliente;
        
    }
    public Venta(double total, Persona representante, Persona cliente) {
        
        this.total = total;
        this.representante = representante;
        this.cliente = cliente;
        
    }
    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public Date getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(Date fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Persona getRepresentante() {
        return representante;
    }

    public void setRepresentante(Persona representante) {
        this.representante = representante;
    }

    public Persona getCliente() {
        return cliente;
    }

    public void setCliente(Persona cliente) {
        this.cliente = cliente;
    }
    
}