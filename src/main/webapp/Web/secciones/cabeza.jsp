<%-- 
    Document   : cabeza
    Created on : Mar 31, 2018, 10:52:30 AM
    Author     : jsbon
--%>
<%@page import="edu.finalbases.conexion.Conexion"%>
<%@page import="edu.finalbases.business.FuncionesRepVentas"%>
<%@page import="edu.finalbases.business.FuncionesCliente"%>
<%@page import="edu.finalbases.entities.Persona"%>

<%

    Persona p = FuncionesRepVentas.getFunciones().getUserSession();
    Persona cliente = FuncionesCliente.getFuncionesCliente().getSessionCliente();
    Persona persona;

    if (p != null) {
        persona = p;
    } else {
        persona = cliente;
    }
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
            .foot{
                position:fixed;
                bottom:0;
                left:0;
                width:100%;
            }
            #logo{
                height: auto;
                width: 100px;
            }

        </style>

    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container">
                <a class="navbar-brand" href="javascript:;"><img id="logo" src="${pageContext.request.contextPath}/Web/img/logo2.png"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul id="menu" class="navbar-nav ml-auto">

                        <%
                            if (persona != null) {
                                out.print("<li class=\"nav-item\"> ");

                                out.print("<a class=\"nav-link\" href=\"" + request.getContextPath() + "/index.jsp\">" + persona.getNombre() + "</a> ");

                                out.print("</li>  ");

                                if (cliente != null) {
                                    out.print("<li class=\"nav-item\">");
                                    out.print("    <a class=\"nav-link\" href=\"" + request.getContextPath() + "/Web/pago.jsp\">Registrar Medio Pago</a> ");
                                    out.print("</li>");

                                    out.print("<li class=\"nav-item\">");
                                    out.print("    <a class=\"nav-link\" href=\"" + request.getContextPath() + "/Web/comprasAsociadas.jsp\">Historico Compras </a> ");
                                    out.print("</li>");

                                    out.print("<li class=\"nav-item\">");
                                    out.print("    <a class=\"nav-link\" href=\"" + request.getContextPath() + "/Web/catalogo.jsp\">Catálogo</a>");
                                    out.print("</li>");
                                    out.print("<li class=\"nav-item\">");
                                    out.print("<a class=\"nav-link cart-item-count\" href=\"" + request.getContextPath() + "/Web/cart.jsp\" data-cesta-feira-items-count><span class=\"fa fa-shopping-cart\"></span> Shopping Cart</a>");
                                    out.print("</li>");
                                    out.print("<li class=\"nav-item\">");
                                }

                                if (p != null) {
                                    out.print("<li class=\"nav-item\">");
                                    out.print("    <a class=\"nav-link\" href=\"" + request.getContextPath() + "/Web/cliente.jsp\">Crear Cliente </a> ");
                                    out.print("</li>");
                                    out.print("<li class=\"nav-item\">");
                                    out.print("    <a class=\"nav-link\" href=\"" + request.getContextPath() + "/Web/ventasAsociadas.jsp\">Ventas Asociadas </a> ");
                                    out.print("</li>");
                                }

                                out.print("<li class=\"nav-item\">");
                                if (p != null) {
                                    out.print("    <a class=\"nav-link\" onclick=\"cerrarSesion();\" href=#> Salir</a> ");
                                } else {
                                    out.print("    <a class=\"nav-link\" onclick=\"cerrarSesionCliente();\" href=#> Salir</a> ");
                                }
                                out.print("</li>");

                            } else {
                                out.print("<li class=\"nav-item\"> ");
                                out.print("<a class=\"nav-link\" href=\"" + request.getContextPath() + "\"> Inicio </a> ");
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

        <div id="mensajes" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="cabeceraMensaje">Error</h4>
                    </div>
                    <div class="modal-body">
                        <p id="mensajeModal"></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" onclick="ocultarModalMensaje()" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>

            </div>
        </div>


        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
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
                                                    modalMensaje("Bienvenido","Representante de Ventas " + response.nombre + " " + response.apellido);
                                                    // alert("Bienvenido Representante de Ventas " + response.nombre + " " + response.apellido);
                                                    location.reload();
                                                } else {
                                                    modalMensaje("Error",response.message);
                                                    console.log(response.message);
                                                    //alert(response.message);
                                                }
                                            },
                                            error: function (textStatus) {
                                                console.log(textStatus);
                                                if (textStatus.statusText == "Accepted") {
                                                    console.log("Datos Correctos");
                                                    ocultarModal();
                                                    alert("Bienvenido");
                                                } else {
                                                    console.log(textStatus);
                                                    modalMensaje(textStatus);
                                                    //alert(response.message);
                                                }

                                            }
                                        });
                                    }

                                    function cerrarSesion() {
                                        console.log("Cerrar Sesion");



                                        $.ajax({
                                            type: 'POST',
                                            url: '${pageContext.request.contextPath}/api/repVentas/salir/',
                                            dataType: "json",
                                            success: function (response) {

                                                console.log(response);
                                                window.location.replace("<%out.print(request.getContextPath()); %>/index.jsp");
                                            },
                                            error: function (textStatus) {
                                                console.log(textStatus);
                                                window.location.replace("<%out.print(request.getContextPath()); %>/index.jsp");

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
                                                    modalMensaje("Bienvenido","Cliente " + response.nombre + " " + response.apellido);
                                                    //alert("Bienvenido Cliente " + response.nombre + " " + response.apellido);
                                                    window.location.replace("<%out.print(request.getContextPath()); %>/index.jsp");
                                                } else {
                                                    modalMensaje("Error",response.message);
                                                    console.log(response.message);
                                                }
                                            },
                                            error: function (textStatus) {
                                                console.log(textStatus);
                                                if (textStatus.statusText == "Accepted") {
                                                    console.log("Datos Correctos");
                                                    ocultarModalCliente();
                                                    alert("Bienvenido");
                                                } else {
                                                    modalMensaje(textStatus);
                                                    console.log(textStatus);
                                                }

                                            }
                                        });
                                    }

                                    function cerrarSesionCliente() {
                                        console.log("Cerrar Sesion Cliente");
                                        $.ajax({
                                            type: 'POST',
                                            url: '${pageContext.request.contextPath}/api/cliente/salirCliente/',
                                            dataType: "json",
                                            success: function (response) {

                                                console.log(response);
                                                window.location.replace("<%out.print(request.getContextPath()); %>/index.jsp");
                                            },
                                            error: function (textStatus) {
                                                console.log(textStatus);
                                                window.location.replace("<%out.print(request.getContextPath());%>/index.jsp");
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

                                    function modalMensaje(cabecera,mensaje) {
                                        ocultarModal();
                                        ocultarModalCliente();
                                        $('#cabeceraMensaje').html(cabecera);
                                        $('#mensajeModal').html(mensaje);
                                        $('#mensajes').modal('show')
                                    }

                                    function ocultarModalMensaje() {
                                        $('#mensajeModal').innerHTML = "";
                                        $().modal('hide');
                                    }



        </script>
        <script>

            actual = function (id) {
                menu = document.getElementById("menu").childNodes;
                console.log(menu);
                for (i = 0; i < menu.length; i++) {
                    menu[i].className = "nav-item";
                }
                menu[id].className = "nav-item active";

            };
        </script>
