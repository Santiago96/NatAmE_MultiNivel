/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.business;

import edu.finalbases.entities.Ciudad;
import edu.finalbases.entities.Cliente;
import edu.finalbases.entities.Contacto;
import edu.finalbases.entities.Pais;
import edu.finalbases.entities.Persona;
import edu.finalbases.entities.Region;
import edu.finalbases.entities.RepresentanteVentas;
import edu.finalbases.entities.TipoContacto;
import edu.finalbases.entities.TipoRepresentanteVentas;
import edu.finalbases.repositoryDAO.CiudadDAO;
import edu.finalbases.repositoryDAO.ContactoDAO;
import edu.finalbases.repositoryDAO.HistoricocrvDAO;
import edu.finalbases.repositoryDAO.PaisDAO;
import edu.finalbases.repositoryDAO.PersonaDAO;
import edu.finalbases.repositoryDAO.RegionDAO;
import edu.finalbases.repositoryDAO.RepresentanteVentasDAO;
import edu.finalbases.repositoryDAO.TipoContactoDAO;
import edu.finalbases.repositoryDAO.TipoRepresentanteVentasDAO;
import java.sql.SQLException;
import org.json.JSONObject;

/**
 *
 * @author Santiago
 */
public class FuncionesRepVentas {

    private static FuncionesRepVentas funciones;

    private RepresentanteVentasDAO representanteDAO;

    private PaisDAO paisDAO;
    private RegionDAO regionDAO;
    private CiudadDAO ciudadDAO;
    private TipoContactoDAO tipoContactoDAO;
    private ContactoDAO contactoDAO;
    private TipoRepresentanteVentasDAO tipoRepDAO;
    private HistoricocrvDAO historicocrvDAO;
    private Persona userSession;

    private FuncionesRepVentas() {
        representanteDAO = new RepresentanteVentasDAO();
        paisDAO = new PaisDAO();
        regionDAO = new RegionDAO();
        ciudadDAO = new CiudadDAO();
        tipoContactoDAO = new TipoContactoDAO();
        contactoDAO = new ContactoDAO();
        tipoRepDAO = new TipoRepresentanteVentasDAO();
        historicocrvDAO = new HistoricocrvDAO();

    }

    public static FuncionesRepVentas getFunciones() {
        if (funciones == null) {
            funciones = new FuncionesRepVentas();
        }
        return funciones;
    }

    public int insertarCliente(JSONObject informacion) throws SQLException {
        int r;
        Persona p = crearCliente(informacion);
        r = representanteDAO.crear(p);
        System.out.println("Registrando cliente como perwsona: " + r);
        if (r == 1) {//creación exitosa  -> se crea cliente en cliente
            r = representanteDAO.crearCliente(p);
            System.out.println("Creando cliente en cliente: " + r);
            if (r == 1) {//creación exitosa  -> se crea relacion cliente repventas
                r = historicocrvDAO.crearRelacionClienteRep((Cliente)p, (RepresentanteVentas)getUserSession());
                System.out.println("Creando relacion cliente repventas: " + r);
                if (r == 1) {//creación exitosa  -> se crea contactos
                    if (informacion.has("detalleC")) {
                        Contacto c = getContacto(p, informacion);
                        if (c != null) {
                            r = contactoDAO.crear(c);
                        }
                    }
                    return representanteDAO.crearUser(p) ? 1 : 0;
                }

            }

            return 0;
        }
        return 0;
    }

    private Persona crearCliente(JSONObject informacion) throws SQLException {
        int cedula = informacion.getInt("cedula");
        String nombre = informacion.getString("nombre");
        String apellido = informacion.getString("apellido");
        String genero = informacion.getString("genero");
        Region region = getRegion(informacion.getInt("region"));
        Pais pais = getPais(informacion.getInt("pais"));
        Ciudad ciudad = getCiudad(informacion.getInt("ciudad"));
        return new Cliente(cedula, nombre, apellido, genero.toCharArray(), ciudad, pais, region);
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
        return (Persona) representanteDAO.getObjectById((int) idRepVentas);
    }

    private Contacto getContacto(Persona p, JSONObject informacion) throws SQLException {

        TipoContacto tipoC = (TipoContacto) tipoContactoDAO.getObjectById(informacion.getInt("tipoC"));
        return new Contacto(p, String.valueOf(informacion.get("detalleC")), tipoC);
    }

    public void updateConexion(String idPersona) throws SQLException {
        System.out.println("Id Persona: " + idPersona);
        Persona p = (Persona) representanteDAO.getObjectById(Integer.parseInt(idPersona));
        if (p != null) {
            if (representanteDAO.updateConexion(p) == 1) {
                System.out.println("Se actualizo campo ultimaconexion");
            } else {
                System.out.println("No se actualizo campo ultimaconexion");
            }
        } else {
            System.out.println("Persona no encontrada");
        }

    }

    public Persona getUser(String substring) throws SQLException {
        return (RepresentanteVentas) representanteDAO.getObjectById(Integer.parseInt(substring));
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

    public RepresentanteVentasDAO getRepresentanteDAO() {
        return representanteDAO;
    }

    public TipoContactoDAO getTipoContactoDAO() {
        return tipoContactoDAO;
    }

    public ContactoDAO getContactoDAO() {
        return contactoDAO;
    }

    public TipoRepresentanteVentasDAO getTipoRepDAO() {
        return tipoRepDAO;
    }

    public void setTipoRepDAO(TipoRepresentanteVentasDAO tipoRepDAO) {
        this.tipoRepDAO = tipoRepDAO;
    }

}
