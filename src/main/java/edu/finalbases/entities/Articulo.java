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
public class Articulo {
    
    private int idProducto;
    private String nombreProducto;
    private String descripcion;
    private Categoria categoria;
    private Categoria subCategoria;
    
    private String path;
    
    private Pais pais;
    private Region region;
    private int cantidad;
    private float precioventa;

    public Articulo() {
    }
    
    

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }
    
    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripciion) {
        this.descripcion = descripcion;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }
    
     public Categoria getSubCategoria() {
        return subCategoria;
    }

    public void setSubCategoria(Categoria categoria) {
        this.subCategoria = categoria;
    }


    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
   
    public Pais getPais() {
        return pais;
    }

    public void setPais(Pais pais) {
        this.pais = pais;
    }
     public Region getRegion() {
        return region;
    }

    public void setRegion(Region region) {
        this.region = region;
    }
    
      public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    public float getPrecioVenta() {
        return precioventa;
    }

    public void setPrecioVenta(float precioventa) {
        this.precioventa = precioventa;
    }
    
    
    
    
    
}
