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
import edu.finalbases.repositoryDAO.FException;
import edu.finalbases.repositoryDAO.PersonaDAO;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Santiago
 */
public class Test {
    
    public static void main(String[] args) throws FException, SQLException{
        PersonaDAO pDAO = new PersonaDAO();
        Persona p = new Persona(1016065926, "Julian", "David", "M".toCharArray(), new Ciudad(), new Pais(), new Region(), null);
        try {
            Conexion.getInstance().conectar("multinivel", "finalbases");
        } catch (FException ex) {
            Logger.getLogger(Test.class.getName()).log(Level.SEVERE, null, ex);
        }
        boolean r;
        try {
            r = pDAO.crearUser(p);
            System.out.println("Resultado create user: "+r);
        } catch (FException ex) {
            Logger.getLogger(Test.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
