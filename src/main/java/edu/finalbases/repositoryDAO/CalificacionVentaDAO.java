/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.CalificacionVenta;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Santiago
 */
public class CalificacionVentaDAO extends AbstractDAO{

    @Override
    public Object actualizar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int crear(Object object) throws  SQLException, FException {
        CalificacionVenta calificacion = (CalificacionVenta) object;
        try {
            String strSQL = "INSERT INTO SALEQUALIFICATION(IDCALIFICACIONVENTA,CALIFICACION,DETALLECALIFICACION,IDVENTA,FECHA) VALUES (MULTINIVEL.SEQ_CALIFICACIONVENTA_ID.NEXTVAL,?,?,?,?)";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1, calificacion.getCalificacion());
            prepStmt.setString(2, calificacion.getDetalleCalificacion());
            prepStmt.setInt(3, calificacion.getVenta().getIdVenta());
            prepStmt.setDate(4, java.sql.Date.valueOf(java.time.LocalDate.now()));
            
            int resultado = prepStmt.executeUpdate();
            prepStmt.close();

            return resultado;
        } catch (SQLException e) {
            System.out.println("No pudo crear insertar la calificacion: " + e.getMessage());
            throw new FException("CalificacionDAO", "Error creando la calificacion" + e.getMessage());
        } finally {
            Conexion.getInstance().cerrarConexion();
        }
    }

    @Override
    public boolean borrar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getObjectById(int id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
