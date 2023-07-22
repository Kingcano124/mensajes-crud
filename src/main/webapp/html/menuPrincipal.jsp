<%@ page import="com.mensajeweb.conexion.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>


</head>
<body>
<div class="sidebar">
    <div class="top">
        <div class="logo">
            <i class="bx bxl-codepen"></i>
            <span> Messages</span>
        </div>
        <i class="bx bx-menu" id="btn"></i>
    </div>
    <!--<div class="user">
        <img src="tree.png" alt="me" class="user-img">
        <div>
            <p class="bold">Client. B</p>
            <p>Admin</p>
        </div>

    </div>-->
    <ul>
        <li>
            <a href="#">
                <i class="bx bxs-grid-alt"></i>
                <span class="nav-item">Dashboard</span>
            </a>
            <span class="tooltip">Dashboard</span>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-message-rounded-dots'></i>
                <span class="nav-item">Mensajes</span>
            </a>
            <span class="tooltip">Mensajes</span>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-info-circle'></i>
                <span class="nav-item">README</span>
            </a>
            <span class="tooltip">README</span>
        </li>

    </ul>
</div>
<div class="div main-content" id="contenedor-principal">
    <div class="container">
        <!-- Contenido principal -->
        <div class="col-md-12 content"  id="container">

            <dvi class="ms">
                <h1>Listado de mensajes</h1>
                <button type="button" class="btn-open-modal btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalCreate">
                    Crear mensaje
                </button>
            </dvi>
            <!-- Card recuperar datos -->

            <!--Card mostrar mensajes-->
            <%
                DAO dao = new DAO();
                List<Mensaje> resultadoConsulta = dao.seleccionar();
                int contadorColumnas = 0; // Contador para controlar el número de columnas

                for (Mensaje data : resultadoConsulta) {
                    if (contadorColumnas % 4 == 0) { // Comprobar si es el inicio de una nueva fila
                        if (contadorColumnas != 0) { // Cerrar la fila anterior excepto en la primera iteración
            %>
        </div> <!-- Cierre de la fila anterior -->
        <%
            }
        %>
        <div class="row fila"> <!-- Inicio de una nueva fila -->
            <%
                }
            %>
            <div class=" col-sm-6 col-lg-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%=data.getAutor()%>
                        </h5>
                        <p class="card-text"><%=data.getMensaje()%>
                        </p>
                        <p class="blockquote-footer"><cite><%=data.getFecha()%>
                        </cite></p>
                        <div class="btn-funciones">
                            <a href="#" class="btn btn-danger card-link">Eliminar</a>
                            <a href="editar.jsp?id=<%=data.getId_mensaje()%>&mensaje=<%=data.getMensaje()%>&autor=<%=data.getAutor()%>"
                               class="btn btn-primary card-link btn-editar">Editar</a>
                        </div>
                    </div>
                </div>
            </div>
            <%
                    contadorColumnas++;
                }

                // Cerrar la última fila si quedan columnas abiertas
                if (contadorColumnas != 0) {
            %>
        </div> <!-- Cierre de la última fila -->
        <%
            }
        %>
    </div>
</div>

<!--Modal dialog-->
<div class="modal fade" id="modalCreate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="submit" name="enviar" class="btn btn-primary">Crear</button>
            </div>
        </div>
    </div>
</div>
    <!--End modal dialog-->

    <!--Create a new message-->
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

</body>
<script src="../JS/script.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</html>