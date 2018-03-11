/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Manager;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

/**
 *
 * @author Santiago
 */
public abstract class AbstractDAO {
    
    protected Manager manager;
    protected EntityManager em;
    protected EntityTransaction eT;

    public AbstractDAO() {
        manager = new Manager();
        em = manager.getEntityManager();
        eT = manager.getTransaction();
    }
    
    abstract public Object actualizar(Object object);
    abstract public void crear(Object object);
    abstract public boolean borrar(Object object);
    
}
