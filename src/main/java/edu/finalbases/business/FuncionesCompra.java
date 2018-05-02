/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.business;

import edu.finalbases.entities.Banco;
import edu.finalbases.entities.CalificacionVenta;
import edu.finalbases.entities.DetallePago;
import edu.finalbases.entities.DetalleVenta;
import edu.finalbases.entities.Persona;
import edu.finalbases.entities.Producto;
import edu.finalbases.entities.Tarjeta;
import edu.finalbases.entities.Venta;
import edu.finalbases.repositoryDAO.BancoDAO;
import edu.finalbases.repositoryDAO.CalificacionVentaDAO;
import edu.finalbases.repositoryDAO.ClienteDAO;
import edu.finalbases.repositoryDAO.DetallePagoDAO;
import edu.finalbases.repositoryDAO.DetalleVentaDAO;
import edu.finalbases.repositoryDAO.FException;
import edu.finalbases.repositoryDAO.ItemDAO;
import edu.finalbases.repositoryDAO.ProductoDAO;
import edu.finalbases.repositoryDAO.RepresentanteVentasDAO;
import edu.finalbases.repositoryDAO.TarjetaDAO;
import edu.finalbases.repositoryDAO.VentaDAO;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
    private CalificacionVentaDAO calificacionDAO;
    private DetallePagoDAO detallePDAO;
    private TarjetaDAO tarjetaDAO;

    private FuncionesCompra() {
        productoDAO = new ProductoDAO();
        clienteDAO = new ClienteDAO();        
        bancoDAO = new BancoDAO();        
        ventaDAO = new VentaDAO();
        detalleVDAO = new DetalleVentaDAO();
        itemDAO = new ItemDAO();
        representanteDAO = new RepresentanteVentasDAO();
        calificacionDAO = new CalificacionVentaDAO();
        detallePDAO = new DetallePagoDAO();
        tarjetaDAO = new TarjetaDAO();
    }
    

    public static FuncionesCompra getFuncionesCompra() {
        if (funcionesCompra == null) {
            funcionesCompra = new FuncionesCompra();
        }
        return funcionesCompra;
    }
    
    public synchronized int generarCalificacion(JSONObject informacion) throws SQLException, FException{
        CalificacionVenta calificacion = obtenerCalificacion(informacion);
        if(calificacion != null){
            return calificacionDAO.crear(calificacion);
        }else{
            System.out.println("Error obteniendo calificacion");
            return 0;                    
        }
    }

    public synchronized int generarPago(JSONObject informacion) throws SQLException, FException, ParseException {
        DetalleVenta detalleVenta;
        DetallePago detallePago;
        Venta venta = obtenerVenta(informacion);
        System.out.println("CLIENTE" + venta.getCliente().getIdPersona());
        if (venta != null) {
            try {
                //j1016065965
                if (ventaDAO.crear(venta) == 1) {//Se insertan todos los productos en detalleVenta
                    JSONObject productosJSON = informacion.getJSONObject("productos");
                    detallePago = obtenerDetallePago(informacion);
                    if(detallePDAO.crear(detallePago)==1){
                        for (int i = 0; i < productosJSON.length(); i++) {
                            //System.out.println("P: " + productosJSON.getJSONObject(String.valueOf(i)));
                            detalleVenta = obtenerDetalleVenta(productosJSON.getJSONObject(String.valueOf(i)),venta.getIdVenta());
                            detalleVDAO.crear(detalleVenta);
                            itemDAO.restarItem(detalleVenta.getProducto().getIdProducto(), venta.getCliente().getRegion().getIdRegion(),detalleVenta.getCantidad());
                        }
                    }
                    
                    return 1;
                }
            } catch (FException ex) {
                throw ex;
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
        Persona cliente = (Persona) clienteDAO.getObjectById(informacion.getInt("idcliente"));
        
         System.out.println("idv" + rep.getIdPersona());
        System.out.println("idcliente" + cliente.getIdPersona());
        
        double totalT = informacion.getDouble("totalTodo");
        //TipoPago tipoPago = (TipoPago) tipoPagoDAO.getObjectById(informacion.getInt("idtipopago"));        
        

        return new Venta(totalT, rep, cliente);
    }

    private synchronized DetalleVenta obtenerDetalleVenta(JSONObject infoP,int idVenta) throws SQLException {
        DetalleVenta detalleVenta = new DetalleVenta();
        detalleVenta.setVenta(new Venta(ventaDAO.getSequenceIdVenta()));
        detalleVenta.setProducto(new Producto(infoP.getInt("id")));
        detalleVenta.setCantidad(infoP.getInt("cantidad"));
        detalleVenta.setPrecioTotal(infoP.getDouble("preciototal"));

        return detalleVenta;
    }
    private CalificacionVenta obtenerCalificacion(JSONObject informacion) throws SQLException {
        CalificacionVenta calificacion = new CalificacionVenta();
        calificacion.setVenta(new Venta(ventaDAO.getSequenceIdVenta()));
        calificacion.setCalificacion(informacion.getInt("calificacion"));
        calificacion.setDetalleCalificacion(informacion.getString("comentario"));        
        return calificacion;
    }

    private synchronized DetallePago obtenerDetallePago(JSONObject informacion) throws SQLException, ParseException {
        DetallePago detallePago = new DetallePago();
        detallePago.setNumTarjeta(informacion.getInt("numTarjeta"));
        detallePago.setCvv(informacion.getInt("cvv"));
        if(informacion.getInt("idtipopago")==1){
            detallePago.setTipoPago("PSE");
        }else{
            detallePago.setTipoPago("TARJETA CREDITO");
        }
        detallePago.setVenta(new Venta(ventaDAO.getSequenceIdVenta()));
        detallePago.setTarjeta((Tarjeta) tarjetaDAO.getObjectById(informacion.getInt("idTarjeta")));
        detallePago.setBanco((Banco) bancoDAO.getObjectById(informacion.getInt("idbanco")));
        SimpleDateFormat formatoDeFecha = new SimpleDateFormat("dd/MM/yy");
        Date fecha = formatoDeFecha.parse(informacion.getString("fecha"));
        System.out.println(fecha);
        detallePago.setFechaVencimiento(fecha);
        return detallePago;
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

    public CalificacionVentaDAO getCalificacionDAO() {
        return calificacionDAO;
    }

    

    
    
    

}