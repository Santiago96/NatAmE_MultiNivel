/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.conexion;

import edu.finalbases.repositoryDAO.FException;
import edu.finalbases.repositoryDAO.ProcedimientosDAO;
import java.sql.SQLException;
import java.text.ParseException;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Santiago
 */
public class Test {

    public static void main(String[] args) throws SQLException, FException, ParseException {

        Conexion.getInstance().conectar("s1018485092", "finalbases");

        ProcedimientosDAO pDAO = new ProcedimientosDAO();
        String[] respuesta = pDAO.generarReporte("31/05/2018", "04/06/2018").split(";");

        JSONArray arreglo = new JSONArray();

        for (String linea : respuesta) {
            String[] campos = linea.split(",");
            JSONObject info = new JSONObject();

            info.put("idrep", campos[0]);
            info.put("totalplata", campos[1]);
            info.put("totalventas", campos[2]);
            arreglo.put(info);

        }
        System.out.println("Arreglo: \n"+arreglo.toString());

    }
}
