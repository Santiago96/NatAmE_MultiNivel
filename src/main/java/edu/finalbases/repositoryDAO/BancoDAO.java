/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.Banco;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Santiago
 */
public class BancoDAO extends AbstractDAO {

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
        Banco banco = null;
        try {
            String strSQL = "SELECT * FROM MULTINIVEL.BANCO WHERE IDBANCO = ?";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            prepStmt.setInt(1, id);
            resultSet = prepStmt.executeQuery();

            if (resultSet.next()) {
                banco = (Banco) getEntityByResultSet(resultSet);
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error obteniendo banco: " + ex.getMessage());
            return null;

        } finally {
            Conexion.getInstance().cerrarConexion();
        }
        return banco;
    }

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {
        Banco banco = new Banco();
        banco.setIdBanco(resultSet.getInt("IDBANCO"));
        banco.setNombreBanco(resultSet.getString("NOMBREBANCO"));

        return banco;
    }

    public List getBancos() throws SQLException {

        List<Banco> bancos = new ArrayList();

        try {
            String strSQL = "SELECT * FROM MULTINIVEL.BANCO";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            resultSet = prepStmt.executeQuery();

            while (resultSet.next()) {
                bancos.add((Banco) getEntityByResultSet(resultSet));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            System.out.println("Error obteniendo banco: " + ex.getMessage());

        } finally {
            Conexion.getInstance().cerrarConexion();
        }

        return bancos;

    }

}
