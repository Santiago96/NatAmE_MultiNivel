/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import edu.finalbases.entities.Tarjeta;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Santiago
 */
public class TarjetaDAO extends AbstractDAO{

    @Override
    public Object actualizar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int crear(Object object) throws  SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean borrar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getObjectById(int id) throws  SQLException {
        Tarjeta tarjeta = null;
        try {
            String strSQL = "SELECT * FROM MULTINIVEL.TARJETA WHERE IDTARJETA = ?";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1, id);
            resultSet = prepStmt.executeQuery();

            if (resultSet.next()) {
                tarjeta = (Tarjeta) getEntityByResultSet(resultSet);
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error obteniendo tarjeta: " + ex.getMessage());
            return null;

        } finally {
            Conexion.getInstance().cerrarConexion();
        }
        return tarjeta;
    }

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws  SQLException {
        Tarjeta tarjeta = new Tarjeta();
        tarjeta.setIdTarjeta(resultSet.getInt("IDTARJETA"));
        tarjeta.setNombreTarjeta(resultSet.getString("NOMBRETARJETA"));       
        return tarjeta;
    }
    
    public List getTarjetas() throws SQLException{
        List<Tarjeta> tarjetas = new ArrayList();

        try {
            String strSQL = "SELECT * FROM MULTINIVEL.TARJETA ORDER BY NOMBRETARJETA";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            resultSet = prepStmt.executeQuery();

            while (resultSet.next()) {
                tarjetas.add((Tarjeta) getEntityByResultSet(resultSet));
            }
            prepStmt.close();
        } catch (SQLException ex) {

            System.out.println("Error obteniendo tarjeta " + ex.getMessage());

        } finally {
            Conexion.getInstance().cerrarConexion();
        }

        return tarjetas;
    }
    
    public int getSequenceIdTarjeta() throws  SQLException {
        try {

            String strSQL = "SELECT MULTINIVEL.SEQ_TARJETA_IDTARJETA.CURRVAL AS IDTARJETA FROM DUAL";
            
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            
            resultSet = prepStmt.executeQuery();
            
            if (resultSet.next()) {
                return resultSet.getInt("IDTARJETA");
            }
            prepStmt.close();
        } catch (SQLException e) {
            System.out.println("No pudo obtener la secuencia tarjeta" + e.getMessage());
            
        } finally {
            Conexion.getInstance().cerrarConexion();
        }
        return 0;
    }
}