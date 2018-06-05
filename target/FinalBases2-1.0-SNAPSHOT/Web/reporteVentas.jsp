<%-- 
    Document   : reporteVentas
    Created on : Jun 4, 2018, 4:38:56 PM
    Author     : jsbon
--%>
<%@page import="edu.finalbases.business.FuncionesRepVentas"%>
<%@page import="edu.finalbases.business.FuncionesCliente"%>
<%@page import="edu.finalbases.entities.Persona"%>
<%
    //Persona cliente = FuncionesCliente.getFuncionesCliente().getSessionCliente();
    Persona rv = FuncionesRepVentas.getFunciones().getUserSession();


%>

<jsp:include page="secciones/cabeza.jsp" />
<br><br>
<div class="container">
    <%    if (rv != null) {
            out.print("<h5 class=\"mt-0\">Reporte de Ventas - Para todos los representantes de ventas </h5>");
        }

    %>
    <br><br>
    
    
    <script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    
    <div class="container">
  <div class="row">
    <div class="col-sm">
      <label for="inicio">Fecha Inicio:</label>
    <input id="finicio" width="276" />
    <script>
        $('#finicio').datepicker({
            uiLibrary: 'bootstrap4'
        });
    </script>
    </div>
    <div class="col-sm">
      <label for="inicio">Fecha Final:</label>
    <input id="ffin" width="276" />
    <script>
        $('#ffin').datepicker({
            uiLibrary: 'bootstrap4'
        });
    </script>
    </div>
    <div class="col-sm">
        <br>
        
      <input class="btn btn-success" style="margin-top:8px;" type="submit" onclick="mostrarReporte();"  value = "Consultar" />
    </div>
  </div>
</div>
    <br>
    
    
    
    
    

<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">ID Representante de Ventas</th>
      <th scope="col">Numero de Ventas</th>
      <th scope="col">Valor Vendido Total</th>
    </tr>
  </thead>
  <tbody id="tablaCuerpo">
    
  </tbody>
</table>


</div>
<br><br>

<script>
    actual(4);
    
    //mostrarReporte = function(){
        var objeto = new Object();
        objeto.idrep = "1018485092";
        objeto.totalventas = "4";
        objeto.totalplata = "397900";
        
        var json = new Object();
        json[1] = objeto;
        json[2] = objeto;
        json[3] = objeto;
        
        var html;
        Object.keys(json).map(function(objectKey, index) {
            var value = json[objectKey];
            html = "<tr>";
            html = html + "<th scope=\"row\">";
            html = html + (index+1);
            html = html + "</th>"
            html = html + "<td>" + value.idrep + "</td>";
            html = html + "<td>" + value.totalventas + "</td>";
            html = html + "<td>" + value.totalplata + "</td>";
            html = html + "</tr>";
            document.getElementById("tablaCuerpo").innerHTML = document.getElementById("tablaCuerpo").innerHTML + html;
            
            html = "";
        });
        
    //};
    
    consultarReporte = function(inicial,final,idrep){
        var datos = {
            fechaInicial:inicial,
            fechaFinal:final,
            idRepVentas:idrep
        };
        
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/api/repVentas/reporte',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            data: JSON.stringify(datos),
            success: function (response) {
                console.log("success ");
                console.log(response);
                if(response.message == "exito"){
                    modalMensaje("Exito", responde.message);
                }else{
                    modalMensaje("Error", response.message);
                }
            },
            error: function (response) {
                console.log(response);
                if(response.responseText == "exito"){
                    modalMensaje("Exito", "El cliente fue creado Exitosamente");
                }else{
                    modalMensaje("Error", "Error creando al cliente");
                }
            }
        });

    
};
    
    
</script>
<jsp:include page="secciones/pies.jsp" />

