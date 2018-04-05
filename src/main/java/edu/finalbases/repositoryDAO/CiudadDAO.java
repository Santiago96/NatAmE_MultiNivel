/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.business.FuncionesRepVentas;
import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.Ciudad;
import edu.finalbases.entities.Pais;
import edu.finalbases.entities.Region;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

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
    public int crear(Object object)throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean borrar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public List getCiudades() throws FException, SQLException{
        List<Ciudad> ciudades = new ArrayList();
        try {
            String strSQL = "SELECT * FROM MULTINIVEL.CIUDAD ORDER BY NOMBRECIUDAD";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            resultSet = prepStmt.executeQuery();
            while (resultSet.next()) {
                ciudades.add((Ciudad) getEntityByResultSet(resultSet));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error obteniendo ciudad " + ex.getMessage());
            throw new FException( "CiudadDAO", "Error obteniendo las ciudades, " + ex.getMessage());
        } finally {
            Conexion.getInstance().cerrarConexion();
        }
        return ciudades;
    }

    
    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws FException, SQLException {
        Ciudad ciudad = new Ciudad();
        ciudad.setIdCiudad(resultSet.getInt("IDCIUDAD"));
        ciudad.setNombreCiudad(resultSet.getString("NOMBRECIUDAD"));        
        try {        
            ciudad.setRegion((Region) FuncionesRepVentas.getFunciones().getRegionDAO().getObjectById(resultSet.getInt("IDREGION")));
        } catch (FException ex) {
            throw new FException( "CiudadDAO", "Error obteniendo la region, " + ex.getMessage());
        }
        //ciudad.setPais((Pais) FuncionesRepVentas.getFunciones().getPaisDAO().getObjectById(resultSet.getInt("IDPAIS")));        
        ciudad.setPais(ciudad.getRegion().getPais());
        
        return ciudad;
    }
    
     @Override
    public Object getObjectById(int id) throws FException, SQLException{
        Ciudad ciudad = null;
        try {
            String strSQL = "SELECT * FROM MULTINIVEL.CIUDAD WHERE IDCIUDAD = ?";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1,id);
            resultSet = prepStmt.executeQuery();            

            if(resultSet.next()) {
                ciudad = (Ciudad) getEntityByResultSet(resultSet);
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error obteniendo ciudad: " + ex.getMessage());
            throw new FException( "CiudadDAO", "Error obteniendo la ciudad, " + ex.getMessage());
        } finally {   
            Conexion.getInstance().cerrarConexion();
        }
        return ciudad;
    }
    
    
}
