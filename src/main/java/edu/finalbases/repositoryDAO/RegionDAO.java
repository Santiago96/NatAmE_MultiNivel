/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.entities.Region;
import java.util.List;

/**
 *
 * @author Santiago
 */
public class RegionDAO extends AbstractDAO{

    public RegionDAO() {
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
    
    public List getRegiones(){
        List<Region> regiones = (List<Region>)em.createQuery("SELECT R FROM "+ Region.class.getName()+" R").getResultList();
        return regiones;
    }
    
}
