/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.EstadoVenta;
import edu.finalbases.entities.Pais;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Santiago
 */
public class EstadoVentaDAO extends AbstractDAO{

    @Override
    public Object actualizar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int crear(Object object)throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean borrar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getObjectById(int id) throws SQLException {
        EstadoVenta estadoVenta = null;
        try {
            String strSQL = "SELECT * FROM MULTINIVEL.ESTADOVENTA WHERE IDESTADOVENTA = ?";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1,id);
            resultSet = prepStmt.executeQuery();            

            if(resultSet.next()) {
                estadoVenta = (EstadoVenta) getEntityByResultSet(resultSet);
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error obteniendo estado venta: " + ex.getMessage());
            return null;

        } finally {  
            Conexion.getInstance().cerrarConexion();
        }
        return estadoVenta;
    }

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {
        EstadoVenta estadoVenta = new EstadoVenta();
        estadoVenta.setIdEstadoVenta(resultSet.getInt("IDESTADOVENTA"));
        estadoVenta.setNombreEstadoVenta(resultSet.getString("NOMBREESTADOVENTA"));
        
        return estadoVenta;
        
    }
    
}
