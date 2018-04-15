<%-- 
    Document   : ventasAsociadas
    Created on : Apr 4, 2018, 7:41:56 AM
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
            out.print("<h5 class=\"mt-0\">Historico Ventas asociadas de " + rv.getNombre() + " " + rv.getApellido() + "</h5>");
        }

    %>
    <br><br>

    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th class="text-center">ID de la Venta</th>
                        <th class="text-center">Fecha</th>
                        <th class="text-center">Total</th>
                        <th class="text-center">Cantidad Productos</th>
                        <th class="text-center">Tipo Pago</th>
                        <th class="text-center">Detalle Compra</th>


                    </tr>
                </thead>
                <tbody id="cart-items">

                    <%                        
                        if (false/*historicos.size() > 0*/) {

                        } else {
                            out.print("<tr>");
                            out.print("<th class=\"text-center\" style=\"color:#FF0000\";> No hay registros de ventas </th>");
                            out.print("</tr>");

                        }

                    %>
                </tbody>


            </table>

        </div>


    </div>




</div>
<br><br>

<script>
    actual(4);
</script>
<jsp:include page="secciones/pies.jsp" />
