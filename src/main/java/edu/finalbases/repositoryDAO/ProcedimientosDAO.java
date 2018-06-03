/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Conexion;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

/**
 *
 * @author Santiago
 */
public class ProcedimientosDAO extends AbstractDAO{

    @Override
    public Object actualizar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int crear(Object object) throws SQLException, FException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
    
    public String generarFactura(int idVenta,int idCliente,int idRepVentas) throws FException, SQLException{
        
        String respuesta="";
        try {
            
            connection = Conexion.getInstance().getConexionBD();
            CallableStatement st = connection.prepareCall( "{?=call MULTINIVEL.FN_GENERAR_FACTURA(?,?,?)}");
            
            st.registerOutParameter(1,Types.VARCHAR);
            st.setInt(2, idVenta);
            st.setInt(3, idCliente);
            st.setInt(4, idRepVentas);
            
            st.execute();
            respuesta = st.getString(1);

        } catch (SQLException e) {
            System.out.println("No pudo hacer llamado a funcion generarFactura" + e.getMessage());
            throw new FException("ProcedimientosDAO", "Error al consumir funcion generarFactura," + e.getMessage());
        }finally {
            Conexion.getInstance().cerrarConexion();
        }
        
        return respuesta;
    }
    
}
