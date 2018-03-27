/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.TipoContacto;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Santiago
 */
public class TipoContactoDAO extends AbstractDAO{

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
    public Object getObjectById(int id) throws SQLException{
        TipoContacto tipoContacto = null;
        try {
            String strSQL = "SELECT * FROM MULTINIVEL.TIPOCONTACTO WHERE IDTIPOCONTACTO = ?";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1,id);
            resultSet = prepStmt.executeQuery();            

            if(resultSet.next()) {
                tipoContacto = (TipoContacto) getEntityByResultSet(resultSet);
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
            return null;

        } finally {            
            Conexion.getInstance().cerrarConexion();
        }
        return tipoContacto;
    }

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {
        TipoContacto tipoContacto = new TipoContacto();
        
        tipoContacto.setIdTipoContacto(resultSet.getInt("IDTIPOCONTACTO"));
        tipoContacto.setNombreTipoContacto(resultSet.getString("NOMBRETIPOCONTACTO"));
        
        return tipoContacto;
    }
    
    
    public List getTiposContacto() throws SQLException{
        List<TipoContacto> tipoContactos = new ArrayList();

        try {
            String strSQL = "SELECT * FROM MULTINIVEL.TIPOCONTACTO";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            resultSet = prepStmt.executeQuery();            

            while(resultSet.next()) {
                tipoContactos.add((TipoContacto) getEntityByResultSet(resultSet));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());

        } finally {
            Conexion.getInstance().cerrarConexion();
        }

        return tipoContactos;
    
    }
    
    
          
    
}
