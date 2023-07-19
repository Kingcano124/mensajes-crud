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
    <link rel="stylesheet" href="style.css">
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
            <h1>Listado de mensajes</h1>
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
</body>
<script>
    let btn = document.querySelector('#btn');
    let sidebar = document.querySelector('.sidebar');

    btn.onclick = function(){
        sidebar.classList.toggle('active');
    }

    //Scroll de la sección  de Listado de mensajes
    var objDiv = document.getElementById("contenedor-principal");
    objDiv.scrollTop = objDiv.scrollHeight;
</script>
</html>