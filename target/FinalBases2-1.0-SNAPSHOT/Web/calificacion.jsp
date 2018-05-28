<%-- 
    Document   : calificacion
    Created on : 27/05/2018, 08:54:17 PM
    Author     : Santiago
--%>

<%@page import="edu.finalbases.entities.Persona"%>
<%@page import="edu.finalbases.repositoryDAO.RepresentanteVentasDAO"%>
<%@page import="edu.finalbases.business.FuncionesCliente"%>
<%@page import="edu.finalbases.entities.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="secciones/cabeza.jsp" />

<%
    Cliente cliente = (Cliente) FuncionesCliente.getFuncionesCliente().getSessionCliente();
    Persona pRV=null;

    if (cliente != null) {       
        RepresentanteVentasDAO rDAO = new RepresentanteVentasDAO();
        pRV = (Persona) rDAO.getObjectById(cliente.getRepresentante().getIdPersona());        
    }
%>

<div class="modal fade" id="calificacionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="calificacionTitle">Calificación Venta</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div id="calificacionBody" class="modal-body">
                <label for="rateYo">Selecciona la calificación</label>
                <div id="rateYo"></div>  

                <div class="form-group">
                    <label for="comentario">Comentario: </label>
                    <textarea class="form-control" style="resize:none" rows="5" id="comentario" maxlength="250"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick="enviarCalificacion();" data-dismiss="modal">Enviar</button>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <hr>
    <br>
    <h2>Calificación</h2>

    <p>En el presente modulo puedes realizar la calificación del representante de Ventas, recuerda que solo puedes
        calificarlo 1 vez.
        
        En la actualidad, tu representante de ventas es <strong> <% if(pRV!=null) out.println(pRV.getNombre()+" "+pRV.getApellido());%></strong>
    </p>
    <br>
    <input type="button" class="btn btn-success" onclick="lanzarCalificacionModal();" value="Calificar" />

</div>  
<script>

    function lanzarCalificacionModal() {
        $("#calificacionModal").modal("show");
    }

    function enviarCalificacion() {
        $("#calificacionModal").modal("hide");
        var comentario = $("#comentario").val();
        var normalFill = $("#rateYo").rateYo("option", "rating"); //returns true
        console.log("Enviando Calificacion: " + comentario + " calificacion: " + normalFill);

        var data = {
            comentario: comentario,
            calificacion: normalFill
        };
        console.log(data);
        //Seccion ajax
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/api/compra/calificacion',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            data: JSON.stringify(data),
            success: function (response) {
                console.log(response);
            },
            error: function (textStatus) {
                console.log(textStatus);
            }
        });


        //Limpiar valores
        $("#comentario").val("");
    }
    $("#rateYo").rateYo({
        rating: 3,
        fullStar: true
    });

    // Getter


// Setter
    $("#rateYo").rateYo("option", "fullStar", true); //returns a jQuery Element
    actual(1);
</script>


<jsp:include page="secciones/pies.jsp" />