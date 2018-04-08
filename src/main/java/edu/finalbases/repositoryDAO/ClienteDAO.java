/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.business.FuncionesCompra;
import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.Ciudad;
import edu.finalbases.entities.Cliente;
import edu.finalbases.entities.Pais;
import edu.finalbases.entities.Persona;
import edu.finalbases.entities.Region;
import edu.finalbases.entities.RepresentanteVentas;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Santiago
 */
public class ClienteDAO extends AbstractDAO{

    @Override
    public Object actualizar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int crear(Object object) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.

    }
    
    
    public int crearCliente(Object object) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean borrar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {
        Cliente c = new Cliente();

        c.setIdPersona(resultSet.getInt("IDPERSONA"));
        c.setNombre(resultSet.getString("NOMBRE"));
        c.setApellido(resultSet.getString("APELLIDO"));
        c.setGenero(resultSet.getString("GENERO").toCharArray());
        c.setPais(new Pais(resultSet.getInt("IDPAIS")));
        c.setRegion(new Region(resultSet.getInt("IDREGION")));
        c.setCiudad(new Ciudad(resultSet.getInt("IDCIUDAD")));        
        c.setRepresentante((Persona)FuncionesCompra.getFuncionesCompra().getRepresentanteDAO().getObjectById(0));
        
        return c;

    }
    public Object getClienteByResultSet(ResultSet resultSet,ResultSet resultSetCliente) throws SQLException {
        Cliente c = new Cliente();

        c.setIdPersona(resultSet.getInt("IDPERSONA"));
        c.setNombre(resultSet.getString("NOMBRE"));
        c.setApellido(resultSet.getString("APELLIDO"));
        c.setGenero(resultSet.getString("GENERO").toCharArray());
        c.setPais(new Pais(resultSet.getInt("IDPAIS")));
        c.setRegion(new Region(resultSet.getInt("IDREGION")));
        c.setCiudad(new Ciudad(resultSet.getInt("IDCIUDAD")));        
        c.setRepresentante((Persona)FuncionesCompra.getFuncionesCompra().getRepresentanteDAO().getObjectById(resultSetCliente.getInt("IDREPRESENTANTEVENTAS")));
        
        return c;

    }

    @Override
    public Object getObjectById(int id) throws SQLException {
        Persona cliente = null;
 
        try {
            String strSQL = "SELECT * FROM MULTINIVEL.PERSONA WHERE IDPERSONA = ?";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1, id);
            resultSet = prepStmt.executeQuery();

            if (resultSet.next()) {  
                String strClientSQL = "SELECT * FROM MULTINIVEL.PERSONA WHERE IDPERSONA = ?";
                prepStmt = connection.prepareStatement(strClientSQL);
                prepStmt.setInt(1, id);
                ResultSet resultSetClient = prepStmt.executeQuery();                
                cliente = (Persona) getClienteByResultSet(resultSet,resultSetClient);
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error buscando persona by id: " + ex.getMessage());
            return null;

        } finally {
            Conexion.getInstance().cerrarConexion();
        }
        
        return cliente;
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
}
