/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.webservices;

import edu.finalbases.business.FuncionesRepVentas;
import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.Persona;
import java.sql.Connection;
import java.sql.SQLException;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 *
 * @author Santiago
 */
@Path("cliente")
public class ServiceCliente {
    
    private Connection cnx;

    @GET
    @Path("iniciar/{usuario}/{password}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response iniciarSesion(@PathParam("usuario") String usuario, @PathParam("password") String passwordP) throws SQLException {

        String user = usuario;
        String password = passwordP;
        System.out.println("Usuario Cliente: " + user + " Password Cliente: " + password);
        Conexion.getInstance().conectar(user, password);
        cnx = Conexion.getInstance().getConexionBD();
        
        if(cnx!=null){
            //FuncionesRepVentas.getFunciones().updateConexion(user.substring(1)); //Otorgar persmisos para update campo ultimaconexion
            Persona pC =  FuncionesRepVentas.getFunciones().getUser(user.substring(1));
            
            return Response.ok(pC).build();
        
        } else {
            return Response.status(Response.Status.UNAUTHORIZED).header("Solicitud incorrecta", "El recurso no pudo ser creado").build();
        }

    }
    
}
