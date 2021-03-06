/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.Pais;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Santiago
 */
public class PaisDAO extends AbstractDAO {

    public PaisDAO() {
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

    public List getPaises() throws SQLException{

        List<Pais> paises = new ArrayList();

        try {
            String strSQL = "SELECT * FROM MULTINIVEL.PAIS ORDER BY NOMBREPAIS";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            resultSet = prepStmt.executeQuery();            

            while(resultSet.next()) {
                paises.add((Pais) getEntityByResultSet(resultSet));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());

        } finally {
            Conexion.getInstance().cerrarConexion();
        }

        return paises;

    }
    
    

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {
        Pais pais = new Pais();        
        pais.setIdPais(resultSet.getInt("IDPAIS"));
        pais.setNombrePais(resultSet.getString("NOMBREPAIS"));
        return pais;
    }

    @Override
    public Object getObjectById(int id) throws SQLException{
        
        Pais pais = null;
        try {
            String strSQL = "SELECT * FROM MULTINIVEL.PAIS WHERE IDPAIS = ?";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1,id);
            resultSet = prepStmt.executeQuery();            

            if(resultSet.next()) {
                pais = (Pais) getEntityByResultSet(resultSet);
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error obteniendo pais: " + ex.getMessage());
            return null;

        } finally {  
            Conexion.getInstance().cerrarConexion();
        }
        return pais;
    }

}
