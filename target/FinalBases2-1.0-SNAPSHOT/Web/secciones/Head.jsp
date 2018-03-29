<%-- 
    Document   : Head
    Created on : 25/02/2018, 09:36:20 PM
    Author     : Santiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Web/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Web/css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Web/css/estilos.css">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        
        
        <script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/Web/js/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/Web/js/jquery.validate.min.js"></script>
        <script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/Web/js/bootstrap.min.js"></script>
 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NatAmE - Pagina Inicio</title>
    </head>
    <body>
        <div class="container-fluid">

            <nav class="navbar navbar-default">
                <div class="container">

                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>                            
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="${pageContext.request.contextPath}">Página de Inicio</a>
                    </div>


                    <div class="collapse navbar-collapse" id="navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="${pageContext.request.contextPath}/Web/CrearCliente.jsp">Crear Cliente</a></li>   
                            <li><a href="${pageContext.request.contextPath}/Web/Productos.jsp">Catalogo de Productos</a></li>   
                            <li><a onclick="modalCliente();">Iniciar Sesión Cliente</a></li>                     
                            <li><a onclick="modal();">Iniciar Sesión Representante</a></li>                     

                            <!-- <li><a>Cerrar Sesión</a></li>  -->



                        </ul>
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

                    $('#loginModalCliente').modal('show');

                }
                function ocultarModalCliente() {

                    $('#loginModalCliente').modal('hide');

                }



            </script>
