/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.business;

import edu.finalbases.repositoryDAO.CategoriaDAO;

/**
 *
 * @author Santiago
 */
public class FuncionesCliente {
    
    private static FuncionesCliente funcionesCliente;
    private CategoriaDAO categoriaDAO;

    

    private FuncionesCliente() {
        categoriaDAO = new CategoriaDAO();  
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
    
    
    
    
    
    
    
    
}