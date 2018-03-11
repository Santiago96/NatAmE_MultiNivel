/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.conexion;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Diego Castro
 */
public class Conexion {

    private static Connection connetion = null;
    private static final String rulbd = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String user = "basesfinal";
    private static final String password = "123";

    public static Connection getConexion(){
        if (connetion == null) {
            conectar();
        }
        return connetion;
    }

    public static void desconectar() {
        connetion = null;
    }

    private static void conectar() {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            connetion = DriverManager.getConnection(rulbd, user, password);
            if (connetion != null) {
                System.out.println("Conexion exitosa a esquema " + user);
            } else {
                System.out.println("Conexion fallida");
            }
        } catch (Exception e) {
            connetion = null;
            System.out.println(e.getMessage());
        }
    }
}
