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
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath}">Página de Inicio</a>
        </div>
    
        
        <div class="collapse navbar-collapse" id="navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="${pageContext.request.contextPath}/Web/Estadisticas.jsp">Catalogo de Productos</a></li>   
            <li><a href="${pageContext.request.contextPath}/Web/Estadisticas.jsp">Estadisticas de Ventas</a></li>                       
            <li><a href="${pageContext.request.contextPath}/Web/DondeEstamos.jsp">¿Dónde nos puede encontrar?</a></li>
            <li><a href="${pageContext.request.contextPath}/Web/Contactenos.jsp">Contactenos</a></li>                     
          </ul>

        </div>
      </div>
    </nav>
    
   
    
