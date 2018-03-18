/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;


import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.Region;
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
public class RegionDAO extends AbstractDAO {

    public RegionDAO() {
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

    public List getRegiones() {

        List<Region> regiones = new ArrayList();

        try {
            String strSQL = "SELECT * FROM REGION";
            Connection conexion = Conexion.getInstance().getConexionBD();
            prepStmt = conexion.prepareStatement(strSQL);
            resultSet= prepStmt.executeQuery();

            while (resultSet.next()) {
                regiones.add((Region) getEntityByResultSet(resultSet));
            }
            prepStmt.close();
        } catch (SQLException ex) {

            System.out.println("Error: " + ex.getMessage());

        } finally {
            
        }
        return regiones;
    }

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {

        Region region = new Region();
        region.setIdRegion(resultSet.getInt("IDREGION"));
        region.setNombreRegion(resultSet.getString("NOMBREREGION"));      
                
        return region;
    }

}
