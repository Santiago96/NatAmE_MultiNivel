<%-- 
    Document   : index
    Created on : Mar 31, 2018, 1:02:43 PM
    Author     : jsbon
--%>


<jsp:include page="secciones/cabeza.jsp" />
<%@page import="edu.finalbases.business.FuncionesRepVentas"%>
<%@page import="edu.finalbases.business.FuncionesCliente"%>
<%@page import="edu.finalbases.entities.Persona"%>

<br><br>
<div class="container">
<div class="media">
  <div class="media-body">
      <h3 class="mt-0">Multinivel - "NatAmE"</h3>
      <br>
      <%
          Persona p = FuncionesRepVentas.getFunciones().getUserSession();
          if (p!=null)
          out.print("<h4 class=\"mt-0\">Bienvenido de nuevo "+ p.getNombre() +"</h4>");            
      %>
      
      
    
        Empresa especializada en productos naturales y amigables con el medio ambiente, 
        con presencia en diferentes paises, y un amplio catálogo de productos.
  </div>
</div>
</div>
<br><br>



<script>    
   actual(1);
</script>
<jsp:include page="secciones/pies.jsp" />

