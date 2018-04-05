/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.business;

import edu.finalbases.entities.Persona;
import edu.finalbases.repositoryDAO.CategoriaDAO;
import edu.finalbases.repositoryDAO.FException;
import edu.finalbases.repositoryDAO.PersonaDAO;
import java.sql.SQLException;


/**
 *
 * @author Santiago
 */
public class FuncionesCliente {
    
    
    private static FuncionesCliente funcionesCliente;
    private CategoriaDAO categoriaDAO;
    private Persona cliente;
    private PersonaDAO personaDAO;
    

    private FuncionesCliente() {
        categoriaDAO = new CategoriaDAO(); 
        personaDAO = new PersonaDAO();
    }
    
    public static FuncionesCliente getFuncionesCliente() {
        if (funcionesCliente == null) {
            funcionesCliente = new FuncionesCliente();
        }
        return funcionesCliente;
    }

    public CategoriaDAO getCategoriaDAO() {
        return categoriaDAO;
    }

    public void setCategoriaDAO(CategoriaDAO categoriaDAO) {
        this.categoriaDAO = categoriaDAO;
    }

    public Persona getCliente(String substring) throws SQLException, FException {
        return (Persona) personaDAO.getObjectById(Integer.parseInt(substring));
    }

    public void setCliente(Persona cliente) {
        this.cliente = cliente;
    }
    
    public Persona getSessionCliente(){
        return cliente;
    }
    
    
    
    
    
    
    
    
    
}

