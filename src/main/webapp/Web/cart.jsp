<%@page import="edu.finalbases.entities.Banco"%>
<%@page import="edu.finalbases.repositoryDAO.BancoDAO"%>
<%@page import="edu.finalbases.business.FuncionesRepVentas"%>
<%@page import="edu.finalbases.business.FuncionesCliente"%>
<%@page import="edu.finalbases.entities.Persona"%>
<jsp:include page="secciones/cabeza.jsp" />

<%@page import="edu.finalbases.entities.Articulo"%>
<%@page import="edu.finalbases.repositoryDAO.ArticuloDAO"%>
<%@page import="java.util.List"%>

<%
    BancoDAO bancoDAO = new BancoDAO();
    List<Banco> bancos = bancoDAO.getBancos();

%>

<!-- Page Content -->
<div class="container">

    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th class="text-center">Precio</th>
                        <th class="text-center">Total</th>
                        <th>�</th>
                    </tr>
                </thead>
                <tbody id="cart-items">
                </tbody>
                <tfoot>
                    <tr>
                        <td><a href="javascript:;" class="btn btn-danger" data-cesta-feira-clear-basket>Limpiar</a></td>
                        <td> �</td>
                        <td>Total</td>
                        <td class="text-right" id="total-value"><strong>$0</strong></td>
                        <td> �</td>
                    </tr>                    
                </tfoot>
            </table>
        </div>
    </div>
    <br>
    
    <div class="container">  
    <div class="row" style="display: flex; justify-content: flex-end; margin-right:175px">
        <div id="bancos">
            <div class="form-group">
                <label for="bancoS">Seleccione un Banco:</label>
                <select name="bancoS" class="form-control" id="bancoSelect" required>
                    <%                    for (Banco banco : bancos) {
                            out.print("<option value='" + banco.getIdBanco() + "'>" + banco.getNombreBanco() + "</option>");
                        }
                    %>
                </select>
            </div>
            <div class="form-group">
                <input type="text" name="nameTitular" class="form-control" id="nameTitular" placeholder="Nombre Titular" oninvalid="this.setCustomValidity('Ingrese un Nombre de titular V�lido')" oninput="setCustomValidity('')" required>
            </div>
            <div class="form-group">
                <input type="number" name="numTarjeta" class="form-control" id="numTarjeta" placeholder="N�mero Tarjeta" oninvalid="this.setCustomValidity('Ingrese un N�mero de tarjeta V�lido')" oninput="setCustomValidity('')" required>
            </div>

            <div class="form-group">
                <input type="text" name="cvv" class="form-control" id="cvv" placeholder="CVV" oninvalid="this.setCustomValidity('Ingrese un CVV V�lido')" oninput="setCustomValidity('')" required>
            </div>
            <div class="row">

                <label>Fecha Expiraci�n:</label><br>




                <div class="col">
                    <label for="mes">Mes:</label>
                    <select name="mes" class="form-control" id="mes" oninvalid="this.setCustomValidity('Seleccione un Mes')" oninput="setCustomValidity('')" required>

                        <%
                            for (int i = 1; i <= 12; i++) {
                                out.print("<option value='" + i + "'>" + i + "</option>");
                            }
                        %>
                    </select>

                </div>

                <div class="col">
                    <label for="a�o">A�o:</label>
                    <select name="a�o" class="form-control" id="a�o" oninvalid="this.setCustomValidity('Seleccione un A�o')" oninput="setCustomValidity('')" required>

                        <%
                            for (int i = 18; i <= 37; i++) {
                                out.print("<option value='" + i + "'>" + i + "</option>");
                            }
                        %>
                    </select>
                </div>

            </div>
            <br><br>
        </div>
    </div>
</div>                    
                    
          
          
          <div style="float:right; margin-right:175px">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">
                    <input type="radio" id="tipo1" name="tipoPago" checked aria-label="Radio button for following text input"><label for="tipo1">Tarjeta de Credito</label><br>
                <input type="radio" id="tipo2" name="tipoPago" aria-label="Radio button for following text input"><label for="tipo2">Tarjeta de Debito</label>
                </div>
              </div>
            </div>
                  
            <br>
            
            
            <button type="button" class="btn btn-success" onclick="pagar();">Pagar</button>
            <br><br><br>
          </div>
            <br><br><br>        
</div>
</div>
<!-- /.container -->

<script type="application/javascript">

    <%      ArticuloDAO articuloDAO = new ArticuloDAO();
        List<Articulo> articulos = articuloDAO.getProductos(1);

        out.print("var obj = {");
        for (Articulo articulo : articulos) {
            out.print(articulo.getIdProducto() + ":\"" + articulo.getPath().split(";")[0] + "\",");
        }
        out.print("};");

        Persona cliente = FuncionesCliente.getFuncionesCliente().getSessionCliente();
        Persona rv = FuncionesRepVentas.getFunciones().getUserSession();


    %>
    var totalValue = 0;
    var productos;
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

    

    $.each($('[data-item-total-value]'), function (index, item) {
    totalValue += $(item).data('item-total-value');
    });

    $('#total-value').html("$" + parseFloat(totalValue).toFixed(2));
    }

    function mountLayout(index, data) {
    var totalValueTemp = parseFloat(data.unity_price) * parseInt(data.quantity);

    var $layout = "<tr id='product-"+ index +"'><td class='col-sm-8 col-md-6'><div class='media'>" +
    "<img class='d-flex align-self-center mr-3' width=60px height=60px src='"+obj[index]+"' alt=''>" +
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

    
    productos = products;
    //console.log(productos);
    
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

    (function () {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
    })();

    <%     if (cliente == null) {
            out.print("actual(5);");
        } else {
            out.print("actual(4);");
        }
    %>
</script>

<script>
    function pagar() {
        
        var todosP = {};
        var enviar = {};        
        var contador = 0;
        
        for(pro in productos){
            var produc = {id:pro,cantidad:productos[pro].quantity, preciototal:productos[pro].unity_price*productos[pro].quantity};            
            todosP[contador] = produc;
            contador++;
        }
        
        var e = document.getElementById("bancoSelect");
        var strUser = e.options[e.selectedIndex].value;
        
        var x=$("#tipo1").is(":checked");
        console.log(x);
        var tipo = 0;
        if(x)
           tipo = 2;
        else
           tipo = 1;
       
        enviar = {productos:todosP,totalTodo:parseFloat(totalValue).toFixed(2),idcliente:<% if(rv!=null) out.print(rv.getIdPersona()); if(cliente!=null) out.print(cliente.getIdPersona());%>,idrv:<% if(cliente!=null) out.print(cliente.getId_rep_ventas().getIdPersona()); %>,idtipopago:tipo,idbanco:strUser};
        
        hacerCompra(enviar);
        
    }
    
    function hacerCompra(compra) {
        console.log("Haciendo Compra");
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/api/compra/pagar',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            data: JSON.stringify(compra),
            success: function (response) {
                console.log(response);
                if (response.textStatus = "Conflict") {
                    alert("Compra realizada");
                } else {
                    alert("Error al realizar compra");
                }

            },
            error: function (textStatus) {
                console.log("error ");
                console.log(textStatus);
                if (textStatus.textStatus = "Conflict") {
                    alert("Compra realizada");
                } else {
                    alert("Error al realizar compra");
                }


            }
        });
    }

</script>


<jsp:include page="secciones/pies.jsp" />