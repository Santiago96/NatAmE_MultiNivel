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
        
      <input class="btn btn-success" type="submit" onclick="" value = "Consultar" />
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
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>


</div>
<br><br>

<script>
    actual(4);
    mostrarReporte = function(json){
        
        
    };
    consultarReporte = function(inicial,final,idrep){
    
                    $.ajax({
                        type: 'GET',
                        url: '${pageContext.request.contextPath}/api/compra/articulo/' + id,
                        dataType: "json",
                        success: function (response) {
                            console.log(response);
                            document.getElementById("detalleModalTitle").innerHTML = response['nombreProducto'];
                            document.getElementById("detalleModalBody").innerHTML = response['descripcion'];
                            var imagenes = response['path'].split(";"); 
                            
                            
                            for(i=0;i<imagenes.length;i++){
                                imagenes[i] = "<img class=\"detimagen img-thumbnail \" src=\"" + imagenes[i] + "\">";                                
                            }
                            
                            var compiladas = "";
                            for(i=0;i<imagenes.length;i++){
                                compiladas = compiladas + imagenes[i];
                            }
                            console.log(compiladas);
                            document.getElementById("imagenModalBody").innerHTML = compiladas;
                            
                        },
                        error: function (textStatus) {
                            console.log(textStatus);                            

                        }
                    });
    
};
    
    
</script>
<jsp:include page="secciones/pies.jsp" />

