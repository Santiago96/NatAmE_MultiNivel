/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.DetalleVenta;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Santiago
 */
public class DetalleVentaDAO extends AbstractDAO{

    @Override
    public Object actualizar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int crear(Object object)throws SQLException, FException {
        DetalleVenta detalleVenta = (DetalleVenta) object;
        try {

            String strSQL = "INSERT INTO MULTINIVEL.DETALLEVENTA(IDDETALLEVENTA,IDPRODUCTO,IDVENTA,CANTIDAD,PRECIOTOTAL) VALUES (MULTINIVEL.SEQ_DETALLEVENTA_ID.NEXTVAL,?,?,?,?)";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setLong(1, detalleVenta.getProducto().getIdProducto());
            prepStmt.setInt(2, detalleVenta.getVenta().getIdVenta());
            prepStmt.setInt(3, detalleVenta.getCantidad());
            prepStmt.setDouble(4, detalleVenta.getPrecioTotal());
            

            int resultado = prepStmt.executeUpdate();
            prepStmt.close();

            return resultado;

        } catch (SQLException e) {
            System.out.println("No pudo crear insertar el detalle venta" + e.getMessage());
            throw new FException("DetalleVentaDAO", "No se pudo insertar el detalle venta, " + e.getMessage());
        } finally {
            Conexion.getInstance().cerrarConexion();
        }
    }

    @Override
    public boolean borrar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getObjectById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
