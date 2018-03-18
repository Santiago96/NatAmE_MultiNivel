/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.webservices;

import edu.finalbases.business.FuncionesRepVentas;
import edu.finalbases.conexion.Conexion;
import edu.finalbases.repositoryDAO.PersonaDAO;
import edu.finalbases.entities.Region;
import edu.finalbases.entities.Ciudad;
import edu.finalbases.entities.Pais;
import edu.finalbases.entities.Persona;
import java.sql.Connection;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import org.json.JSONObject;




/**
 *
 * @author Santiago
 */
@Path("repVentas")
public class ServiceRepVentas {
    private Conexion conexion;
    
    private Connection cnx;

    @GET
    @Path("iniciar/{numDocumento}/{password}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response iniciarSesion(@PathParam("numDocumento") String documento, @PathParam("password") String passwordP) {

        String numDocumento = documento;
        String password = passwordP;

        System.out.println("Numero Documento: " + numDocumento + " Password: " + password);

        
        Conexion.getInstance().conectar("finalbases", password);
                
        cnx = Conexion.getInstance().getConexionBD();

        if (cnx!= null) {            
            return Response.status(Response.Status.ACCEPTED).header("Solicitud aceptada", "El recurso fue reservado").build();
        } else {
            return Response.status(Response.Status.UNAUTHORIZED).header("Solicitud incorrecta", "El recurso no pudo ser creado").build();
        }

    }

    @POST
    @Path("crearCliente")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response crearCliente(String data) {
        JSONObject informacion = new JSONObject(data);

        
        FuncionesRepVentas.getFunciones().insertarPersona(informacion);        

        return Response.status(Response.Status.ACCEPTED).header("Solicitud incorrecta", "El recurso no pudo ser creado").build();

    }
    
   

    
    
    
    

}
