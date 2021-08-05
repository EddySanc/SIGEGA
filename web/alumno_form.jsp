<%-- 
    Document   : alumno_form
    Created on : Jun 1, 2015, 2:41:45 PM
    Author     : dsilva
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <% HttpServletResponse resp; %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>    </head>
    <body>
        <div class="container">
            <h1>Registro de alumno</h1>
            <form method="post" action="<%= request.getContextPath() %>/MostrarFotosServlet" enctype="multipart/form-data">
                
                <div class="form-group">
                    <label for="foto">Foto</label>
                    <%
                    if(request.getParameter("Foto")!=null){
                    %>
                        <img src="<%=request.getContextPath()%>" style="width: 100px;"/>
                    
                </div>
                <%
                }
                %>
                <div>
                    <input type="submit" value="Registrar" class="btn btn-primary"/>
                </div>

            </form>
            
         </div>
    </body>
</html>
