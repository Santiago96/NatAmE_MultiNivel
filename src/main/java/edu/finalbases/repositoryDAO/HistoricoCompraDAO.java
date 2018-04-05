/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.HistoricoCompra;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Santiago
 */
public class HistoricoCompraDAO extends AbstractDAO{

    @Override
    public Object actualizar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int crear(Object object) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean borrar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getObjectById(int id) throws FException, SQLException {
        List <HistoricoCompra> historicoC = new ArrayList();
        try {
            String strSQL = "SELECT * FROM MULTINIVEL.HISTORICOCOMPRA WHERE IDCLIENTE= ?";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1,id);
            resultSet = prepStmt.executeQuery();            

            while(resultSet.next()) {
                historicoC.add((HistoricoCompra) getEntityByResultSet(resultSet));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error obteniendo el historico compra by id: " + ex.getMessage());
            throw new FException( "HistoricoCompraDAO", "Error obteniendo el historico de compra, " + ex.getMessage());
        } finally {  
            Conexion.getInstance().cerrarConexion();
        }
        return historicoC;
    }

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {
        HistoricoCompra historicoC = new HistoricoCompra();
        historicoC.setIdVenta(resultSet.getInt("IDVENTA"));
        historicoC.setFechaVenta(resultSet.getDate("FECHAVENTA"));
        historicoC.setTotalProductos(resultSet.getInt("TOTALPRODUCTOS"));
        historicoC.setTotal(resultSet.getDouble("TOTAL"));
        
        
        return historicoC;
    }
    
}
