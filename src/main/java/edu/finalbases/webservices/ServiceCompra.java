/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.webservices;

/**
 *
 * @author Santiago
 */
import edu.finalbases.business.FuncionesCompra;
import edu.finalbases.conexion.Conexion;
import edu.finalbases.entities.Persona;
import edu.finalbases.repositoryDAO.FException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import org.json.JSONObject;


@Path("compra")
public class ServiceCompra {
    
    private Connection cnx;
    
    
    
    @POST
    @Path("pagar")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response generarPago(String data) throws SQLException {
        JSONObject informacion = new JSONObject(data);        
        System.out.println("Informacion: "+informacion);        
        try {
            if(FuncionesCompra.getFuncionesCompra().generarPago(informacion) == 1){
                return Response.status(Response.Status.CREATED).header("Creado", "El recurso ha sido creado").build();
            }
        } catch (FException ex) {
            return Response.ok(ex).build();
        }
        return Response.status(Response.Status.BAD_REQUEST).header("Solicitud incorrecta", "El recurso no pudo ser creado").build();

    } 
    
}
