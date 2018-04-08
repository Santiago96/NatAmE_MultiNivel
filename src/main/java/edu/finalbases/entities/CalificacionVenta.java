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
public class CalificacionVenta {
    
    
    private int idCalificacionVenta;
    private int calificacion;
    private String detalleCalificacion;
    private Venta venta;
    private Date fecha;

    public CalificacionVenta() {
    }

    public int getIdCalificacionVenta() {
        return idCalificacionVenta;
    }

    public void setIdCalificacionVenta(int idCalificacionVenta) {
        this.idCalificacionVenta = idCalificacionVenta;
    }

    public int getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(int calificacion) {
        this.calificacion = calificacion;
    }

    public String getDetalleCalificacion() {
        return detalleCalificacion;
    }

    public void setDetalleCalificacion(String detalleCalificacion) {
        this.detalleCalificacion = detalleCalificacion;
    }

    public Venta getVenta() {
        return venta;
    }

    public void setVenta(Venta venta) {
        this.venta = venta;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
    
    
    
    
    
}
