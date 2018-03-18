/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.Ciudad;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Santiago
 */
public class CiudadDAO extends AbstractDAO{

    public CiudadDAO() {
    }

    @Override
    public Object actualizar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void crear(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean borrar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public List getCiudades(){
        List<Ciudad> ciudades = new ArrayList();

        try {
            String strSQL = "SELECT * FROM CIUDAD";
            Connection conexion = Conexion.getInstance().getConexionBD();
            prepStmt = conexion.prepareStatement(strSQL);
            resultSet = prepStmt.executeQuery();

            while (resultSet.next()) {
                ciudades.add((Ciudad) getEntityByResultSet(resultSet));
            }
            prepStmt.close();
        } catch (SQLException ex) {

            System.out.println("Error: " + ex.getMessage());

        } finally {
            
        }

        return ciudades;
    }

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {
        Ciudad ciudad = new Ciudad();
        ciudad.setIdCiudad(resultSet.getInt("IDCIUDAD"));
        ciudad.setNombreCiudad(resultSet.getString("NOMBRECIUDAD"));       
        
        return ciudad;
    }
    
    
}
