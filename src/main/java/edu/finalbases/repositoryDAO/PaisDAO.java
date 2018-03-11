/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.entities.Pais;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Santiago
 */
public class PaisDAO extends AbstractDAO{

    public PaisDAO() {
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
    
    public List getPaises(){
        
        
        List<Pais> paises = (List<Pais>)em.createQuery("SELECT P FROM "+ Pais.class.getName()+" P").getResultList();       
        
        return paises;
    
    }
    
}
