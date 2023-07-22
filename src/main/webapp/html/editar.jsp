<%@ page import="com.mensajeweb.conexion.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Editar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
</head>
    <body>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Editar mensajes</h5>
                </div>
                <div class="modal-body">
                    <form action="editar.jsp" method="post" >
                        <div class="mb-3">
                            <label class="form-label" >Mensaje</label>
                            <textarea type="text" class="form-control" name="mensaje"  placeholder="Ingrese un mensaje..." rows="3"><%=request.getParameter("mensaje").trim()%></textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" >Autor</label>
                            <input type="text" class="form-control" name="autor" placeholder="Ingrese un autor" value="<%=request.getParameter("autor").trim()%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label" >Autor</label>
                            <input type="hidden" class="form-control" name="id" value="<%=request.getParameter("id")%>">
                        </div>
                        <div class="modal-footer">
                            <a href="../index.jsp" class="btn btn-primary">Regresar</a>
                            <button type="submit" name="aplicar" class="btn btn-primary">Guardar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%
            DAO mensajeDao = new DAO();
            if(request.getParameter("aplicar")!= null){
                try {

                    String idstring = request.getParameter("id");
                    idstring = idstring.trim();
                    int id = Integer.parseInt(idstring);

                    Mensaje sms = new  Mensaje(
                             id,
                            request.getParameter("mensaje"),
                            request.getParameter("autor")
                    );
                    mensajeDao.actualizar(sms);
                } catch (NumberFormatException e) {
                    System.out.println("El valor proporcionado no es un número entero válido.");
                }


            }

        %>



    </body>
</html>
