<%@ page import="com.mensajeweb.conexion.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Registrar mensaje</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <link rel="stylesheet" href="main.css">
</head>
<body>
        <% if (request.getAttribute("successMessage") != null) { %>
        <div class="success-message">
            <%= request.getAttribute("successMessage") %>
        </div>
        <% } %>

        <!-- Modal -->
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Crear mensaje</h5>
                    </div>
                    <div class="modal-body">
                        <form action="index.jsp" method="post" >
                            <div class="mb-3">
                                <label class="form-label" >Mensaje</label>
                                <textarea type="text" class="form-control" name="mensaje"  placeholder="Ingrese un mensaje..." rows="3"></textarea>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" >Autor</label>
                                <input type="text" class="form-control" name="autor" placeholder="Ingrese un autor">
                            </div>
                            <div class="modal-footer">
                                <button type="submit" name="enviar" class="btn btn-primary">Aceptar</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>

        <%
            DAO mensajeDao = new DAO();
            if(request.getParameter("enviar")!= null){
                Mensaje sms = new  Mensaje(
                        request.getParameter("mensaje"),
                        request.getParameter("autor")
                );

                mensajeDao.insertar(sms);

                System.out.println(request.getParameter("mensaje"));
                System.out.println(request.getParameter("autor"));
            }

        %>

        <!-- Card recuperar datos -->
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Ver todos los mensajes</h5>
                </div>
                <div class="modal-body">
                    <!--Card mostrar mensajes-->
                    <%
                        DAO dao = new DAO();
                        List<Mensaje> resultadoConsulta = dao.seleccionar();

                        for (Mensaje data : resultadoConsulta ) {

                    %>


                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title"><%=data.getAutor()%></h5>
                                <p class="card-text"><%=data.getMensaje()%></p>
                                <p class="blockquote-footer"><cite><%=data.getFecha()%></cite></p>
                                <a href="html/eliminar.jsp?id=<%=data.getId_mensaje()%>" class="btn btn-danger card-link">Eliminar</a>
                                <a href="html/editar.jsp?id=<%=data.getId_mensaje()%>
                                &&mensaje=<%=data.getMensaje()%>
                                &&autor=<%=data.getAutor()%>"class="btn btn-primary card-link">Editar</a>
                            </div>
                        </div>

                    <%
                        }
                    %>
                </div>
            </div>
        </div>

</body>
</html>