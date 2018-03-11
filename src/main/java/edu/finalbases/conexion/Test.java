/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.conexion;

import edu.finalbases.entities.Cargo;
import edu.finalbases.entities.Ciudad;
import edu.finalbases.entities.Pais;
import edu.finalbases.entities.Persona;
import edu.finalbases.entities.Region;
import edu.finalbases.entities.TipoRepresentanteVentas;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Santiago
 */
public class Test {
    
   public static void main(String[] args){
       Manager m = new Manager();
       List<Pais> paises = (List<Pais>)m.getEntityManager().createQuery("SELECT P FROM "+ Pais.class.getName()+" P").getResultList();
       List<Region> regiones = (List<Region>)m.getEntityManager().createQuery("SELECT R FROM "+ Region.class.getName()+" R").getResultList();
       List<Ciudad> ciudades = (List<Ciudad>)m.getEntityManager().createQuery("SELECT C FROM "+ Ciudad.class.getName()+" C").getResultList();
       List<TipoRepresentanteVentas> tipoRepVentas = (List<TipoRepresentanteVentas>)m.getEntityManager().createQuery("SELECT T FROM "+ TipoRepresentanteVentas.class.getName()+" T").getResultList();
       
       System.out.println("Hay "+paises.size()+" paises");
       
       //crearRepresentante(paises.get(0),regiones.get(0),ciudades.get(0),tipoRepVentas.get(0));
       
   }
   
   public static void crearRepresentante(Pais p,Region r,Ciudad c,TipoRepresentanteVentas tR){
       Manager m = new Manager();
       
       Persona personaRepresentante = new Persona(new Long(10) , "Santiago", "Collazos","M".toCharArray(), c,p,r, tR, null, null);
       
       m.getEntityManager().getTransaction().begin();
       
       m.getEntityManager().persist(personaRepresentante);
       
       m.getEntityManager().getTransaction().commit();
   
   }
   
    
}
