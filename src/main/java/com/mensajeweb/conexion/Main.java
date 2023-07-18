package com.mensajeweb.conexion;

import java.sql.SQLException;
import java.util.List;

public class Main {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
       //ConexionBD.getConnection();
        //System.out.println("Conexion exitosa");

       DAO dao = new DAO();
       List<Mensaje> resultadoConsulta = dao.seleccionar();

        for (Mensaje data : resultadoConsulta ) {
            System.out.println(data);
        }
        //Insertar un dato
       /* Mensaje ms = new Mensaje(1);
        int resultadoUpdate  = dao.actualizar(ms);
        System.out.println("Se actualizo "+resultadoUpdate+" fila(s)");

        int resultDelete = dao.eliminar(ms);
        System.out.println("Se elimino "+resultDelete+" fila(s)");*/
    }
}
