/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.business;

import edu.finalbases.entities.Ciudad;
import edu.finalbases.entities.Pais;
import edu.finalbases.entities.Persona;
import edu.finalbases.entities.Region;
import edu.finalbases.repositoryDAO.CiudadDAO;
import edu.finalbases.repositoryDAO.PaisDAO;
import edu.finalbases.repositoryDAO.PersonaDAO;
import edu.finalbases.repositoryDAO.RegionDAO;
import org.json.JSONObject;

/**
 *
 * @author Santiago
 */
public class FuncionesRepVentas {
    
    private static FuncionesRepVentas funciones;
    
    private PersonaDAO personaDAO;
    
    private PaisDAO paisDAO;
    private RegionDAO regionDAO;
    private CiudadDAO ciudadDAO;

    private FuncionesRepVentas() {
        personaDAO = new PersonaDAO();
        paisDAO = new PaisDAO();
        regionDAO = new RegionDAO();
        ciudadDAO = new CiudadDAO();
    }
    
    public static FuncionesRepVentas getFunciones(){
        if(funciones==null){
            funciones = new FuncionesRepVentas();
        }
        return funciones;
    }
    
    public void insertarPersona(JSONObject informacion){        
        Persona p = crearPersona(informacion);
        personaDAO.crear(p);        
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
        
        return new Persona(cedula, nombre, apellido, genero.toCharArray(), ciudad, pais, region, id_rep_ventas);

    }

    private Region getRegion(int idRegion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private Ciudad getCiudad(int idCiudad) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private Pais getPais(int idPais) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private Persona getRepVentas(long idRepVentas) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
