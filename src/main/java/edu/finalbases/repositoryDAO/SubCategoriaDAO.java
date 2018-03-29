/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.business.FuncionesCliente;
import edu.finalbases.business.FuncionesRepVentas;
import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.Categoria;
import edu.finalbases.entities.SubCategoria;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Santiago
 */
public class SubCategoriaDAO extends AbstractDAO{

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
    public Object getObjectById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {
        SubCategoria subCategoria = new SubCategoria();
        subCategoria.setIdSubCategoria(resultSet.getInt("IDSUBCATEGORIA"));
        subCategoria.setNombreSubCategoria(resultSet.getString("NOMBRESUBCATEGORIA"));
        subCategoria.setCategoria((Categoria)FuncionesCliente.getFuncionesCliente().getCategoriaDAO().getObjectById(resultSet.getInt("IDCATEGORIA")));
        
        
        return subCategoria;
    }
    
    
    public List getSubCategorias() throws SQLException{

        List<SubCategoria> subCategorias = new ArrayList();

        try {
            String strSQL = "SELECT * FROM MULTINIVEL.SUBCATEGORIA";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            resultSet = prepStmt.executeQuery();            

            while(resultSet.next()) {
                subCategorias.add((SubCategoria) getEntityByResultSet(resultSet));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error obteniendo subCategorias: " + ex.getMessage());

        } finally {
            Conexion.getInstance().cerrarConexion();
        }

        return subCategorias;

    }
}
