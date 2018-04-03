/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.Venta;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Santiago
 */
public class VentaDAO extends AbstractDAO{

    @Override
    public Object actualizar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int crear(Object object)throws SQLException {
        Venta venta = (Venta) object;
        try {

            String strSQL = "INSERT INTO MULTINIVEL.VENTA(IDVENTA,FECHAVENTA,TOTAL,IDREPRESENTANTE,IDCLIENTE,IDTIPOPAGO,IDBANCO,IDESTADOVENTA) VALUES (MULTINIVEL.SEQ_VENTA_IDVENTA.NEXTVAL,?,?,?,?,?,?,?)";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setDate(1, java.sql.Date.valueOf(java.time.LocalDate.now()));
            prepStmt.setDouble(2, venta.getTotal());
            prepStmt.setInt(3, venta.getRepresentante().getIdPersona());
            prepStmt.setInt(4, venta.getCliente().getIdPersona());
            prepStmt.setInt(5, venta.getTipoPago().getIdTipoPago());
            prepStmt.setInt(6, venta.getBanco().getIdBanco());
            prepStmt.setInt(7, venta.getEstadoVenta().getIdEstadoVenta());
            

            int resultado = prepStmt.executeUpdate();
            prepStmt.close();

            return resultado;

        } catch (SQLException e) {
            System.out.println("No pudo crear el cliente" + e.getMessage());
            return 0;
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
