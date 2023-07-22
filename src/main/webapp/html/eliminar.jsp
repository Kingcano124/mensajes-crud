<%@ page import="com.mensajeweb.conexion.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
    <%
            DAO mensajeDao = new DAO();
            try {

                String idstring = request.getParameter("id");
                idstring = idstring.trim();
                int id = Integer.parseInt(idstring);

                Mensaje sms = new  Mensaje(id);
                mensajeDao.eliminar(sms);
                String successMessage = "El proceso se completó con éxito.";
                request.setAttribute("successMessage", successMessage);

                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                System.out.println("El valor proporcionado no es un número entero válido.");
            }


    %>
</body>
</html>
