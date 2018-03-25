/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.conexion;

import edu.finalbases.entities.Ciudad;
import edu.finalbases.entities.Pais;
import edu.finalbases.entities.Persona;
import edu.finalbases.entities.Region;
import edu.finalbases.repositoryDAO.PersonaDAO;
import java.sql.SQLException;

/**
 *
 * @author Santiago
 */
public class Test {
    
    public static void main(String[] args) throws SQLException{
        PersonaDAO pDAO = new PersonaDAO();
        Persona p = new Persona(1016065926, "Julian", "David", "M".toCharArray(), new Ciudad(), new Pais(), new Region(), null);
        Conexion.getInstance().conectar("multinivel", "finalbases");
        boolean r =  pDAO.crearUser(p);
        
        System.out.println("Resultado create user: "+r);
        
        
        
    }
    
}
