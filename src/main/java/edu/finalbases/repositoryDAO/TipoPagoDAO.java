/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Conexion;

import edu.finalbases.entities.TipoPago;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Santiago
 */
public class TipoPagoDAO extends AbstractDAO{

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
        TipoPago tipoPago = null;
        try {
            String strSQL = "SELECT * FROM MULTINIVEL.TIPOPAGO WHERE IDTIPOPAGO = ?";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1, id);
            resultSet = prepStmt.executeQuery();

            if (resultSet.next()) {
                tipoPago = (TipoPago) getEntityByResultSet(resultSet);
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error obteniendo tipo Pago: " + ex.getMessage());
            return null;

        } finally {
            Conexion.getInstance().cerrarConexion();
        }
        return tipoPago;
    }

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {
        TipoPago tipoPago = new TipoPago();
        tipoPago.setIdTipoPago(resultSet.getInt("IDTIPOPAGO"));
        tipoPago.setNombreTipoPago(resultSet.getString("NOMBRETIPOPAGO"));
        
        return tipoPago;
    }
    
}
