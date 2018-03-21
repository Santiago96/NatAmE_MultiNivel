/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import edu.finalbases.conexion.Conexion;
import java.sql.PreparedStatement;



/**
 *
 * @author Santiago
 */
public abstract class AbstractDAO {
    
    protected Statement statement;
    protected ResultSet resultSet;
    protected Connection connection;
    protected PreparedStatement prepStmt;

    public AbstractDAO() {
        
    }
    
    abstract public Object actualizar(Object object);
    abstract public int crear(Object object);
    abstract public boolean borrar(Object object);
    
    abstract public Object getObjectById(int id);
    
    abstract public Object getEntityByResultSet(ResultSet resultSet) throws SQLException;
    
}
