<%-- 
    Document   : index
    Created on : Mar 31, 2018, 1:02:43 PM
    Author     : jsbon
--%>


<%@page import="edu.finalbases.repositoryDAO.RepresentanteVentasDAO"%>
<%@page import="edu.finalbases.repositoryDAO.HistoricocrvDAO"%>
<%@page import="edu.finalbases.entities.Cliente"%>
<%@page import="edu.finalbases.repositoryDAO.PersonaDAO"%>
<jsp:include page="Web/secciones/cabeza.jsp" />
<%@page import="edu.finalbases.business.FuncionesRepVentas"%>
<%@page import="edu.finalbases.business.FuncionesCliente"%>
<%@page import="edu.finalbases.entities.Persona"%>

<br><br>
<div class="container">
    <div class="media">
        <div class="media-body">
            <h3 class="mt-0">Multinivel - "NatAmE"</h3>
            <br>
            <%
                Persona p = FuncionesRepVentas.getFunciones().getUserSession();
                Cliente cliente = (Cliente) FuncionesCliente.getFuncionesCliente().getSessionCliente();
                System.out.println("Cliente inicio sesion: " + cliente);
                System.out.println("Representante inicio sesion: " + p);
                Persona persona;

                if (p != null) {
                    persona = p;
                    out.print("<h5 class=\"mt-0\">Eres Representante de Ventas </h5>");
                } else {
                    persona = cliente;
                }

                if (persona != null) {
                    out.print("<h4 class=\"mt-0\">Bienvenido de nuevo " + persona.getNombre() + "</h4>");
                }
                if (cliente != null) {
                    HistoricocrvDAO hDAO = new HistoricocrvDAO();
                    cliente.setRepresentante((Persona) hDAO.getRepresentanteAsociado(cliente));
                    RepresentanteVentasDAO rDAO = new RepresentanteVentasDAO();
                    Persona pRV = (Persona) rDAO.getObjectById(cliente.getRepresentante().getIdPersona());
                    out.print("<h5 class=\"mt-0\">Eres Cliente y tu representante de ventas es: " + pRV.getNombre() + " " + pRV.getApellido() + "</h5>");
                }
            %>



            Empresa especializada en productos naturales y amigables con el medio ambiente, 
            con presencia en diferentes paises, y un amplio catálogo de productos.
            <br>
            <img id="back" src="Web/img/back.jpg">
        </div>
    </div>
</div>
<br><br>


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

<input type="button" class="btn btn-success" onclick="lanzarCalificacionModal();" value="Calificar" />


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
<jsp:include page="Web/secciones/pies.jsp" />

