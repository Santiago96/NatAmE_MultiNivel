/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.Cliente;
import edu.finalbases.entities.Persona;
import edu.finalbases.entities.RepresentanteVentas;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Santiago
 */
public class HistoricocrvDAO extends AbstractDAO {

    @Override
    public Object actualizar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int crear(Object object) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean borrar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getObjectById(int id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {
        Persona representante = new RepresentanteVentas(resultSet.getInt("IDREPRESENTANTEVENTAS"));
        
        return representante;
        
    }
    
    public Object getRepresentanteAsociado(Cliente cliente) throws SQLException{
        Persona representante = null;
        
        try {
            String strSQL = "SELECT * FROM HISTORICALCRV WHERE FECHAFIN IS NULL AND IDCLIENTE=?";
                       
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1, cliente.getIdPersona());
            resultSet = prepStmt.executeQuery();
            if(resultSet.next()){
                representante = (Persona) getEntityByResultSet(resultSet);
            
            }
            prepStmt.close();
            
            return representante;
            
            
        } catch (Exception e) {
            System.out.println("No pudo crear el contacto; " + e.getMessage());
            return null;
        }finally {
            Conexion.getInstance().cerrarConexion();
            
        }
        
    }

    public int crearRelacionClienteRep(Cliente cliente, RepresentanteVentas rep) throws SQLException {
        int r = 0;

        try {
            String strSQL = "INSERT INTO HISTORICALCRV(IDHISTORICOCRV,IDCLIENTE,IDREPRESENTANTEVENTAS,FECHAINICIO) VALUES (MULTINIVEL.SEQ_HISTORICOCRV_ID.NEXTVAL,?,?,?)";
                       
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1, cliente.getIdPersona());
            prepStmt.setInt(2, rep.getIdPersona());
            prepStmt.setDate(3, java.sql.Date.valueOf(java.time.LocalDate.now()));
            
            int resultado = prepStmt.executeUpdate();
            prepStmt.close();
            
            return resultado;
            
            
        } catch (Exception e) {
            System.out.println("No pudo crear el relacion cliente con Rep " + e.getMessage());
            return 0;
        }finally {
            Conexion.getInstance().cerrarConexion();
            
        }
    }

}
