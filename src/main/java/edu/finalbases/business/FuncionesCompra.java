/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.business;

import edu.finalbases.entities.Banco;
import edu.finalbases.entities.EstadoVenta;
import edu.finalbases.entities.Persona;
import edu.finalbases.entities.Producto;
import edu.finalbases.entities.TipoPago;
import edu.finalbases.entities.Venta;
import edu.finalbases.repositoryDAO.BancoDAO;
import edu.finalbases.repositoryDAO.EstadoVentaDAO;
import edu.finalbases.repositoryDAO.PersonaDAO;
import edu.finalbases.repositoryDAO.ProductoDAO;
import edu.finalbases.repositoryDAO.TipoPagoDAO;
import edu.finalbases.repositoryDAO.VentaDAO;
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
    private VentaDAO ventaDAO;
    private PersonaDAO personaDAO;
    private TipoPagoDAO tipoPagoDAO;
    private BancoDAO bancoDAO;
    private EstadoVentaDAO estadoVentaDAO;

    private FuncionesCompra() {
        productoDAO = new ProductoDAO();
        personaDAO = new PersonaDAO();
        tipoPagoDAO = new TipoPagoDAO();
        bancoDAO = new BancoDAO();
        estadoVentaDAO = new EstadoVentaDAO();
        ventaDAO = new VentaDAO();
    }
    
    public static FuncionesCompra getFuncionesCompra(){
        if(funcionesCompra==null){
            funcionesCompra = new FuncionesCompra();
        }
        return funcionesCompra;
    }

    public int generarPago(JSONObject informacion) throws SQLException {
        Venta venta = obtenerVenta(informacion);
        if(venta!=null){
            if(ventaDAO.crear(venta)==1){//Se insertan todos los productos en detalleVenta
                return 1;
            }
            return 0;
        }
        
        return 1;
    }
    
    private List<Producto> obtenerProductos() throws SQLException{
        List<Producto> productosComprados = new ArrayList();
        productosComprados.add((Producto)productoDAO.getObjectById(0));
        
        
        return productosComprados;
                
    }

    private Venta obtenerVenta(JSONObject informacion) throws SQLException {
        Persona rep = (Persona) personaDAO.getObjectById(informacion.getInt("idrv"));
        Persona cliente = (Persona) personaDAO.getObjectById(informacion.getInt("idcliente"));
        double totalT = informacion.getDouble("totalTodo");
        TipoPago tipoPago = (TipoPago) tipoPagoDAO.getObjectById(informacion.getInt("idtipopago"));
        Banco banco = (Banco) bancoDAO.getObjectById(informacion.getInt("idbanco"));
        EstadoVenta estadoVenta = (EstadoVenta) estadoVentaDAO.getObjectById(1);
        
        
        return new Venta(totalT,rep,cliente,tipoPago,banco,estadoVenta);
    }
    
    
    
}
