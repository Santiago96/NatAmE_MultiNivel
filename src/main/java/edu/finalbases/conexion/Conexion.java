/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.conexion;

import edu.finalbases.repositoryDAO.FException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Santiago Collazos
 */
public class Conexion {

    private static Conexion instance;
    private Connection connetion = null;
    private static final String rulbd = "jdbc:oracle:thin:@localhost:1521:XE";
    private boolean conexionLibre = true;

    private Conexion() {

    }

    public static Conexion getInstance() {
        if (instance == null) {
            try {
                instance = new Conexion();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return instance;
    }

    public synchronized Connection getConexionBD() {
        return connetion;
    }

    public void desconectar() {
        connetion = null;
    }

    public void conectar(String user, String password) throws FException {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            connetion = DriverManager.getConnection(rulbd, user, password);
            if (connetion != null) {
                System.out.println("Conexion exitosa a esquema " + user);
            } else {
                System.out.println("Conexion fallida");
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            throw new FException( "Conexion", "No se pudo Conectar, " + ex.getMessage());
        }
    }

    public synchronized Connection tomarConexion() {
        while (!conexionLibre) {
            try {
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        conexionLibre = false;
        notify();
        return connetion;
    }

    /**
     * Libera la conexion de la bases de datos para que ningun otro proceso la
     * pueda utilizar
     */
    public synchronized void liberarConexion() {
        while (conexionLibre) {
            try {
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        conexionLibre = true;
        notify();
    }
    
    public void cerrarConexion() throws SQLException{
        if(connetion!=null){
            //connetion.close();
        }
    }

}
