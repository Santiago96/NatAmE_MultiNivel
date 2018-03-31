<%-- 
    Document   : carrito
    Created on : Mar 30, 2018, 7:21:00 PM
    Author     : jsbon
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>

                    
                    
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="javascript:;">Cesta-Feira</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.html">Home</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link cart-item-count" href="Carrito.jsp" data-cesta-feira-items-count><span
                            class="fa fa-shopping-cart"></span> Shopping Cart</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="container">

    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th class="text-center">Price</th>
                    <th class="text-center">Total</th>
                    <th> </th>
                </tr>
                </thead>
                <tbody id="cart-items">
                </tbody>
                <tfoot>
                <tr>
                    <td><a href="javascript:;" class="btn btn-danger" data-cesta-feira-clear-basket>Clear Cart</a></td>
                    <td>  </td>
                    <td>Total</td>
                    <td class="text-right" id="total-value"><strong>$0</strong></td>
                    <td>  </td>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>
<!-- /.container -->

<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Cesta-Feira</p>
    </div>
    <!-- /.container -->
</footer>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jStorage/0.4.12/jstorage.min.js"></script>
<script src="js/cesta-feira.js"></script>
<script type="application/javascript">

  function initListaOrcamento() {
    var products = $.CestaFeira({
        debug: true
      }).getItems(),
      totalValueTemp = 0,
      $cartItems = $('#cart-items');

    if (!products) {
      console.log("No items in cart!");
      return;
    }

    function updateTotalValue() {

      var totalValue = 0;

      $.each($('[data-item-total-value]'), function (index, item) {
        totalValue += $(item).data('item-total-value');
      });

      $('#total-value').html("$" + parseFloat(totalValue).toFixed(2));
    }

    function mountLayout(index, data) {
      var totalValueTemp = parseFloat(data.unity_price) * parseInt(data.quantity);

      var $layout = "<tr id='product-"+ index +"'><td class='col-sm-8 col-md-6'><div class='media'>" +
        "<img class='d-flex align-self-center mr-3' src='http://placehold.it/72x72?text="+index+"' alt=''>" +
        "<div class='media-body'>" +
        "<h5 class='mt-0'>"+ data.product_name +"</h5>" +
        "</div></div></td><td class='col-sm-1 col-md-1' style='text-align: center'>" + data.quantity +
        "<td class='col-sm-1 col-md-1 text-center'><strong>$"+ data.unity_price +"</strong></td>" +
        "<td class='col-sm-1 col-md-1 text-center' data-item-total-value='"+totalValueTemp+"'><strong>$"+parseFloat(totalValueTemp).toFixed(2)+"</strong></td>" +
        "<td class='col-sm-1 col-md-1'>" +
        "<a href='javascript:;' class='btn btn-danger fa fa-trash' data-cesta-feira-delete-item='"+ index +"'><span class='sr-only'>Remove</span></a>" +
        "</td></tr>";

      $cartItems.append($layout);
    }


    $.each(products, function (index, value) {
      mountLayout(index, value);
    });

    updateTotalValue();

    $(document).on('click', 'a[data-cesta-feira-delete-item]', function(e) {
      e.preventDefault();

      var productId = $(this).data('cesta-feira-delete-item');

      if($(document).on('cesta-feira-item-deleted')){
        $('#product-'+productId).fadeOut(500, function() {
          $(this).remove();
          updateTotalValue();
        });
      }
    });

    $(document).on('cesta-feira-clear-basket', function (e) {
      $('#cart-items tr').each(function (index, value) {
        $(value).fadeOut(500, function() {
          $(this).remove();
          updateTotalValue();
        });
      });
    });

  }

  $(document).ready(function () {

    initListaOrcamento();

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