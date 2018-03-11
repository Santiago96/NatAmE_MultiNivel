<%-- 
    Document   : Login
    Created on : 25/02/2018, 06:44:18 PM
    Author     : Santiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include  page="secciones/Head.jsp"/>
    <body>
        <h1>Página representante de ventas!</h1>

        <div class="container">
            <h2>Formulario Inicio Sesión</h2>    
            <form id="formActivo">
                <div id="ok"></div>
                <div class="form-group">
                    <label for="numDocumento">Número de documento:</label>
                    <input type="number" name="numDocumento" min="1" class="form-control" id="numDocumento">
                </div>
                <div class="form-group">
                    <label for="password">Contraseña:</label>
                    <input type="password" name="password" class="form-control" id="password">
                </div>
         

                <hr>
                <input class="btn btn-success" type="button" onclick="iniciarSesion()" value = "Iniciar Sesión" />   
            </form>
        </div>
    </body>


<jsp:include  page="secciones/Footer.jsp"/>

<script>
    function iniciarSesion(){
        console.log("Iniciar Sesión");
        
        
        var numDocumento =  $('#numDocumento').val();
        var password = $('#password').val();
        
         
        $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/api/repVentas/iniciar/'+numDocumento+'/'+password,
            dataType: "json",             
            success: function(response){
                console.log(response);                
            },
            error: function(textStatus){
                console.log(textStatus);
                
            }
        });
    }
    
    
</script>
