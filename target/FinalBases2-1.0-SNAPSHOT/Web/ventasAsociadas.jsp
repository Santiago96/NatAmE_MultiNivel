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
    <div class="media">
        <div class="media-body">
            <h3 class="mt-0">Multinivel - "NatAmE"</h3>


            <%    if (rv != null) {
                    out.print("<h5 class=\"mt-0\">Historico Ventas asociadas de " + rv.getNombre() + " " + rv.getApellido() + "</h5>");
                }

            %>


        </div>
    </div>
</div>
<br><br>

<script>
    actual(4);
</script>
<jsp:include page="secciones/pies.jsp" />
