/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.Articulo;
import edu.finalbases.entities.Categoria;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Santiago
 */
public class ArticuloDAO extends AbstractDAO{

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
        Articulo articulo = null;
        try {
            String strSQL = "SELECT * FROM OBJECT WHERE IDPRODUCTO = ?";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1,id);
            resultSet = prepStmt.executeQuery();            

            if(resultSet.next()) {
                articulo = (Articulo) getEntityByResultSet(resultSet);
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error obteniendo el articulo by id: " + ex.getMessage());
            return null;

        } finally {  
            Conexion.getInstance().cerrarConexion();
        }
        return articulo;
    }

    @Override
      public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {
        Articulo articulo = new Articulo();
        articulo.setIdProducto(resultSet.getInt("IDPRODUCTO"));
        articulo.setNombreProducto(resultSet.getString("NOMBREPRODUCTO"));
        articulo.setDescripcion(resultSet.getString("DESCRIPCION"));
        articulo.setPath(resultSet.getString("PATH"));
        articulo.setPrecioVenta(resultSet.getFloat("PRECIOVENTA"));
        articulo.setCantidad(resultSet.getInt("CANTIDAD")); 
        
        CategoriaDAO catDao = new CategoriaDAO();
        articulo.setCategoria((Categoria)catDao.getObjectById(resultSet.getInt("IDCATEGORIA")));

        return articulo;
    }
    
    public List getProductos(int region) throws SQLException{

        List<Articulo> articulos = new ArrayList();

        try {
            String strSQL = "SELECT * FROM OBJECT WHERE IDREGION = ? ORDER BY IDPRODUCTO";
            System.out.println(strSQL);
            System.out.println(region);
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1,region);
            resultSet = prepStmt.executeQuery();            

            while(resultSet.next()) {
                articulos.add((Articulo) getEntityByResultSet(resultSet));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error obteniendo articulos: " + ex.getMessage());

        } finally {
            Conexion.getInstance().cerrarConexion();
        }
        
        return articulos;

    }
    
}
