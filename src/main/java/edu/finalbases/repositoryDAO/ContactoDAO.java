/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.Contacto;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Santiago
 */
public class ContactoDAO extends AbstractDAO{

    @Override
    public Object actualizar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int crear(Object object)throws SQLException {
        Contacto contacto = (Contacto)object;
        try {

            String strSQL = "INSERT INTO CONTACTO(IDCONTACTO,IDTIPOCONTACTO,IDPERSONA,DETALLECONTACTO) VALUES (SEQ_CONTACTO_IDCONTACTO.NEXTVAL,?,?,?)";
            System.out.println(strSQL);
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1, contacto.getTipoContacto().getIdTipoContacto());
            prepStmt.setInt(2, contacto.getIdPersona().getIdPersona());
            prepStmt.setString(3, contacto.getDetalleContacto());
            
            
            int resultado = prepStmt.executeUpdate();
            prepStmt.close();
            
            return resultado;
            
        } catch (SQLException e) {
            System.out.println("No pudo crear el contacto; " + e.getMessage());
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
    public Object getObjectById(int id) throws SQLException{
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
