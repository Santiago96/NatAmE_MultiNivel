<%-- 
    Document   : comprasAsociadas
    Created on : Apr 4, 2018, 7:41:56 AM
    Author     : jsbon
--%>
<%@page import="edu.finalbases.business.FuncionesRepVentas"%>
<%@page import="edu.finalbases.business.FuncionesCliente"%>
<%@page import="edu.finalbases.entities.Persona"%>
<%
    Persona cliente = FuncionesCliente.getFuncionesCliente().getSessionCliente();
    Persona rv = FuncionesRepVentas.getFunciones().getUserSession();
%>


<jsp:include page="secciones/cabeza.jsp" />

<script>
     <%     if (cliente == null) {
            out.print("actual(5);");
        } else {
            out.print("actual(4 );");
        }
    %>
</script>
<jsp:include page="secciones/pies.jsp" />