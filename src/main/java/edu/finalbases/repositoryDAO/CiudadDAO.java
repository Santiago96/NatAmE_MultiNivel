/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.entities.Ciudad;
import java.util.List;

/**
 *
 * @author Santiago
 */
public class CiudadDAO extends AbstractDAO{

    public CiudadDAO() {
    }

    @Override
    public Object actualizar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void crear(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean borrar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public List getCiudades(){
        List<Ciudad> ciudades = (List<Ciudad>)em.createQuery("SELECT C FROM "+ Ciudad.class.getName()+" C").getResultList();
        return ciudades;
    }
    
    
}
