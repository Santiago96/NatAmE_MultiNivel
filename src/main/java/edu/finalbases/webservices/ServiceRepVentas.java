/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.webservices;

import edu.finalbases.entities.Ciudad;
import edu.finalbases.entities.Pais;
import edu.finalbases.entities.Persona;
import edu.finalbases.entities.Region;
import edu.finalbases.repositoryDAO.PersonaDAO;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.jws.WebParam;
import javax.persistence.EntityManager;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
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

    @GET
    @Path("iniciar/{numDocumento}/{password}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response iniciarSesion(@PathParam("numDocumento") String documento, @PathParam("password") String passwordP) {

        String numDocumento = documento;
        String password = passwordP;

        System.out.println("Numero Documento: " + numDocumento + " Password: " + password);

        return Response.status(Response.Status.BAD_REQUEST).header("Solicitud incorrecta", "El recurso no pudo ser creado").build();

    }

    @POST
    @Path("crearCliente")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response crearActivo(String data) {
        JSONObject informacion = new JSONObject(data);
        
        PersonaDAO personaDAO = new PersonaDAO();
        Persona p = crearPersona(informacion);
        personaDAO.crear(p);
        
        return Response.status(Response.Status.BAD_REQUEST).header("Solicitud incorrecta", "El recurso no pudo ser creado").build();

    }

    private Persona crearPersona(JSONObject informacion) {
                
        Long cedula = informacion.getLong("cedula");
        String nombre = informacion.getString("nombre");
        String apellido = informacion.getString("apellido");
        String genero = informacion.getString("genero");
        Region region = getRegion(informacion.getInt("idRegion"));
        Pais pais = getPais(informacion.getInt("idPais"));
        Ciudad ciudad = getCiudad(informacion.getInt("idCiudad"));
        Persona id_rep_ventas = getRepVentas(informacion.getLong("id_rep_ventas"));        

        Persona p = new Persona(cedula,nombre,apellido,genero.toCharArray(), ciudad, pais, region, id_rep_ventas);

        return p;

    }
    
    private Region getRegion(int idRegion){
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private Ciudad getCiudad(int idCiudad) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private Pais getPais(int aInt) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private Persona getRepVentas(long aLong) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
