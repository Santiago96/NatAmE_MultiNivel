<%-- 
    Document   : Productos
    Created on : 27/03/2018, 09:48:05 PM
    Author     : Santiago
--%>

<%@page import="edu.finalbases.entities.SubCategoria"%>
<%@page import="edu.finalbases.repositoryDAO.SubCategoriaDAO"%>
<%@page import="edu.finalbases.entities.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="edu.finalbases.repositoryDAO.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include page="secciones/Head.jsp" />
<%
    CategoriaDAO categoriaDAO = new CategoriaDAO();
    List<Categoria> categorias = categoriaDAO.getCategorias();
    
    SubCategoriaDAO subCategoriaDAO = new SubCategoriaDAO();
    List<SubCategoria> subCategorias = subCategoriaDAO.getSubCategorias();
    

%>
<div class="container">
    <h2>Catálogo de productos</h2>
    
    <div class="nav-side-menu">
    
    <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
  
        <div class="menu-list">
  
            <ul id="menu-content" class="menu-content collapse out">
                
                <li  data-toggle="collapse" data-target="#products" class="collapsed active">
                  <a href="#"><i class="fa fa-gift fa-lg"></i>  Categorias<span class="arrow"></span></a>
                </li>
                <ul class="sub-menu collapse" id="products">
                    <%
                        for (Categoria categoria : categorias) {
                            out.print("<li  data-toggle=\"collapse\" data-target=\"#"+categoria.getNombreCategoria().replace(" ", "")+"\" class=\"collapsed active\">");
                                out.print("<a href=\"#\"><i class=\"fa fa-gift fa-lg\"></i>"+ categoria.getNombreCategoria()+"<span class=\"arrow\"></a>");
                            out.print("</li>");
                            
                            out.print("<ul class=\"sub-menu collapse\" id=\""+categoria.getNombreCategoria().replace(" ", "")+"\">");
                                for (SubCategoria subcategoria : subCategorias) {
                                    if(subcategoria.getCategoria().getIdCategoria() == categoria.getIdCategoria()){
                                        
                                        out.print("<li><a href="+subcategoria.getNombreSubCategoria()+">"+subcategoria.getNombreSubCategoria()+"</a></li>");
                                        
                                    }
                                }
                            out.print("</ul>");
                                
                            
                               
                        }
                    %>
                    <!--<li class="active"><a href="#">CSS3 Animation</a></li>-->
                </ul>
            </ul>
     </div>
</div>
    
</div>


<jsp:include page="secciones/Footer.jsp" />