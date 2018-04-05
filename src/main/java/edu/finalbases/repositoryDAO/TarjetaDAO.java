/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import edu.finalbases.entities.Tarjeta;

/**
 *
 * @author Santiago
 */
public class TarjetaDAO extends AbstractDAO{

    @Override
    public Object actualizar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int crear(Object object) throws  SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean borrar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getObjectById(int id) throws  SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws  SQLException {
        Tarjeta tarjeta = new Tarjeta();
        tarjeta.setIdTarjeta(resultSet.getInt("IDTARJETA"));
        tarjeta.setNombreTarjeta(resultSet.getString("NOMBRETARJETA"));
        
        return tarjeta;
    }
    
}