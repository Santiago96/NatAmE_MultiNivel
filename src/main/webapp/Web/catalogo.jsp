<%-- 
    Document   : Productos
    Created on : 27/03/2018, 09:48:05 PM
    Author     : Santiago
--%>

<%@page import="edu.finalbases.entities.SubCategoria"%>
<%@page import="edu.finalbases.repositoryDAO.SubCategoriaDAO"%>
<%@page import="edu.finalbases.repositoryDAO.ProductoDAO"%>
<%@page import="edu.finalbases.repositoryDAO.ItemDAO"%>
<%@page import="edu.finalbases.repositoryDAO.ArticuloDAO"%>
<%@page import="edu.finalbases.entities.Categoria"%>
<%@page import="edu.finalbases.entities.Producto"%>
<%@page import="edu.finalbases.entities.Item"%>
<%@page import="edu.finalbases.entities.Articulo"%>
<%@page import="java.util.List"%>
<%@page import="edu.finalbases.repositoryDAO.CategoriaDAO"%>
 

<%
    CategoriaDAO categoriaDAO = new CategoriaDAO();
    List<Categoria> categorias = categoriaDAO.getCategorias();
    
    SubCategoriaDAO subCategoriaDAO = new SubCategoriaDAO();
    List<SubCategoria> subCategorias = subCategoriaDAO.getSubCategorias();   
    
    ArticuloDAO articuloDAO = new ArticuloDAO();
    List<Articulo> articulos = articuloDAO.getProductos(1);
    
    

%>

<%!
   public String tarjeta(int id, String nombre, float precio, String imagen, int cantidad, int idsubcategoria){
       String html = "";
       
       
       html = html + "<div class=\"col-lg-3 col-md-6 mb-4 sub sub"+idsubcategoria+"\">";
       html = html + "     <div class=\"card\">";
       html = html + "         <img class=\"card-img-top\" src=\"" + imagen + "\" alt=\"\">";
       html = html + "         <div class=\"card-body\">";
       html = html + "             <h4 class=\"card-title\">" + nombre + "</h4>";
       html = html + "             <p class=\"card-text\">Precio: $" + String.valueOf(precio) +"</p>";
       html = html + "         </div>";
       html = html + "         <div class=\"card-footer\">";
       html = html + "             <form action=\"\" class=\"form\" data-cesta-feira-form>";
       html = html + "                 <div class=\"form-group\">";
       html = html + "                     <input type=\"number\" min=\"1\" max=\""+ String.valueOf(cantidad) +"\" value=\"1\" class=\"form-control\" name=\"quantity\" data-cesta-feira-attribute placeholder=\"Quantity\">";
       html = html + "                 </div>                     ";
       html = html + "                 <input type=\"hidden\" value=\"" + nombre + "\" name=\"product_name\" data-cesta-feira-attribute=\"\">";
       html = html + "                 <input type=\"hidden\" value=\"" + String.valueOf(precio) +"\" name=\"unity_price\" data-cesta-feira-attribute>";
       html = html + "                 <input type=\"hidden\" value=\"" + id + "\" data-cesta-feira-item-id />";
       html = html + "                 <input type=\"hidden\" value=\"shoe\" name=\"item_type\" data-cesta-feira-attribute>";
       html = html + "                 <input type=\"submit\" class=\"btn btn-primary\" value=\"Agregar al Carrito\"/>";
       html = html + "             </form>";
       html = html + "         </div>";
       html = html + "     </div>";
       html = html + " </div>";
       
       
       
      return html;
   }
%>


<jsp:include page="secciones/cabeza.jsp" />
 

<!-- Page Content -->
<div class="container">

    <!-- Nav Header -->
    <div class="navhe">
     
            
    
        <ul class="nav nav-tabs">
            
            <%
                int contador=0;
                for (Categoria categoria : categorias) {
                    contador++;
                    out.print("<li class=\"nav-item dropdown\">");    
                    if(contador==1)
                    out.print("<a class=\"nav-link dropdown-toggle active\" data-toggle=\"dropdown\" href=\"#\" role=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\">" + categoria.getNombreCategoria()+ "</a>");
                    else
                    out.print("<a class=\"nav-link dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" role=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\">" + categoria.getNombreCategoria()+ "</a>");
                    out.print("<div class=\"dropdown-menu\"> ");
                        for (SubCategoria subcategoria : subCategorias) {
                            if(categoria.getIdCategoria()==subcategoria.getCategoria().getIdCategoria())
                            out.print("<a class=\"dropdown-item\" href=\"#\" onclick=\"mostrar("+String.valueOf(subcategoria.getIdSubCategoria())+",this);\">"+subcategoria.getNombreSubCategoria()+"</a> ");
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
        
        out.print(tarjeta(articulo.getIdProducto(),articulo.getNombreProducto(),articulo.getPrecioVenta(),imagenes[0],articulo.getCantidad(),articulo.getSubCategoria().getIdSubCategoria()));
    }
    %>

    </div>
    <!-- /.row -->

</div>
<!-- /.container -->




<script>
    
    sub = 1;
     var slides = document.getElementsByClassName("sub");
        for(var i = 0; i < slides.length; i++){
            document.getElementsByClassName('sub')[i].style.display = 'none';
        }
        
        var slides = document.getElementsByClassName("sub" + sub);
        for(var i = 0; i < slides.length; i++){
            document.getElementsByClassName('sub' + sub)[i].style.display = 'block';
        }
        
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
    
</script>


<jsp:include page="secciones/pies.jsp" />
