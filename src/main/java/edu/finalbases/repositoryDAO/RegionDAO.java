/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;


import edu.finalbases.business.FuncionesRepVentas;
import edu.finalbases.conexion.Conexion;
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
public class RegionDAO extends AbstractDAO {

    public RegionDAO() {
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

    public List getRegiones() throws SQLException{

        List<Region> regiones = new ArrayList();

        try {
            String strSQL = "SELECT * FROM MULTINIVEL.REGION ORDER BY NOMBREREGION";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            resultSet= prepStmt.executeQuery();

            while (resultSet.next()) {
                regiones.add((Region) getEntityByResultSet(resultSet));
            }
            prepStmt.close();
        } catch (SQLException ex) {

            System.out.println("Error: obteniendo region " + ex.getMessage());

        } finally {
           Conexion.getInstance().cerrarConexion();
        }
        return regiones;
    }

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {

        Region region = new Region();
        region.setIdRegion(resultSet.getInt("IDREGION"));
        region.setNombreRegion(resultSet.getString("NOMBREREGION"));  
        //entonces aqui ya armamos el objeto pais, apartir del id que nos trae la consulta y ya todo lo manejamos por objeto
        //en vista pues hariamos algo como region.getPais().getId(); y ahi iriamos validando.
        region.setPais((Pais) FuncionesRepVentas.getFunciones().getPaisDAO().getObjectById(resultSet.getInt("IDPAIS"))); 
                
        return region;
    }
    
     @Override
    public Object getObjectById(int id) throws SQLException{
        Region region = null;
        try {
            String strSQL = "SELECT * FROM MULTINIVEL.REGION WHERE IDREGION = ?";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1,id);
            resultSet = prepStmt.executeQuery();            

            if(resultSet.next()) {
                region = (Region) getEntityByResultSet(resultSet);
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error obteniendo region " + ex.getMessage());
            return null;

        } finally {    
            Conexion.getInstance().cerrarConexion();
            
        }
        return region;
    }

}
