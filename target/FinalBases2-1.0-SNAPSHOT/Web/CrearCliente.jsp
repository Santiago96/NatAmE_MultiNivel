<%-- 
    Document   : CrearCliente
    Created on : 11/03/2018, 08:27:37 AM
    Author     : Santiago
--%>

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

%>

<div class="container">
    <h2>Formulario</h2>    
    <form id="formActivo">
        <div id="ok"></div>
        <div class="form-group">
            <label for="cedula">Cédula:</label>
            <input type="number" name="cedula" min="1" class="form-control" id="cedula">
        </div>
        <div class="form-group">
            <label for="nombre">Nombre:</label>
            <input type="text" name="nombre" class="form-control" id="nombre">
        </div>

        <div class="form-group">
            <label for="apellido">Apellido:</label>
            <input type="text" name="apellido" class="form-control" id="apellido">
        </div>

        <div class="form-group">
            <label for="genero">Genero:</label>
            <input type="text" name="genero" class="form-control" id="genero">
        </div>

        <div class="form-group">
            <label for="pais">Pais:</label>
            <select name="pais" class="form-control" id="pais">
                <%                    for (Pais pais : paises) {
                        out.print("<option value='" + pais.getIdPais() + "'>" + pais.getNombrePais() + "</option>");
                    }
                %>
            </select>
        </div>

        <div class="form-group">
            <label for="region">Region:</label>
            <select name="region" class="form-control" id="region">
                <%                    for (Region region : regiones) {
                        out.print("<option value='" + region.getIdRegion() + "'>" + region.getNombreRegion() + "</option>");
                    }
                %>
            </select>
        </div>

        <div class="form-group">
            <label for="ciudad">Ciudad:</label>
            <select name="ciudad" class="form-control" id="ciudad">
                <%                    for (Ciudad ciudad : ciudades) {
                        out.print("<option value='" + ciudad.getIdCiudad() + "'>" + ciudad.getNombreCiudad() + "</option>");
                    }
                %>
            </select>
        </div>

        <!--<div class="form-group">
            <label for="date">Fecha de Compra:</label>
            <input size="16" type="date" name="date" id="date" class="form-control">
        </div>-->



        <hr>





        <input class="btn btn-success" type="button" onclick="crearCliente()" value = "Crear Cliente" />   
    </form>
</div>


<jsp:include page="secciones/Footer.jsp" />



<script>
    function limpiarCampos() {
        console.log("Limpiando Campos");
        $('#cedula').val("");
        $('#nombre').val("");
        $('#apellido').val("");
        $('#genero').val("");
        $('#pais').val("");
        $('#region').val("");
        $('#ciudad').val("");

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
            ciudad: $('#ciudad').val()
        };

        return datos();

    }
    function crearCliente() {
        console.log("Creando Cliente");
        var datos = capturarCampos();
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/api/repVentas/crearCliente',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            data: JSON.stringify(datos),
            success: function (response) {
                console.log(response);
                if (response.textStatus == "Accepted") {
                    console.log("Datos Correctos");
                    ocultarModal();
                    alert("Bienvenido");
                } else {
                    console.log("Datos incorrectos");
                    alert("Datos incorrectos");
                }
            },
            error: function (textStatus) {
                console.log(textStatus);
                if (textStatus.statusText == "Accepted") {
                    console.log("Datos Correctos");
                    ocultarModal();
                    alert("Bienvenido");
                } else {
                    console.log("Datos incorrectos");
                    alert("Datos incorrectos");
                }

            }
        });
        
        limpiarCampos();

    }


</script>
