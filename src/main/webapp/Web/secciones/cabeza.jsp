<%-- 
    Document   : cabeza
    Created on : Mar 31, 2018, 10:52:30 AM
    Author     : jsbon
--%>
<%@page import="edu.finalbases.business.FuncionesRepVentas"%>
<%@page import="edu.finalbases.business.FuncionesCliente"%>
<%@page import="edu.finalbases.entities.Persona"%>

<%
    Persona p = FuncionesRepVentas.getFunciones().getUserSession();

%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ventas Multinivel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta.2/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
     
    
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
        
        .navhe{
            padding: 1.5rem;
            margin-right: 0;
            margin-bottom: 0;
            margin-left: 0;
            border-width: .2rem;
        }

    </style>

</head>
<body>
    
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="javascript:;">MultiNivel</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                
                <%
                if(p!=null){
                    out.print("<li class=\"nav-item\"> ");
                    out.print("<a class=\"nav-link\" href=\"index.jsp\">" + p.getNombre() + "</a> ");
                    out.print("</li>  ");
                    
                    out.print("<li class=\"nav-item active\">");
                    out.print("    <a class=\"nav-link\" href=\"catalogo.jsp\">Catalogo</a>");
                    out.print("</li>");
                    out.print("<li class=\"nav-item active\">");
                    out.print("    <a class=\"nav-link\" href=\"cliente.jsp\">Crear Cliente </a> ");
                    out.print("</li>");
                    out.print("<li class=\"nav-item\">");
                    out.print("<a class=\"nav-link cart-item-count\" href=\"cart.jsp\" data-cesta-feira-items-count><span class=\"fa fa-shopping-cart\"></span> Shopping Cart</a>");
                    out.print("</li>");
                    
                }else{
                    out.print("<li class=\"nav-item\"> ");
                    out.print("<a class=\"nav-link\" href=\"index.jsp\"> Inicio </a> ");
                    out.print("</li>  ");
                    
                    out.print("<li class=\"nav-item\"> ");
                    out.print("<a class=\"nav-link\" href=\"#\" onclick=\"modalCliente();\">Iniciar Sesión Cliente</a>");
                    out.print("</li>");                    
                    out.print("<li class=\"nav-item\">");
                    out.print("<a class=\"nav-link\" href=\"#\" onclick=\"modal();\">Iniciar Sesión Representante</a>");
                    out.print("</li>");
                }                                        
                %>
                                
            </ul>
        </div>
    </div>
</nav>
    

            <div id="loginModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="Login Representante Ventas">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <form class="form-horizontal" >
                            <fieldset>
                                <div class="modal-header">
                                    <h4 class="modal-title">NatAmE MultiNivel - <span class="label label-default">Login Representante Ventas</span></h4>
                                </div>
                                <div class="modal-body">

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="numDocumento">Usuario</label>  
                                        <div class="col-md-5">
                                            <input type="text" name="numDocumento" id="numDocumento" min="1" placeholder="Usuario" class="form-control input-md" required="">
                                        </div>
                                    </div>

                                    <!-- Password input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="password">Contraseña</label>
                                        <div class="col-md-5">
                                            <input id="password" name="password"  type="password" placeholder="Password" class="form-control input-md" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" onclick="iniciarSesion()" class="btn btn-success"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span> Iniciar Sesión</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>


                </div>
            </div>

            <div id="loginModalCliente" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="Login Cliente">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <form class="form-horizontal" >
                            <fieldset>
                                <div class="modal-header">
                                    <h4 class="modal-title">NatAmE MultiNivel - <span class="label label-default">Login Cliente</span></h4>
                                </div>
                                <div class="modal-body">

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="numDocumentoCliente">Usuario</label>  
                                        <div class="col-md-5">
                                            <input type="text" name="numDocumentoCliente" id="numDocumentoCliente" min="1" placeholder="Usuario" class="form-control input-md" required="">
                                        </div>
                                    </div>

                                    <!-- Password input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="passwordCliente">Contraseña</label>
                                        <div class="col-md-5">
                                            <input id="passwordCliente" name="passwordCliente"  type="password" placeholder="Password" class="form-control input-md" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" onclick="iniciarSesionCliente()" class="btn btn-success"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span> Iniciar Sesión</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>


                </div>
            </div>

    
<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jStorage/0.4.12/jstorage.min.js"></script>
    <script src="js/cesta-feira.js"></script>
    
            <script>

                var idRepresentante;

                function iniciarSesion() {
                    console.log("Iniciar Sesión Representante Ventas");


                    var numDocumento = $('#numDocumento').val();
                    var password = $('#password').val();


                    $.ajax({
                        type: 'GET',
                        url: '${pageContext.request.contextPath}/api/repVentas/iniciar/' + numDocumento + '/' + password,
                        dataType: "json",
                        success: function (response) {
                            console.log(response);
                            if (response.idPersona != null) {
                                console.log("Datos Correctos");
                                idRepresentante = response.idPersona;
                                ocultarModal();
                                console.log("ID rep :" + idRepresentante);
                                alert("Bienvenido Representante de Ventas " + response.nombre + " " + response.apellido);
                            } else {
                                console.log("Datos incorrectos");
                                alert("Datos incorrectos");
                            }
                        },
                        error: function (textStatus) {
                            console.log(textStatus);
                            if (textStatus.statusText == "Accepted") {
                                console.log("Datos Correctos");
                                ocultarModal();
                                alert("Bienvenido");
                            } else {
                                console.log("Datos incorrectos");
                                alert("Datos incorrectos");
                            }

                        }
                    });
                }

                function iniciarSesionCliente() {
                    console.log("Iniciar Sesión Cliente");


                    var numDocumento = $('#numDocumentoCliente').val();
                    var password = $('#passwordCliente').val();


                    $.ajax({
                        type: 'GET',
                        url: '${pageContext.request.contextPath}/api/cliente/iniciar/' + numDocumento + '/' + password,
                        dataType: "json",
                        success: function (response) {
                            console.log(response);
                            if (response.idPersona != null) {
                                console.log("Datos Correctos");
                                idRepresentante = response.idPersona;
                                ocultarModalCliente();
                                console.log("ID rep :" + idRepresentante);
                                alert("Bienvenido Cliente " + response.nombre + " " + response.apellido);
                            } else {
                                console.log("Datos incorrectos");
                                alert("Datos incorrectos");
                            }
                        },
                        error: function (textStatus) {
                            console.log(textStatus);
                            if (textStatus.statusText == "Accepted") {
                                console.log("Datos Correctos");
                                ocultarModalCliente();
                                alert("Bienvenido");
                            } else {
                                console.log("Datos incorrectos");
                                alert("Datos incorrectos");
                            }

                        }
                    });
                }
                function modal() {

                    $('#loginModal').modal('show');

                }
                function ocultarModal() {

                    $('#loginModal').modal('hide');

                }

                function modalCliente() {
                    console.log("modalCliente");
                    $('#loginModalCliente').modal('show');

                }
                function ocultarModalCliente() {

                    $('#loginModalCliente').modal('hide');

                }



            </script>
<script>
   
   actual = function(id){     
       console.log("Hola nene");
       
       while(document.getElementsByClassName("nav-item active").length!=0)
           document.getElementsByClassName("nav-item active")[0].Classname = "nav-item"
      
    
        //document.getElementsByClassName('nav-item active')[id].className = 'nav-item active';
   };
   actual(2);
</script>
       