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
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    CategoriaDAO categoriaDAO = new CategoriaDAO();
    List<Categoria> categorias = categoriaDAO.getCategorias();
    
    SubCategoriaDAO subCategoriaDAO = new SubCategoriaDAO();
    List<SubCategoria> subCategorias = subCategoriaDAO.getSubCategorias();  
    
    ProductoDAO productoDAO = new ProductoDAO();
    List<Producto> productos = productoDAO.getProductos(); 
    
    ItemDAO itemDAO = new ItemDAO();
    List<Item> items = itemDAO.getItems(1); 
    
    ArticuloDAO articuloDAO = new ArticuloDAO();
    List<Articulo> articulos = articuloDAO.getProductos(1);
    
    

%>

<%!
   public String tarjeta(int id, String nombre, float precio, String imagen, int cantidad){
       String html = "";
       
       
       html = html + "<div class=\"col-lg-3 col-md-6 mb-4\">";
       html = html + "     <div class=\"card\">";
       html = html + "         <img class=\"card-img-top\" src=\"" + imagen + "\" alt=\"\">";
       html = html + "         <div class=\"card-body\">";
       html = html + "             <h4 class=\"card-title\">" + nombre + "</h4>";
       html = html + "             <p class=\"card-text\">Price: $" + String.valueOf(precio) +"</p>";
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
       html = html + "                 <input type=\"submit\" class=\"btn btn-primary\" value=\"Add to Cart\"/>";
       html = html + "             </form>";
       html = html + "         </div>";
       html = html + "     </div>";
       html = html + " </div>";
       
       
      return html;
   }
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>jQuery Cesta-Feira: Shopping Cart Example</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta.2/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />

    <style type="text/css">

        /*!
         * Start Bootstrap - Heroic Features (https://startbootstrap.com/template-overviews/heroic-features)
         * Copyright 2013-2017 Start Bootstrap
         * Licensed under MIT (https://github.com/BlackrockDigital/startbootstrap-heroic-features/blob/master/LICENSE)
         */

        body {
            padding-top: 54px;
        }

        @media (min-width: 992px) {
            body {
                padding-top: 56px;
            }
        }

        .card {
            height: 100%;
        }

        .cart-item-count {
            position: relative;
        }

        .cesta-feira__num-items{
            position: absolute;
            width: 25px;
            height: 25px;
            border-radius: 50%;
            background: #fff;
            color: #000;
            display: flex;
            justify-content: center;
            align-items: center;
            top: -2px;
            right: -12px;
            font-size: 12px;
            font-weight: bold;
        }

    </style>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="javascript:;">Cesta-Feira</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link cart-item-count" href="cart.jsp" data-cesta-feira-items-count><span class="fa fa-shopping-cart"></span> Shopping Cart</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="container">

    <!-- Jumbotron Header -->
    <header class="jumbotron my-5">
        <h1 class="display-3">jQuery Cesta-Feira: Shopping Cart Example</h1>     
    </header>

    <!-- Page Features -->
    <div class="row text-center">

        <% 
    for(Articulo articulo : articulos ){
        String[] imagenes = articulo.getPath().split(";");
        
        out.print(tarjeta(articulo.getIdProducto(),articulo.getNombreProducto(),articulo.getPrecioVenta(),imagenes[0],articulo.getCantidad()));
    }
    %>

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
</body>
</html>
