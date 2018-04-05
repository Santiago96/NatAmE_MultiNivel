/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.Ciudad;
import edu.finalbases.entities.Pais;
import edu.finalbases.entities.Persona;
import edu.finalbases.entities.Region;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

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
    public int crear(Object object) throws FException, SQLException {
        Persona persona = (Persona) object;
        try {

            String strSQL = "INSERT INTO MULTINIVEL.PERSONA(IDPERSONA,NOMBRE,APELLIDO,GENERO,IDCIUDAD,IDPAIS,IDREGION,IDREPRESENTANTECLIENTE) VALUES (?,?,?,?,?,?,?,?)";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
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
            throw new FException( "PersonaDAO", "Error creando la persona, " + e.getMessage());
        } finally {
            Conexion.getInstance().cerrarConexion();
        }

    }

    @Override
    public boolean borrar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws FException, SQLException {
        Persona p = new Persona();

        p.setIdPersona(resultSet.getInt("IDPERSONA"));
        p.setNombre(resultSet.getString("NOMBRE"));
        p.setApellido(resultSet.getString("APELLIDO"));
        p.setGenero(resultSet.getString("GENERO").toCharArray());
        p.setPais(new Pais(resultSet.getInt("IDPAIS")));
        p.setRegion(new Region(resultSet.getInt("IDREGION")));
        p.setCiudad(new Ciudad(resultSet.getInt("IDCIUDAD")));
        
        if(resultSet.getInt("IDREPRESENTANTECLIENTE")!=0)
        try {
            p.setId_rep_ventas((Persona)getObjectById(resultSet.getInt("IDREPRESENTANTECLIENTE")));
        } catch (FException ex) {
            throw new FException( "PersonaDAO", "Error obteniendo el representante, " + ex.getMessage());
        }
        return p;

    }

    @Override
    public Object getObjectById(int id) throws FException, SQLException {
        Persona representante = null;
 
        try {
            String strSQL = "SELECT * FROM MULTINIVEL.PERSONA WHERE IDPERSONA = ?";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1, id);
            resultSet = prepStmt.executeQuery();

            if (resultSet.next()) {                
                representante = (Persona) getEntityByResultSet(resultSet);
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error buscando persona by id: " + ex.getMessage());
            throw new FException( "PersonaDAO", "Error obteniendo la persona, " + ex.getMessage());
        } finally {
            Conexion.getInstance().cerrarConexion();
        }
        
        return representante;
    }

    public int updateConexion(Persona p) throws FException, SQLException {
        int resultado;

        try {

            String strSQL = "UPDATE MULTINIVEL.PERSONA SET ULTIMACONEXION = ? WHERE IDPERSONA = ?";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setDate(1, java.sql.Date.valueOf(java.time.LocalDate.now()));
            prepStmt.setInt(2, p.getIdPersona());

            resultado = prepStmt.executeUpdate();
            prepStmt.close();

        } catch (SQLException e) {
            System.out.println("No pudo actualizar ultima conexion" + e.getMessage());
            throw new FException( "PersonaDAO", "Error actualizando la ultima conexion, " + e.getMessage());
        } finally {
            Conexion.getInstance().cerrarConexion();
        }

        return resultado;

    }

    public boolean crearUser(Persona p) throws FException, SQLException {
        final String tableDefault = "DEFRMUNDO";
        final String tableTemporary = "TEMRMULTINIVEL";

        boolean resultado = true;
        String user = subUser(p.getNombre(), p.getIdPersona());
        String pass = subPass(p.getIdPersona());

        try {
            String ddlQuery = "CREATE USER " + user + " IDENTIFIED BY " + pass
                    + " DEFAULT TABLESPACE " + tableDefault + " "
                    + "TEMPORARY TABLESPACE " + tableTemporary;

            System.out.println("Query DDL: " + ddlQuery);
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(ddlQuery);

            resultado = prepStmt.execute();
            
            if (!resultado) {
                String ddlPrivileges = "GRANT R_CLIENTE TO "+user;

                System.out.println("Query DDL Privileges: " + ddlPrivileges);
                connection = Conexion.getInstance().getConexionBD();
                prepStmt = connection.prepareStatement(ddlPrivileges);

                resultado = prepStmt.execute();
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error al crear user en DB: " + ex.getMessage());
            throw new FException( "PersonaDAO", "Error al crear el usuario en la BD, " + ex.getMessage());
        } finally {
            Conexion.getInstance().cerrarConexion();
        }

        return !resultado;
    }

    private String subUser(String nombre, int idPersona) {
        String c = nombre.substring(0, 1);
        return c + String.valueOf(idPersona);
    }

    private String subPass(int idPersona) {
        return String.valueOf(idPersona).substring(String.valueOf(idPersona).length() - 4, String.valueOf(idPersona).length());
    }

}
