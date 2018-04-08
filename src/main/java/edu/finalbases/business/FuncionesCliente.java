/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.business;

import edu.finalbases.entities.Cliente;
import edu.finalbases.entities.Persona;
import edu.finalbases.repositoryDAO.CategoriaDAO;
import edu.finalbases.repositoryDAO.ClienteDAO;
import java.sql.SQLException;


/**
 *
 * @author Santiago
 */
public class FuncionesCliente {
    
    
    private static FuncionesCliente funcionesCliente;
    private CategoriaDAO categoriaDAO;
    private Persona cliente;
    private ClienteDAO clienteDAO;
    

    private FuncionesCliente() {
        categoriaDAO = new CategoriaDAO(); 
        clienteDAO = new ClienteDAO();
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

    public Persona getCliente(String substring) throws SQLException {
        return (Cliente) clienteDAO.getObjectById(Integer.parseInt(substring));
    }

    public void setCliente(Persona cliente) {
        this.cliente = cliente;
    }
    
    public Persona getSessionCliente(){
        return cliente;
    }
    
    public void updateConexion(String idPersona) throws SQLException {
        System.out.println("Id Persona: " + idPersona);
        Persona p = (Persona) clienteDAO.getObjectById(Integer.parseInt(idPersona));
        if (p != null) {
            if (clienteDAO.updateConexion(p) == 1) {
                System.out.println("Se actualizo campo ultimaconexion");
            } else {
                System.out.println("No se actualizo campo ultimaconexion");
            }
        } else {
            System.out.println("Persona no encontrada");
        }

    }
    
    
    
    
    
    
    
    
    
}

