/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.conexion;



import edu.finalbases.repositoryDAO.FException;
import edu.finalbases.repositoryDAO.ProcedimientosDAO;
import java.sql.SQLException;
import javax.ws.rs.core.Response;


/**
 *
 * @author Santiago
 */
public class Test {
    
    public static void main(String[] args) throws SQLException, FException{
        
        Conexion.getInstance().conectar("j1016065965", "5965");
        
        ProcedimientosDAO pDAO = new ProcedimientosDAO();
        pDAO.generarFactura(5, 1016065965, 1018485092);
    }    
}
