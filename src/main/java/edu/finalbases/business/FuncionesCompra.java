/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.business;

import edu.finalbases.entities.Producto;
import edu.finalbases.repositoryDAO.ProductoDAO;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;

/**
 *
 * @author Santiago
 */
public class FuncionesCompra {
    
    private static FuncionesCompra funcionesCompra;
    
    private ProductoDAO productoDAO;

    private FuncionesCompra() {
        productoDAO = new ProductoDAO();
    }
    
    public static FuncionesCompra getFuncionesCompra(){
        if(funcionesCompra==null){
            funcionesCompra = new FuncionesCompra();
        }
        return funcionesCompra;
    }

    public int generarPago(JSONObject informacion) {
        
        
        return 1;
    }
    
    private List<Producto> obtenerProductos() throws SQLException{
        List<Producto> productosComprados = new ArrayList();
        productosComprados.add((Producto)productoDAO.getObjectById(0));
        
        
        return productosComprados;
                
    }
    
    
    
}
