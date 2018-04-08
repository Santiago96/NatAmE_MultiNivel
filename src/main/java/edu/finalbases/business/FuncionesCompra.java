/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.business;

import edu.finalbases.entities.DetalleVenta;
import edu.finalbases.entities.Persona;
import edu.finalbases.entities.Producto;
import edu.finalbases.entities.Venta;
import edu.finalbases.repositoryDAO.BancoDAO;
import edu.finalbases.repositoryDAO.ClienteDAO;
import edu.finalbases.repositoryDAO.DetalleVentaDAO;
import edu.finalbases.repositoryDAO.ItemDAO;
import edu.finalbases.repositoryDAO.ProductoDAO;
import edu.finalbases.repositoryDAO.RepresentanteVentasDAO;
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
    private ClienteDAO clienteDAO;
    private RepresentanteVentasDAO representanteDAO;    
    private BancoDAO bancoDAO;
    private DetalleVentaDAO detalleVDAO;
    private ItemDAO itemDAO;

    private FuncionesCompra() {
        productoDAO = new ProductoDAO();
        clienteDAO = new ClienteDAO();        
        bancoDAO = new BancoDAO();        
        ventaDAO = new VentaDAO();
        detalleVDAO = new DetalleVentaDAO();
        itemDAO = new ItemDAO();
        representanteDAO = new RepresentanteVentasDAO();
    }
    

    public static FuncionesCompra getFuncionesCompra() {
        if (funcionesCompra == null) {
            funcionesCompra = new FuncionesCompra();
        }
        return funcionesCompra;
    }

    public synchronized int generarPago(JSONObject informacion) throws SQLException {
        DetalleVenta detalleVenta;
        Venta venta = obtenerVenta(informacion);
        if (venta != null) {
            //j1016065965
            if (ventaDAO.crear(venta) == 1) {//Se insertan todos los productos en detalleVenta
                JSONObject productosJSON = informacion.getJSONObject("productos");            
                for (int i = 0; i < productosJSON.length(); i++) {
                    //System.out.println("P: " + productosJSON.getJSONObject(String.valueOf(i)));
                    detalleVenta = obtenerDetalleVenta(productosJSON.getJSONObject(String.valueOf(i)),venta.getIdVenta());
                    detalleVDAO.crear(detalleVenta);
                    itemDAO.restarItem(detalleVenta.getProducto().getIdProducto(), venta.getCliente().getRegion().getIdRegion(),detalleVenta.getCantidad());
                }
                return 1;
            }
            return 0;
        }
        return 1;
    }

    private List<Producto> obtenerProductos() throws SQLException {
        List<Producto> productosComprados = new ArrayList();
        productosComprados.add((Producto) productoDAO.getObjectById(0));
        return productosComprados;

    }

    private Venta obtenerVenta(JSONObject informacion) throws SQLException {
        
        //int idVenta = ventaDAO.getSequence();
        //System.out.println("IDventa generado: "+idVenta);
        Persona rep = (Persona) representanteDAO.getObjectById(informacion.getInt("idrv"));
        Persona cliente = (Persona) representanteDAO.getObjectById(informacion.getInt("idcliente"));
        double totalT = informacion.getDouble("totalTodo");
        //TipoPago tipoPago = (TipoPago) tipoPagoDAO.getObjectById(informacion.getInt("idtipopago"));        
        

        return new Venta(totalT, rep, cliente);
    }

    private DetalleVenta obtenerDetalleVenta(JSONObject infoP,int idVenta) throws SQLException {
        DetalleVenta detalleVenta = new DetalleVenta();
        detalleVenta.setVenta(new Venta(ventaDAO.getSequenceIdVenta()));
        detalleVenta.setProducto(new Producto(infoP.getInt("id")));
        detalleVenta.setCantidad(infoP.getInt("cantidad"));
        detalleVenta.setPrecioTotal(infoP.getDouble("preciototal"));

        return detalleVenta;
    }

    public ProductoDAO getProductoDAO() {
        return productoDAO;
    }

    public VentaDAO getVentaDAO() {
        return ventaDAO;
    }

    public ClienteDAO getClienteDAO() {
        return clienteDAO;
    }

    public RepresentanteVentasDAO getRepresentanteDAO() {
        return representanteDAO;
    }

    public BancoDAO getBancoDAO() {
        return bancoDAO;
    }

    public DetalleVentaDAO getDetalleVDAO() {
        return detalleVDAO;
    }

    public ItemDAO getItemDAO() {
        return itemDAO;
    }
    
    

}