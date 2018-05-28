<%-- 
    Document   : pasarelaPagos
    Created on : 27/05/2018, 07:08:10 PM
    Author     : Santiago
--%>

<%@page import="edu.finalbases.entities.Banco"%>
<%@page import="edu.finalbases.business.FuncionesCompra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    Banco bancoS = FuncionesCompra.getFuncionesCompra().getBancoSelecccionado();
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Pagos PSE - <%System.out.println(bancoS.getNombreBanco());%></title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta.2/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />    
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>
    <body>
        <div class="container-fluid">
            <img id="logoPSE" alt="PSE" align="middle" class="center" src="<%out.println(bancoS.getPath());%>">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4"><!-- Default form register -->
                    <form>
                        <p class="h4 text-center mb-4">Formulario de Pago</p>
                        
                        <label for="cedula">Cédula:</label>
                        <input type="number" min="1" class="form-control" id="cedula" placeholder="Cédula" >

                        <!-- Default input name -->
                        <label for="nombre" class="grey-text">Nombres</label>
                        <input type="text" id="nombre" class="form-control" placeholder="Nombres">

                        <br>


                        <label for="apellidos" class="grey-text">Apellidos</label>
                        <input type="text" id="apellidos" class="form-control" placeholder="apellidos">

                        <br>


                        <label for="total" class="grey-text">Total</label>
                        <input type="text" id="total" class="form-control" placeholder="total">
                        
                        <label for="tarjetaC" class="grey-text">No. Tarjeta Débito</label>
                        <input type="text" id="tarjetaC" class="form-control" placeholder="Tarjeta Débito">

                        <br>
                        
                        <label for="email" class="grey-text">Email</label>
                        <input type="email" id="email" class="form-control" placeholder="email">

                        <div class="text-center mt-4">
                            <button class="btn btn-success" type="submit">Pagar</button>
                            <button class="btn btn-warning" type="submit">Cancelar</button>
                        </div>
                    </form>
                    <!-- Default form register --></div>
                <div class="col-md-4"></div>
            </div>

            <br>
            <br>
            <br>
        </div>
    </body>
</html>
