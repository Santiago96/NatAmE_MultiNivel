/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.conexion;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

/**
 *
 * @author Santiago
 */
public class Manager {
    
    private EntityManager em;
    private EntityManagerFactory emf;

    public Manager() {
        
    }
    
    public EntityManager getEntityManager(){
        if(em==null){
            emf = Persistence.createEntityManagerFactory("aplicacion");
            em = emf.createEntityManager();
        }
        return em;
    }
    
    public EntityTransaction getTransaction(){
        if(em!=null)
            return em.getTransaction();
        return null;    
    }
    
    
    
    
}
