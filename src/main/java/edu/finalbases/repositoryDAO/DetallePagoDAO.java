/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.DetallePago;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

/**
 *
 * @author Santiago
 */
public class DetallePagoDAO extends AbstractDAO{

    @Override
    public Object actualizar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int crear(Object object) throws SQLException, FException {
        DetallePago detallePago = (DetallePago) object;
        try {

            String strSQL = "INSERT INTO MULTINIVEL.DETALLEPAGO(IDDETALLEPAGO,NUMEROTARJETA,CVV,TIPODEPAGO,IDVENTA,IDTARJETA,IDBANCO,FECHADEVENCIMIENTO) VALUES (MULTINIVEL.SEQ_DETALLEPAGO_IDDETALLEPAGO.NEXTVAL,?,?,?,?,?,?,?)";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setLong(1, detallePago.getNumTarjeta());
            if(detallePago.getCvv()==1){
                prepStmt.setNull(2, java.sql.Types.INTEGER);
            }else{
                prepStmt.setInt(2, detallePago.getCvv());
            }
            prepStmt.setString(3, detallePago.getTipoPago());
            prepStmt.setInt(4, detallePago.getVenta().getIdVenta());
            prepStmt.setInt(5, detallePago.getTarjeta().getIdTarjeta());
            prepStmt.setInt(6, detallePago.getBanco().getIdBanco());
            ZoneId dzid = ZoneId.systemDefault();
            Date date = detallePago.getFechaVencimiento();
            Instant ins = date.toInstant();
            LocalDate fecha = ins.atZone(dzid).toLocalDate();
            prepStmt.setDate(7, java.sql.Date.valueOf(fecha));

            int resultado = prepStmt.executeUpdate();
            prepStmt.close();

            return resultado;

        } catch (SQLException e) {
            System.out.println("No pudo crear insertar el detalle pago" + e.getMessage());
            throw new FException("DetalleVentaDAO", "Error al crear el detalle de la venta," + e.getMessage());
        } finally {
            Conexion.getInstance().cerrarConexion();
        }
    }

    @Override
    public boolean borrar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getObjectById(int id) throws  SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public int getSequenceIdVenta() throws  SQLException {
        try {

            String strSQL = "SELECT MULTINIVEL.SEQ_DETALLEPAGO_IDDETALLEPAGO AS IDDETALLEPAGO FROM DUAL";
            
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            
            resultSet = prepStmt.executeQuery();
            
            if (resultSet.next()) {
                return resultSet.getInt("IDDETALLEPAGO");
            }
            prepStmt.close();
        } catch (SQLException e) {
            System.out.println("No pudo obtener la secuencia" + e.getMessage());
            
        } finally {
            Conexion.getInstance().cerrarConexion();
        }
        return 0;
    }
}