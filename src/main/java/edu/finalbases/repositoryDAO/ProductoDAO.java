/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.Categoria;
import edu.finalbases.entities.Producto;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Santiago
 */
public class ProductoDAO extends AbstractDAO{

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
        Producto producto = null;
        try {
            String strSQL = "SELECT * FROM MULTINIVEL.PRODUCTO WHERE IDPRODUCTO = ?";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1,id);
            resultSet = prepStmt.executeQuery();            

            if(resultSet.next()) {
                producto = (Producto) getEntityByResultSet(resultSet);
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error obteniendo el producto by id: " + ex.getMessage());
            return null;

        } finally {  
            Conexion.getInstance().cerrarConexion();
        }
        return producto;
    }

    @Override
      public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {
        Producto producto = new Producto();
        producto.setIdProducto(resultSet.getInt("IDPRODUCTO"));
        producto.setNombreProducto(resultSet.getString("NOMBREPRODUCTO"));
        producto.setDescripcion(resultSet.getString("DESCRIPCION"));
        //CategoriaDAO cadao = new CategoriaDAO();
        //producto.setCategoria((Categoria)cadao.getObjectById(resultSet.getInt("IDCATEGORIA")));
        //SubCategoriaDAO scadao = new SubCategoriaDAO();
        //producto.setSubCategoria((SubCategoria)scadao.getObjectById(resultSet.getInt("IDSUBCATEGORIA")));
        producto.setPath(resultSet.getString("PATH"));
        
        return producto;
    }
    
    public List getProductos() throws SQLException{

        List<Producto> productos = new ArrayList();

        try {
            String strSQL = "SELECT * FROM MULTINIVEL.PRODUCTO";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            resultSet = prepStmt.executeQuery();            

            while(resultSet.next()) {
                productos.add((Producto) getEntityByResultSet(resultSet));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error obteniendo productos: " + ex.getMessage());

        } finally {
            Conexion.getInstance().cerrarConexion();
        }
        
        return productos;

    }
    
}
