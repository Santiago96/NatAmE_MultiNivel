<%-- 
    Document   : CrearCliente
    Created on : 11/03/2018, 08:27:37 AM
    Author     : Santiago
--%>

<%@page import="java.util.Collections"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="edu.finalbases.business.FuncionesRepVentas"%>
<%@page import="edu.finalbases.entities.Persona"%>
<%@page import="edu.finalbases.entities.TipoContacto"%>
<%@page import="edu.finalbases.repositoryDAO.TipoContactoDAO"%>
<%@page import="edu.finalbases.entities.Region"%>
<%@page import="edu.finalbases.repositoryDAO.RegionDAO"%>
<%@page import="edu.finalbases.entities.Ciudad"%>
<%@page import="edu.finalbases.repositoryDAO.CiudadDAO"%>
<%@page import="java.util.List"%>
<%@page import="edu.finalbases.entities.Pais"%>
<%@page import="edu.finalbases.repositoryDAO.PaisDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="secciones/Head.jsp" />

<%
    PaisDAO paisDAO = new PaisDAO();
    List<Pais> paises = paisDAO.getPaises();

    RegionDAO regionDAO = new RegionDAO();
    List<Region> regiones = regionDAO.getRegiones();

    CiudadDAO ciudadDAO = new CiudadDAO();
    List<Ciudad> ciudades = ciudadDAO.getCiudades();

    TipoContactoDAO tipoContactoDAO = new TipoContactoDAO();
    List<TipoContacto> tiposContacto = tipoContactoDAO.getTiposContacto();

    Persona p = FuncionesRepVentas.getFunciones().getUserSession();

%>
<div class="container">
    <h2>Formulario</h2>    
    <form id="formActivo" onsubmit="crearCliente(); return false;">
        <div id="ok"></div>
        <div class="form-group">
            <label for="cedula">Cédula:</label>
            <input type="number" name="cedula" min="1" class="form-control" id="cedula" placeholder="Cédula" oninvalid="this.setCustomValidity('Ingrese Una Cédula Válida')" oninput="setCustomValidity('')" required>
        </div>
        <div class="form-group">
            <label for="nombre">Nombre:</label>
            <input type="text" name="nombre" class="form-control" id="nombre" placeholder="Nombre" oninvalid="this.setCustomValidity('Ingrese un Nombre válido')" oninput="setCustomValidity('')" required>
        </div>
        <div class="form-group">
            <label for="apellido">Apellido:</label>
            <input type="text" name="apellido" class="form-control" id="apellido" placeholder="Apellido" oninvalid="this.setCustomValidity('Ingrese un Apellido Válido')" oninput="setCustomValidity('')" required>
        </div>
        <div class="form-group">
            <label for="genero">Genero:</label>
            <!--<input type="text" name="genero" class="form-control" id="genero" placeholder="Género" oninvalid="this.setCustomValidity('ingrese el Género del Cliente')" oninput="setCustomValidity('')" required>-->
            <select name="genero" class="form-control" id="genero" oninvalid="this.setCustomValidity('Seleccione un Genero')" oninput="setCustomValidity('')" required>
                <option value="M">Masculino</option>
                <option value="F">Femenino</option>
            </select>
        </div>
        <div class="form-group">
            <label for="pais">Pais:</label>
            <select name="pais" class="form-control" id="pais" onchange="cargarRegiones(); cargarCiudades()" oninvalid="this.setCustomValidity('Seleccione un País')" oninput="setCustomValidity('')" required>
                <%                    for (Pais pais : paises) {
                        out.print("<option value='" + pais.getIdPais() + "'>" + pais.getNombrePais() + "</option>");
                    }
                %>
            </select>
        </div>
        <div class="form-group">
            <label for="region">Region:</label>
            <select name="region" class="form-control" id="region" onchange="cargarCiudades()" oninvalid="this.setCustomValidity('Seleccione una Región')" oninput="setCustomValidity('')" required></select>
        </div>
        <div class="form-group">
            <label for="ciudad">Ciudad:</label>
            <select name="ciudad" class="form-control" id="ciudad" oninvalid="this.setCustomValidity('Seleccione una Ciudad')" oninput="setCustomValidity('')" required></select>
        </div>
        <div class="form-group">
            <div class="col-xs-12">
                <div class="col-md-3" >
                    <label for="tipoC">Tipo Contacto: </label>
                    <select name="tipoC" class="form-control" id="tipoC" oninvalid="this.setCustomValidity('Seleccione el tipo de Contacto del Cliente')" oninput="setCustomValidity('')" required>
                        <% for (TipoContacto tipoContacto : tiposContacto) {
                                out.print("<option value='" + tipoContacto.getIdTipoContacto() + "'>" + tipoContacto.getNombreTipoContacto() + "</option>");
                            }
                        %>
                    </select>
                    <label for="detalleC">Detalle Contacto: </label>
                    <input type="text" name="detalleC" class="form-control" id="detalleC" placeholder="Detalle Contacto" oninvalid="this.setCustomValidity('Ingrese un valor válido')" oninput="setCustomValidity('')" required>
                    <br><br>
                </div>
            </div>
        </div>
        <!--<div class="form-group">
            <label for="date">Fecha de Compra:</label>
            <input size="16" type="date" name="date" id="date" class="form-control">
        </div>-->
        <br><br><br>
        <hr>
        <input class="btn btn-success" type="submit" value = "Crear Cliente" />
    </form>
</div>

<jsp:include page="secciones/Footer.jsp" />

<br>
<br>

<script>
    var paises = <% out.print("[");
        Pais pais;
        for (int i = 0; i < paises.size(); i++) {
            pais = paises.get(i);
            if (i == paises.size() - 1) {
                out.print("{idpais:'" + pais.getIdPais() + "',nombre:'" + pais.getNombrePais() + "'}]");
            } else {
                out.print("{idpais:'" + pais.getIdPais() + "',nombre:'" + pais.getNombrePais() + "'},");
            }
        }%>;
    var regiones = <% out.print("[");
        Region region;
        for (int i = 0; i < regiones.size(); i++) {
            region = regiones.get(i);
            if (i == regiones.size() - 1) {
                out.print("{idregion:'" + region.getIdRegion() + "',nombre:'" + region.getNombreRegion() + "',idpais:'" + region.getPais().getIdPais() + "'}]");
            } else {
                out.print("{idregion:'" + region.getIdRegion() + "',nombre:'" + region.getNombreRegion() + "',idpais:'" + region.getPais().getIdPais() + "'},");
            }
        }%>;
    var ciudades = <% out.print("[");
        Ciudad ciudad;
        for (int i = 0; i < ciudades.size(); i++) {
            ciudad = ciudades.get(i);
            if (i == ciudades.size() - 1) {
                out.print("{idciudad:'" + ciudad.getIdCiudad() + "',nombre:'" + ciudad.getNombreCiudad() + "',idregion:'" + ciudad.getRegion().getIdRegion() + "'}]");
            } else {
                out.print("{idciudad:'" + ciudad.getIdCiudad() + "',nombre:'" + ciudad.getNombreCiudad() + "',idregion:'" + ciudad.getRegion().getIdRegion() + "'},");
            }
        }%>;
    cargarRegiones();
    cargarCiudades();
    function cargarRegiones() {
        var pais = document.getElementById('pais');
        var region = document.getElementById('region');
        var paisSeleccionado = pais.value;
        $("#region").empty();
        if (paisSeleccionado !== "") {
            for (i = 0; i < regiones.length; i++) {
                if (regiones[i].idpais === paisSeleccionado) {
                    let opcion = document.createElement('option');
                    opcion.value = regiones[i].idregion;
                    opcion.text = regiones[i].nombre;
                    region.add(opcion);
                }
            }
        }
    }

    function cargarCiudades() {
        var region = document.getElementById('region');
        var ciudad = document.getElementById('ciudad');
        var regionSeleccionada = region.value;
        $("#ciudad").empty();
        if (regionSeleccionada !== "") {
            for (i = 0; i < ciudades.length; i++) {
                if (ciudades[i].idregion === regionSeleccionada) {
                    let opcion = document.createElement('option');
                    opcion.value = ciudades[i].idciudad;
                    opcion.text = ciudades[i].nombre;
                    ciudad.add(opcion);
                }
            }
        }
    }

    function limpiarCampos() {
        console.log("Limpiando Campos");
        $('#cedula').val("");
        $('#nombre').val("");
        $('#apellido').val("");
        $('#genero').val("");
        $('#detalleC').val("");
    }

    function capturarCampos() {
        console.log("Capturando Campos");
        var datos = {
            cedula: $('#cedula').val(),
            nombre: $('#nombre').val(),
            apellido: $('#apellido').val(),
            genero: $('#genero').val(),
            pais: $('#pais').val(),
            region: $('#region').val(),
            ciudad: $('#ciudad').val(),
            detalleC: $('#detalleC').val(),
            tipoC: $('#tipoC').val(),
            id_rep_ventas: <% out.print(p.getIdPersona());%>
        };
        return datos;
    }

    /*function validarGenero() {
     var genero = document.getElementById("genero").val();
     if (genero === "F" || genero === "M") {
     return true;
     } else {
     alert("Ingrese un Genero Valido (M o F)");
     return false;
     }
     }*/

    function crearCliente() {
        console.log("Creando Cliente");
        var datos = capturarCampos();
        console.log(datos);
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/api/repVentas/crearCliente',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            data: JSON.stringify(datos),
            success: function (response) {
                console.log("success ");
                console.log(response);
                if (response.textStatus = "Conflict") {
                    alert("Cliente creado");
                } else {
                    alert("Error al crear el cliente");
                }

            },
            error: function (textStatus) {
                console.log("error ");
                console.log(textStatus);
                if (textStatus.textStatus = "Conflict") {
                    alert("Cliente creado");
                } else {
                    alert("Error al crear el cliente");
                }


            }
        });
        limpiarCampos();
    }


</script>
