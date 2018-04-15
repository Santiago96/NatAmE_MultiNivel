/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.Categoria;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Santiago
 */
public class CategoriaDAO extends AbstractDAO{

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
    public Object getObjectById(int id) throws SQLException {
        Categoria categoria = null;
        try {
            String strSQL = "SELECT * FROM MULTINIVEL.CATEGORIA WHERE IDCATEGORIA = ?";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1,id);
            resultSet = prepStmt.executeQuery();            

            if(resultSet.next()) {
                categoria = (Categoria) getEntityByResultSet(resultSet);
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error obteniendo categoria by id: " + ex.getMessage());
            return null;

        } finally {  
            Conexion.getInstance().cerrarConexion();
        }
        return categoria;
    }
    

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {
        Categoria categoria = new Categoria();
        categoria.setIdCategoria(resultSet.getInt("IDCATEGORIA"));
        categoria.setNombreCategoria(resultSet.getString("NOMBRECATEGORIA"));
        
        return categoria;
    }
    
    public List getCategorias() throws SQLException{

        List<Categoria> categorias = new ArrayList();

        try {
            String strSQL = "SELECT * FROM MULTINIVEL.CATEGORIA";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            resultSet = prepStmt.executeQuery();            

            while(resultSet.next()) {
                categorias.add((Categoria) getEntityByResultSet(resultSet));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error obteniendo categorias: " + ex.getMessage());

        } finally {
            Conexion.getInstance().cerrarConexion();
        }

        return categorias;

    }
    
    
    public List getSoloCategorias() throws SQLException{

        List<Categoria> categorias = new ArrayList();

        try {
            String strSQL = "SELECT * FROM MULTINIVEL.CATEGORIA WHERE IDCATEGORIAPADRE IS NULL";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            resultSet = prepStmt.executeQuery();            

            while(resultSet.next()) {
                categorias.add((Categoria) getEntityByResultSet(resultSet));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error obteniendo categorias: " + ex.getMessage());

        } finally {
            Conexion.getInstance().cerrarConexion();
        }

        return categorias;

    }
    
     public List getSubCategorias(int catPadre) throws SQLException{

        List<Categoria> categorias = new ArrayList();

        try {
            String strSQL = "SELECT * FROM MULTINIVEL.CATEGORIA WHERE IDCATEGORIAPADRE = ?";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1,catPadre);
            resultSet = prepStmt.executeQuery();            

            while(resultSet.next()) {
                categorias.add((Categoria) getEntityByResultSet(resultSet));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error obteniendo categorias: " + ex.getMessage());

        } finally {
            Conexion.getInstance().cerrarConexion();
        }

        return categorias;

    }
    
  
    
    
    
}
