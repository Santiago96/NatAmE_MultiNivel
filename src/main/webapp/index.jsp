<%-- 
    Document   : index
    Created on : Mar 31, 2018, 1:02:43 PM
    Author     : jsbon
--%>


<jsp:include page="Web/secciones/cabeza.jsp" />
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
          Persona cliente = FuncionesCliente.getFuncionesCliente().getSessionCliente();
            Persona persona;
  
          if(p!=null){
                persona=p;
          }else{
                persona=cliente;
          }
          
          if (persona!=null)
          out.print("<h4 class=\"mt-0\">Bienvenido de nuevo "+ persona.getNombre() +"</h4>"); 
          
          if(p!=null){
                out.print("<h5 class=\"mt-0\">Eres Representante de Ventas </h5>"); 
          }
          if(cliente!=null){
                out.print("<h5 class=\"mt-0\">Eres Cliente</h5>"); 
          }
      %>
      
      
    
        Empresa especializada en productos naturales y amigables con el medio ambiente, 
        con presencia en diferentes paises, y un amplio cat�logo de productos.
  </div>
</div>
</div>
<br><br>



<script>    
   actual(1);
</script>
<jsp:include page="Web/secciones/pies.jsp" />

