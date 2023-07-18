package com.mensajeweb.conexion;

import java.sql.*;

public class ConexionBD {
    //Atributos de la conexión
    private static final String URL = "jdbc:mysql://localhost:3306/mensaje_db?serverTimezone=UTC";
    private static final String user = "root";
    private static final String pass = "root";

    //Metodo para realizar la conexión
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL,user,pass);
    }

    //Metodos para cerrar los flujos
    public static void closed(PreparedStatement ps) throws SQLException{
        ps.close();
    }
    public static void closed(ResultSet rs) throws SQLException{
        rs.close();
    }
    public static void closed(Connection conn) throws SQLException{
        conn.close();
    }
}
