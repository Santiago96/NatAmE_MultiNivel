<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>jQuery Cesta-Feira: Cart Page</title>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta.2/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>

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

        .cart-item-count {
            position: relative;
        }

        .cesta-feira__num-items {
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
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link cart-item-count" href="cart.jsp" data-cesta-feira-items-count><span
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
</body>
</html>