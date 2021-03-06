<%-- 
    Document   : Productos
    Created on : 27/03/2018, 09:48:05 PM
    Author     : Santiago
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="edu.finalbases.conexion.Conexion"%>
<%@page import="edu.finalbases.business.FuncionesRepVentas"%>
<%@page import="edu.finalbases.entities.Persona"%>
<%@page import="edu.finalbases.business.FuncionesCliente"%>
<%@page import="edu.finalbases.repositoryDAO.ProductoDAO"%>
<%@page import="edu.finalbases.repositoryDAO.ArticuloDAO"%>
<%@page import="edu.finalbases.entities.Categoria"%>
<%@page import="edu.finalbases.entities.Producto"%>
<%@page import="edu.finalbases.entities.Item"%>
<%@page import="edu.finalbases.entities.Articulo"%>
<%@page import="java.util.List"%>
<%@page import="edu.finalbases.repositoryDAO.CategoriaDAO"%>
 

<%
         
    
    CategoriaDAO categoriaDAO = new CategoriaDAO();
    List<Categoria> categorias = categoriaDAO.getSoloCategorias();
    List<Categoria> subCategorias;
    
    Persona cliente = FuncionesCliente.getFuncionesCliente().getSessionCliente();
    
    
     ArticuloDAO articuloDAO = new ArticuloDAO();
     List<Articulo> articulos = articuloDAO.getProductos(cliente.getRegion().getIdRegion());
    
    

%>
<style>
    .detimagen{
            width:100px;
            height:100px;
            margin-left:5px;
        }
    
</style>
<%!
   public String tarjeta(int id, String nombre, float precio, String imagen, int cantidad, int idsubcategoria){
       String html = "";
       
       
       html = html + "<div x class=\"col-lg-3 col-md-6 mb-4 sub sub"+idsubcategoria+"\">";
       html = html + "     <div class=\"card\">";
       html = html + "         <img onclick=\"actualizarModal(" + id + ")\" data-toggle=\"modal\" data-target=\"#detalleModal\" class=\"card-img-top\" src=\"" + imagen + "\" alt=\"\">";
       html = html + "         <div onclick=\"actualizarModal(" + id + ")\" data-toggle=\"modal\" data-target=\"#detalleModal\" class=\"card-body\">";
       html = html + "             <h4 class=\"card-title\">" + nombre + "</h4>";
       html = html + "             <p class=\"card-text\">Precio: $" + String.valueOf(Math.round(precio)) +"</p>";
       if (cantidad!=0)
       html = html + "             <a href=\"#\" class=\"badge badge-info\">"+cantidad+" Unidades Disponibles</a>";
       else
       html = html + "             <a href=\"#\" class=\"badge badge-secondary\">"+cantidad+" Unidades Disponibles</a>";
       html = html + "         </div>";
       html = html + "         <div class=\"card-footer\">";
       html = html + "             <form action=\"\" class=\"form\" data-cesta-feira-form>";
       html = html + "                 <div class=\"form-group\">";
       if(cantidad==0)
       html = html + "                     <input type=\"number\" disabled min=\""+ String.valueOf(cantidad) +"\" max=\""+ String.valueOf(cantidad) +"\" value=\""+ String.valueOf(cantidad) +"\" class=\"form-control\" name=\"quantity\" data-cesta-feira-attribute placeholder=\"Quantity\">";
       else
       html = html + "                     <input type=\"number\" min=\"1\" max=\""+ String.valueOf(cantidad) +"\" value=\"1\" class=\"form-control\" name=\"quantity\" data-cesta-feira-attribute placeholder=\"Quantity\">";
       
       html = html + "                 </div>                     ";
       html = html + "                 <input type=\"hidden\" value=\"" + nombre + "\" name=\"product_name\" data-cesta-feira-attribute=\"\">";
       html = html + "                 <input type=\"hidden\" value=\"" + String.valueOf(Math.round(precio)) +"\" name=\"unity_price\" data-cesta-feira-attribute>";
       html = html + "                 <input type=\"hidden\" value=\"" + id + "\" data-cesta-feira-item-id />";
       html = html + "                 <input type=\"hidden\" value=\"shoe\" name=\"item_type\" data-cesta-feira-attribute>";
       if(cantidad==0)
       html = html + "                 <input href=\"#\" style=\"pointer-events: none;\" type=\"submit\" class=\"btn disabled\" value=\"No Disponible\"/>";
       else
       html = html + "                 <input type=\"submit\" class=\"btn btn-primary\" value=\"Agregar al Carrito\"/>";
       html = html + "             </form>";
       html = html + "         </div>";
       html = html + "     </div>";
       html = html + " </div>";
       
       
       
      return html;
   }
%>


<jsp:include page="secciones/cabeza.jsp" />
 
<style type="text/css">
    .categoriaIcono{
        float:right;
        height:80px;
        width: 80px;
        position:relative;
    }
    
</style>

<!-- Page Content -->
<div class="container">

    <!-- Nav Header -->
    <div class="navhe">
     
        <img src="img/1.png" class="categoriaIcono">
    
        <ul class="nav nav-tabs">
            
            <%
                int contador=0;
                for (Categoria categoria : categorias) {
                    subCategorias = categoriaDAO.getSubCategorias(categoria.getIdCategoria());
                    contador++;
                    out.print("<li class=\"nav-item dropdown\">");    
                    if(contador==1)
                    out.print("<a class=\"nav-link dropdown-toggle active\" data-toggle=\"dropdown\" href=\"#\" role=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\">" + categoria.getNombreCategoria()+ "</a>");
                    else
                    out.print("<a class=\"nav-link dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" role=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\">" + categoria.getNombreCategoria()+ "</a>");
                    out.print("<div class=\"dropdown-menu\"> ");
                        for (Categoria subcategoria : subCategorias) {                            
                            out.print("<a class=\"dropdown-item\" href=\"#\" onclick=\"mostrar("+String.valueOf(subcategoria.getIdCategoria())+",this);imagen("+ String.valueOf(categoria.getIdCategoria()) +");\">"+subcategoria.getNombreCategoria()+"</a> ");
                        }
                    
                    out.print("</div>");
                    out.print("</li>");
                }
            %>
         
        </ul>

    
        
    </div>

    <!-- Page Features -->
    <div class="row text-center">

        <% 
                
    for(Articulo articulo : articulos ){
        String[] imagenes = articulo.getPath().split(";");
        out.print(tarjeta(articulo.getIdProducto(),articulo.getNombreProducto(),articulo.getPrecioVenta(),imagenes[0],articulo.getCantidad(),articulo.getCategoria().getIdCategoria()));
    }
    %>

    </div>
    <br><br>
    <!-- /.row -->

</div>
<!-- /.container -->

<!-- Modal -->
<div class="modal fade" id="detalleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="detalleModalTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <div id="detalleModalBody" class="modal-body">
        ...
      </div>
      <div id="imagenModalBody" class="modal-body">
        ...
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<script>
actualizarModal = function(id){
    
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
<script>
    
    sub = <% out.print(articulos.get(0).getCategoria().getIdCategoria()); %>;
     var slides = document.getElementsByClassName("sub");
        for(var i = 0; i < slides.length; i++){
            document.getElementsByClassName('sub')[i].style.display = 'none';
        }
        
        var slides = document.getElementsByClassName("sub" + sub);
        for(var i = 0; i < slides.length; i++){
            document.getElementsByClassName('sub' + sub)[i].style.display = 'block';
        }
        
        imagen = function(idcategoria){
            document.getElementsByClassName("categoriaIcono")[0].setAttribute("src","img/"+idcategoria+".png");
        
            
        };
    mostrar = function(sub,objeto){
        
        var slides = document.getElementsByClassName("nav-link dropdown-toggle active");
        for(var i = 0; i < slides.length; i++){
            document.getElementsByClassName('nav-link dropdown-toggle active')[i].className = 'nav-link dropdown-toggle';
        }
        
        objeto.parentNode.previousSibling.className=objeto.parentNode.previousSibling.className + " active";
        
        var slides = document.getElementsByClassName("sub");
        for(var i = 0; i < slides.length; i++){
            document.getElementsByClassName('sub')[i].style.display = 'none';
        }
        
        var slides = document.getElementsByClassName("sub" + sub);
        for(var i = 0; i < slides.length; i++){
            document.getElementsByClassName('sub' + sub)[i].style.display = 'block';
        }
    };
    
    actual(4);
    
    
</script>


<jsp:include page="secciones/pies.jsp" />
