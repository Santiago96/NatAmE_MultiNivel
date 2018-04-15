<%-- 
    Document   : comprasAsociadas
    Created on : Apr 4, 2018, 7:41:56 AM
    Author     : jsbon
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="edu.finalbases.business.FuncionesCliente"%>
<%@page import="edu.finalbases.entities.Persona"%>
<%@page import="edu.finalbases.entities.HistoricoCompra"%>
<%@page import="java.util.List"%>
<%@page import="edu.finalbases.repositoryDAO.HistoricoCompraDAO"%>
<jsp:include page="secciones/cabeza.jsp" />

<%
    SimpleDateFormat sdf = new SimpleDateFormat("MMM/d/yyyy");
    Persona cliente = FuncionesCliente.getFuncionesCliente().getSessionCliente();
    HistoricoCompraDAO hCDAO = new HistoricoCompraDAO();
    List<HistoricoCompra> historicos = (List) hCDAO.getObjectById(cliente.getIdPersona());

%>


<div class="container">


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

                    <%                        if (historicos.size() > 0) {
                            for (HistoricoCompra historico : historicos) {
                                out.print("<tr>");
                                out.print("<th class=\"text-center\">" + historico.getIdVenta() + "</th>");
                                out.print("<th>" + sdf.format(historico.getFechaVenta()) + "</th>");
                                out.print("<th class=\"text-center\">" + historico.getTotal() + "</th>");
                                out.print("<th class=\"text-center\">" + historico.getTotalProductos() + "</th>");
                                out.print("<th class=\"text-center\"><button class=\"btn\" onclick=\"verDetalleFactura("+historico+")\"><i class=\"fas fa-search-plus\" ></i> Ver Detalle</button></th>");
                                out.print("</tr>");
                            }
                        } else {
                            out.print("<tr>");
                            out.print("<th class=\"text-center\" style=\"color:#FF0000\";> No hay registros de compras </th>");
                            out.print("</tr>");

                        }

                    %>
                </tbody>


            </table>

        </div>


    </div>


</div>

<script>

    function verDetalleFactura(historico) {

        console.log("Ver historico");
    }

    actual(4);
</script>

<jsp:include page="secciones/pies.jsp" />
