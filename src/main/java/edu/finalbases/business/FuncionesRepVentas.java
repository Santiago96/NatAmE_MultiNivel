/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.business;

import edu.finalbases.entities.Ciudad;
import edu.finalbases.entities.Contacto;
import edu.finalbases.entities.Pais;
import edu.finalbases.entities.Persona;
import edu.finalbases.entities.Region;
import edu.finalbases.entities.TipoContacto;
import edu.finalbases.repositoryDAO.CiudadDAO;
import edu.finalbases.repositoryDAO.ContactoDAO;
import edu.finalbases.repositoryDAO.FException;
import edu.finalbases.repositoryDAO.PaisDAO;
import edu.finalbases.repositoryDAO.PersonaDAO;
import edu.finalbases.repositoryDAO.RegionDAO;
import edu.finalbases.repositoryDAO.TipoContactoDAO;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
    private TipoContactoDAO tipoContactoDAO;
    private ContactoDAO contactoDAO;

    private Persona userSession;

    private FuncionesRepVentas() {
        personaDAO = new PersonaDAO();
        paisDAO = new PaisDAO();
        regionDAO = new RegionDAO();
        ciudadDAO = new CiudadDAO();
        tipoContactoDAO = new TipoContactoDAO();
        contactoDAO = new ContactoDAO();

    }

    public static FuncionesRepVentas getFunciones() {
        if (funciones == null) {
            funciones = new FuncionesRepVentas();
        }
        return funciones;
    }

    public int insertarPersona(JSONObject informacion) throws SQLException, FException {
        int r;
        Persona p = crearPersona(informacion);
        try {
            r = personaDAO.crear(p);
        } catch (FException ex) {
            throw ex;
        }
        System.out.println("Registrando cliente: " + r);
        if (r == 1) {//creación exitosa  -> se crean contactos
            if (informacion.has("detalleC")) {
                Contacto c = getContacto(p, informacion);
                if (c != null) {
                    try {
                        r = contactoDAO.crear(c);
                    } catch (FException ex) {
                        throw ex;
                    }
                }
            }
            try {
                return personaDAO.crearUser(p) ? 1 : 0;
            } catch (FException ex) {
                throw ex;
            }
        }
        return 0;
    }

    private Persona crearPersona(JSONObject informacion) throws SQLException {
        int cedula = informacion.getInt("cedula");
        String nombre = informacion.getString("nombre");
        String apellido = informacion.getString("apellido");
        String genero = informacion.getString("genero");
        Region region = getRegion(informacion.getInt("region"));
        Pais pais = getPais(informacion.getInt("pais"));
        Ciudad ciudad = getCiudad(informacion.getInt("ciudad"));
        Persona id_rep_ventas = getRepVentas(informacion.getInt("id_rep_ventas"));

        return new Persona(cedula, nombre, apellido, genero.toCharArray(), ciudad, pais, region, id_rep_ventas);

    }

    private Region getRegion(int idRegion) throws SQLException {
        return (Region) regionDAO.getObjectById(idRegion);
    }

    private Ciudad getCiudad(int idCiudad) throws SQLException {
        return (Ciudad) ciudadDAO.getObjectById(idCiudad);
    }

    private Pais getPais(int idPais) throws SQLException {
        return (Pais) paisDAO.getObjectById(idPais);
    }

    private Persona getRepVentas(long idRepVentas) throws SQLException {
        return (Persona) personaDAO.getObjectById((int) idRepVentas);
    }

    private Contacto getContacto(Persona p, JSONObject informacion) throws SQLException {

        TipoContacto tipoC = (TipoContacto) tipoContactoDAO.getObjectById(informacion.getInt("tipoC"));
        return new Contacto(p, String.valueOf(informacion.get("detalleC")), tipoC);
    }

    public void updateConexion(String idPersona) throws SQLException, FException {
        System.out.println("Id Persona: " + idPersona);
        Persona p = (Persona) personaDAO.getObjectById(Integer.parseInt(idPersona));
        if (p != null) {
            try {
                if (personaDAO.updateConexion(p) == 1) {
                    System.out.println("Se actualizo campo ultimaconexion");
                } else {
                    System.out.println("No se actualizo campo ultimaconexion");
                }
            } catch (FException ex) {
                throw ex;
            }
        }else{
            System.out.println("Persona no encontrada");
        }

    }

    public Persona getUser(String substring) throws SQLException {
        return (Persona) personaDAO.getObjectById(Integer.parseInt(substring));
    }

    public void setUserSession(Persona p) {
        userSession = p;
    }

    public Persona getUserSession() {
        return userSession;
    }

    public PaisDAO getPaisDAO() {
        return paisDAO;
    }

    public RegionDAO getRegionDAO() {
        return regionDAO;
    }

    public CiudadDAO getCiudadDAO() {
        return ciudadDAO;
    }
    
    

}
