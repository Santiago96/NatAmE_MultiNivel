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
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import org.json.JSONObject;

/**
 *
 * @author Santiago
 */
@Path("repVentas")
public class ServiceRepVentas {

    private Connection cnx;

    @GET
    @Path("iniciar/{usuario}/{password}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response iniciarSesion(@PathParam("usuario") String usuario, @PathParam("password") String passwordP) throws SQLException {

        String user = usuario;
        String password = passwordP;
        System.out.println("Usuario: " + user + " Password: " + password);
        Conexion.getInstance().conectar(user, password);
        cnx = Conexion.getInstance().getConexionBD();
        if (cnx != null) {
            FuncionesRepVentas.getFunciones().updateConexion(user.substring(1));
            Persona p =  FuncionesRepVentas.getFunciones().getUser(user.substring(1));
            FuncionesRepVentas.getFunciones().setUserSession(p);
            return Response.ok(p).build();
        } else {
            return Response.status(Response.Status.UNAUTHORIZED).header("Solicitud incorrecta", "El recurso no pudo ser creado").build();
        }

    }

    @POST
    @Path("crearCliente")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response crearCliente(String data) throws SQLException{
        JSONObject informacion = new JSONObject(data);
        if (FuncionesRepVentas.getFunciones().insertarPersona(informacion) == 1) {
            return Response.status(Response.Status.CREATED).header("Solicitud correcta", "Cliente creado").build();
        } else {
            return Response.status(Response.Status.CONFLICT).header("Solicitud incorrecta", "No se pudo crear el cliente").build();
        }

    }
    
    

}
