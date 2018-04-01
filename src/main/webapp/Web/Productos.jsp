<%-- 
    Document   : Productos
    Created on : 27/03/2018, 09:48:05 PM
    Author     : Santiago
--%>

<%@page import="edu.finalbases.entities.SubCategoria"%>
<%@page import="edu.finalbases.repositoryDAO.SubCategoriaDAO"%>
<%@page import="edu.finalbases.entities.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="edu.finalbases.repositoryDAO.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include page="secciones/Head.jsp" />
<%
    CategoriaDAO categoriaDAO = new CategoriaDAO();
    List<Categoria> categorias = categoriaDAO.getCategorias();
    
    SubCategoriaDAO subCategoriaDAO = new SubCategoriaDAO();
    List<SubCategoria> subCategorias = subCategoriaDAO.getSubCategorias();
    

%>
<div class="container">
    <h2>Catálogo de productos</h2>
    
    <div class="nav-side-menu">
    
    <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
  
        <div class="menu-list">
  
            <ul id="menu-content" class="menu-content collapse out">
                
                <li  data-toggle="collapse" data-target="#products" class="collapsed active">
                  <a href="#"><i class="fa fa-gift fa-lg"></i>  Categorias<span class="arrow"></span></a>
                </li>
                <ul class="sub-menu collapse" id="products">
                    <%
                        for (Categoria categoria : categorias) {
                            out.print("<li  data-toggle=\"collapse\" data-target=\"#"+categoria.getNombreCategoria().replace(" ", "")+"\" class=\"collapsed active\">");
                                out.print("<a href=\"#\"><i class=\"fa fa-gift fa-lg\"></i>"+ categoria.getNombreCategoria()+"<span class=\"arrow\"></a>");
                            out.print("</li>");
                            
                            out.print("<ul class=\"sub-menu collapse\" id=\""+categoria.getNombreCategoria().replace(" ", "")+"\">");
                                for (SubCategoria subcategoria : subCategorias) {
                                    if(subcategoria.getCategoria().getIdCategoria() == categoria.getIdCategoria()){
                                        
                                        out.print("<li><a href="+subcategoria.getNombreSubCategoria()+">"+subcategoria.getNombreSubCategoria()+"</a></li>");
                                        
                                    }
                                }
                            out.print("</ul>");
                                
                            
                               
                        }
                    %>
                    <!--<li class="active"><a href="#">CSS3 Animation</a></li>-->
                </ul>
            </ul>
     </div>
</div>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta.2/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />

<!-- Page Content -->
<div class="container">

    <!-- Jumbotron Header -->
    

    <!-- Page Features -->
    <div class="row text-center">

        <div class="col-lg-3 col-md-6 mb-4">
            <div class="card">
                <img class="card-img-top" src="http://placehold.it/500x325?text=Product 1" alt="">
                <div class="card-body">
                    <h4 class="card-title">Product 1</h4>
                    <p class="card-text">Price: $23,02</p>
                </div>
                <div class="card-footer">
                    <form action="" class="form" data-cesta-feira-form>
                        <div class="form-group">
                            <input type="number" min="1" value="1" class="form-control" name="quantity" data-cesta-feira-attribute placeholder="Quantity">
                        </div>
                        <div class="form-group">
                            <select class="form-control" name="observations" data-cesta-feira-attribute required>
                                <option value="">Number</option>
                                <option value="38">38</option>
                                <option value="40">40</option>
                                <option value="42">42</option>
                            </select>
                        </div>
                        <input type="hidden" value="Product 1" name="product_name" data-cesta-feira-attribute="">
                        <input type="hidden" value="23.02" name="unity_price" data-cesta-feira-attribute>
                        <input type="hidden" value="1" data-cesta-feira-item-id />
                        <input type="hidden" value="shoe" name="item_type" data-cesta-feira-attribute>
                        <input type="submit" class="btn btn-primary" value="Add to Cart"/>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-md-6 mb-4">
            <div class="card">
                <img class="card-img-top" src="http://placehold.it/500x325?text=Product 2" alt="">
                <div class="card-body">
                    <h4 class="card-title">Product 2</h4>
                    <p class="card-text">Price: $12,11</p>
                </div>
                <div class="card-footer">
                    <form action="" class="form" data-cesta-feira-form>
                        <div class="form-group">
                            <input type="number" min="1" value="1" class="form-control" name="quantity" data-cesta-feira-attribute placeholder="Quantity">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="observations" data-cesta-feira-attribute placeholder="Observations">
                        </div>
                        <input type="hidden" value="Product 2" name="product_name" data-cesta-feira-attribute="">
                        <input type="hidden" value="12.11" name="unity_price" data-cesta-feira-attribute>
                        <input type="hidden" value="other" name="item_type" data-cesta-feira-attribute>
                        <input type="hidden" value="2" data-cesta-feira-item-id />
                        <input type="submit" class="btn btn-primary" value="Add to Cart"/>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-md-6 mb-4">
            <div class="card">
                <img class="card-img-top" src="http://placehold.it/500x325?text=Product 3" alt="">
                <div class="card-body">
                    <h4 class="card-title">Product 3</h4>
                    <p class="card-text">Price: $24,08</p>
                </div>
                <div class="card-footer">
                    <form action="" class="form" data-cesta-feira-form>
                        <div class="form-group">
                            <input type="number" min="1" value="1" class="form-control" name="quantity" data-cesta-feira-attribute placeholder="Quantity">
                        </div>
                        <div class="form-group">
                            <select class="form-control" name="observations" data-cesta-feira-attribute required>
                                <option value="">Color</option>
                                <option value="Red">Red</option>
                                <option value="Blue">Blue</option>
                                <option value="Black">Black</option>
                            </select>
                        </div>
                        <input type="hidden" value="Product 3" name="product_name" data-cesta-feira-attribute="">
                        <input type="hidden" value="24.08" name="unity_price" data-cesta-feira-attribute>
                        <input type="hidden" value="shirt" name="item_type" data-cesta-feira-attribute>
                        <input type="hidden" value="3" data-cesta-feira-item-id />
                        <input type="submit" class="btn btn-primary" value="Add to Cart"/>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-md-6 mb-4">
            <div class="card">
                <img class="card-img-top" src="http://placehold.it/500x325?text=Product 4" alt="">
                <div class="card-body">
                    <h4 class="card-title">Product 4</h4>
                    <p class="card-text">Price: $2,02</p>
                </div>
                <div class="card-footer">
                    <form action="" class="form" data-cesta-feira-form>
                        <div class="form-group">
                            <input type="number" min="1" value="1" class="form-control" name="quantity" data-cesta-feira-attribute placeholder="Quantity">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="observations" data-cesta-feira-attribute placeholder="Observations">
                        </div>
                        <input type="hidden" value="Product 4" name="product_name" data-cesta-feira-attribute>
                        <input type="hidden" value="2.02" name="unity_price" data-cesta-feira-attribute>
                        <input type="hidden" value="other" name="item_type" data-cesta-feira-attribute>
                        <input type="hidden" value="4" data-cesta-feira-item-id />
                        <input type="submit" class="btn btn-primary" value="Add to Cart"/>
                    </form>
                </div>
            </div>
        </div>

    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Cesta-Feira</p>
    </div>
    <!-- /.container -->
</footer>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jStorage/0.4.12/jstorage.min.js"></script>
<script src="js/cesta-feira.js"></script>
<script type="application/javascript">
  $( document ).ready(function() {
    $.CestaFeira({
      debug: false,
      onItemAdded: function (item) {
        console.log(item);
      },
      onItemUpdated: function (item) {
        console.log(item);
      }
    });
  });
</script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

            
    
</div>


<jsp:include page="secciones/Footer.jsp" />