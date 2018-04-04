/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.Item;
import edu.finalbases.entities.Producto;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Santiago
 */
public class ItemDAO extends AbstractDAO{

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
        Item item = null;
        try {
            String strSQL = "SELECT * FROM MULTINIVEL.ITEM WHERE IDITEM = ?";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1,id);
            resultSet = prepStmt.executeQuery();            

            if(resultSet.next()) {
                item = (Item) getEntityByResultSet(resultSet);
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error obteniendo el item by id: " + ex.getMessage());
            return null;

        } finally {  
            Conexion.getInstance().cerrarConexion();
        }
        return item;
    }

    
    @Override
      public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {
        Item item = new Item();
        item.setIdItem(resultSet.getInt("IDITEM"));
        item.setPrecioVenta(resultSet.getInt("PRECIOVENTA"));
        item.setCantidad(resultSet.getInt("CANTIDAD"));
        
        return item;
    }
    
    public List getItems(int region) throws SQLException{

        List<Item> items = new ArrayList();

        try {
            String strSQL = "SELECT * FROM MULTINIVEL.ITEM";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            resultSet = prepStmt.executeQuery();            

            while(resultSet.next()) {
                items.add((Item) getEntityByResultSet(resultSet));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error obteniendo items: " + ex.getMessage());

        } finally {
            Conexion.getInstance().cerrarConexion();
        }
        
        return items;

    }
    
    public void restarItem(int id, int region, int cantidad) throws SQLException{

        
        try {
            String strSQL = "UPDATE MULTINIVEL.ITEM SET CANTIDAD = CANTIDAD - ? WHERE IDPRODUCTO=? AND IDREGION=?";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1, cantidad);
            prepStmt.setInt(2, id);
            prepStmt.setInt(3, region);
            
            resultSet = prepStmt.executeQuery();            

            
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error restando item: " + ex.getMessage());

        } finally {
            Conexion.getInstance().cerrarConexion();
        }
        

    }
    
    
    
}
