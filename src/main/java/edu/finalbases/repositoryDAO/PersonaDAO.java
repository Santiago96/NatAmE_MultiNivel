/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.Persona;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



/**
 *
 * @author Santiago
 */
public class PersonaDAO extends AbstractDAO {

    @Override
    public Object actualizar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int crear(Object object) {
        Persona persona = (Persona)object;
        try {

            String strSQL = "INSERT INTO PERSONA(IDPERSONA,NOMBRE,APELLIDO,GENERO,IDCIUDAD,IDPAIS,IDREGION,IDREPRESENTANTECLIENTE) VALUES (?,?,?,?,?,?,?,?)";
            Connection conexion = Conexion.getInstance().getConexionBD();
            prepStmt = conexion.prepareStatement(strSQL);
            prepStmt.setLong(1, persona.getIdPersona());
            prepStmt.setString(2, persona.getNombre());
            prepStmt.setString(3, persona.getApellido());
            prepStmt.setString(4, String.valueOf(persona.getGenero()));
            prepStmt.setInt(5, persona.getCiudad().getIdCiudad());
            prepStmt.setInt(6, persona.getPais().getIdPais());
            prepStmt.setInt(7, persona.getRegion().getIdRegion());
            prepStmt.setLong(8, persona.getId_rep_ventas().getIdPersona());            
            
            int resultado = prepStmt.executeUpdate();
            prepStmt.close();
            
            return resultado;
            
        } catch (SQLException e) {
            System.out.println("No pudo crear el cliente" + e.getMessage());
            return 0;
        } finally {
            
        }
                
    }

    @Override
    public boolean borrar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {
        Persona p = new Persona();
        
        p.setIdPersona(resultSet.getLong("IDPERSONA"));
        p.setNombre(resultSet.getString("NOMBRE"));
        p.setApellido(resultSet.getString("APELLIDO"));  
        p.setGenero(resultSet.getString("GENERO").toCharArray());       
        
        return p;
        
    }
    
    
    
     @Override
    public Object getObjectById(int id) {
        Persona representante = null;
        try {
            String strSQL = "SELECT * FROM PERSONA WHERE IDPERSONA = ?";
            Connection conexion = Conexion.getInstance().getConexionBD();
            prepStmt = conexion.prepareStatement(strSQL);
            prepStmt.setInt(1,id);
            resultSet = prepStmt.executeQuery();            

            if(resultSet.next()) {
                representante = (Persona) getEntityByResultSet(resultSet);
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
            return null;

        } finally {            
        }
         System.out.println("Rep Ventas: "+representante);
        return representante;
    }

}
