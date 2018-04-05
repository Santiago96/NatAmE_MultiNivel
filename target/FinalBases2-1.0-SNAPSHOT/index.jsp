<%-- 
    Document   : index
    Created on : Mar 31, 2018, 1:02:43 PM
    Author     : jsbon
--%>


<%@page import="edu.finalbases.repositoryDAO.PersonaDAO"%>
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
                PersonaDAO pDAO = new PersonaDAO();
                Persona pRV = (Persona)pDAO.getObjectById(cliente.getId_rep_ventas().getIdPersona());
                out.print("<h5 class=\"mt-0\">Eres Cliente y tu representante de ventas es: "+pRV.getNombre()+" "+pRV.getApellido()+"</h5>"); 
          }
      %>
      
      
    
        Empresa especializada en productos naturales y amigables con el medio ambiente, 
        con presencia en diferentes paises, y un amplio catálogo de productos.
        <br>
        <img id="back" src="Web/img/back.jpg">
  </div>
</div>
</div>
<br><br>



<script>    
   actual(1);
</script>
<jsp:include page="Web/secciones/pies.jsp" />

