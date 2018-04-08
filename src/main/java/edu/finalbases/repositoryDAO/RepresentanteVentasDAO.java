/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.business.FuncionesRepVentas;
import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.Ciudad;
import edu.finalbases.entities.Cliente;
import edu.finalbases.entities.Pais;
import edu.finalbases.entities.Persona;
import edu.finalbases.entities.Region;
import edu.finalbases.entities.RepresentanteVentas;
import edu.finalbases.entities.TipoRepresentanteVentas;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Santiago
 */
public class RepresentanteVentasDAO extends AbstractDAO{

       @Override
    public Object actualizar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    

    @Override
    public int crear(Object object) throws SQLException {
        Persona persona = (Persona) object;
        try {

            String strSQL = "INSERT INTO MULTINIVEL.PERSONA(IDPERSONA,NOMBRE,APELLIDO,GENERO,IDCIUDAD,IDPAIS,IDREGION) VALUES (?,?,?,?,?,?,?)";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setLong(1, persona.getIdPersona());
            prepStmt.setString(2, persona.getNombre());
            prepStmt.setString(3, persona.getApellido());
            prepStmt.setString(4, String.valueOf(persona.getGenero()));
            prepStmt.setInt(5, persona.getCiudad().getIdCiudad());
            prepStmt.setInt(6, persona.getPais().getIdPais());
            prepStmt.setInt(7, persona.getRegion().getIdRegion());
            

            int resultado = prepStmt.executeUpdate();
            prepStmt.close();

            return resultado;

        } catch (SQLException e) {
            System.out.println("No pudo crear la persona" + e.getMessage());
            return 0;
        } finally {
            Conexion.getInstance().cerrarConexion();
        }

    }
    
    
    public int crearCliente(Object object) throws SQLException {
        Cliente cliente = (Cliente) object;
        try {

            String strSQL = "INSERT INTO MULTINIVEL.CLIENTE(IDPERSONA,IDREPRESENTANTEVENTAS) VALUES (?,?)";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setLong(1, cliente.getIdPersona());
            prepStmt.setInt(2, cliente.getRepresentante().getIdPersona());
            int resultado = prepStmt.executeUpdate();
            prepStmt.close();

            return resultado;

        } catch (SQLException e) {
            System.out.println("No pudo crear el cliente" + e.getMessage());
            return 0;
        } finally {
            Conexion.getInstance().cerrarConexion();
        }

    }

    @Override
    public boolean borrar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {
        RepresentanteVentas r = new RepresentanteVentas();

        r.setIdPersona(resultSet.getInt("IDPERSONA"));
        r.setNombre(resultSet.getString("NOMBRE"));
        r.setApellido(resultSet.getString("APELLIDO"));
        r.setGenero(resultSet.getString("GENERO").toCharArray());
        r.setPais(new Pais(resultSet.getInt("IDPAIS")));
        r.setRegion(new Region(resultSet.getInt("IDREGION")));
        r.setCiudad(new Ciudad(resultSet.getInt("IDCIUDAD")));        
        r.setDirector(0);
        //r.setTipoRepresentante((TipoRepresentanteVentas) FuncionesRepVentas.getFunciones().getTipoRepDAO().getObjectById(resultSet.getInt("IDTIPOREPRESENTANTE")));        
        return r;
    }
    
    public Object getRepresentanteByResultSet(ResultSet resultSet,ResultSet resultSetRep) throws SQLException {
        RepresentanteVentas r = new RepresentanteVentas();

        r.setIdPersona(resultSet.getInt("IDPERSONA"));
        r.setNombre(resultSet.getString("NOMBRE"));
        r.setApellido(resultSet.getString("APELLIDO"));
        r.setGenero(resultSet.getString("GENERO").toCharArray());
        r.setPais(new Pais(resultSet.getInt("IDPAIS")));
        r.setRegion(new Region(resultSet.getInt("IDREGION")));
        r.setCiudad(new Ciudad(resultSet.getInt("IDCIUDAD")));        
        r.setDirector(resultSetRep.getInt("DIRECTOR"));
        //r.setTipoRepresentante(new TipoRepresentanteVentas(resultSetRep.get));        
        return r;
    }
    @Override
    public Object getObjectById(int id) throws SQLException {
        Persona representante = null;
 
        try {
            String strSQL = "SELECT * FROM MULTINIVEL.PERSONA WHERE IDPERSONA = ?";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1, id);
            resultSet = prepStmt.executeQuery();

            if (resultSet.next()) {     
                String strRepSQL = "SELECT * FROM MULTINIVEL.REPRESENTANTEVENTAS WHERE IDPERSONA = ?";
                prepStmt = connection.prepareStatement(strRepSQL);
                prepStmt.setInt(1, id);
                ResultSet resultSetClient = prepStmt.executeQuery();                
                representante = (Persona) getRepresentanteByResultSet(resultSet,resultSetClient);
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error buscando persona by id: " + ex.getMessage());
            return null;

        } finally {
            Conexion.getInstance().cerrarConexion();
        }
        
        return representante;
    }
    
    public int updateConexion(Persona p) throws SQLException {
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
            return 0;
        } finally {
            Conexion.getInstance().cerrarConexion();
        }

        return resultado;

    }


    public boolean crearUser(Persona p) throws SQLException {
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
            return false;

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
