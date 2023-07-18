package com.mensajeweb.conexion;

import static com.mensajeweb.conexion.ConexionBD.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    private Mensaje mensaje;
    public List<Mensaje> seleccionar () throws ClassNotFoundException{
      String sql = "SELECT * FROM mensajes";
      List<Mensaje> mensajes = new ArrayList<>();

      try {
          this.conn = getConnection();
          this.ps = this.conn.prepareStatement(sql);
          this.rs = this.ps.executeQuery();
          System.out.println(this.rs);

          while (this.rs.next()){
                int id = this.rs.getInt("id_mensaje");
                String sms = this.rs.getString("mensaje");
                String autor = this.rs.getString("autor");
                String fecha = this.rs.getString("fecha");

                this.mensaje = new Mensaje(id,sms,autor,fecha);
                mensajes.add(this.mensaje);
          }
      }catch (SQLException ex){
          ex.printStackTrace(System.out);
      }finally {
          //Cerramos las conexiones de conexion, Resulset y preparetStatement
          try {
              closed(this.rs);
              closed(this.ps);
              closed(this.conn);
          }catch (SQLException ex){
              ex.printStackTrace(System.out);
          }

      }
        return mensajes;
    }

    public int insertar (Mensaje mensaje) throws ClassNotFoundException{
        String sql = "INSERT INTO mensajes (mensaje,autor,fecha) " +
                     "values(?,?,current_time )";
        //List<Mensaje> mensajes = new ArrayList<>();
        int registros = 0;
        try {
            this.conn = getConnection();
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setString(1,mensaje.getMensaje());
            this.ps.setString(2,mensaje.getAutor());
            registros = this.ps.executeUpdate();
        }catch (SQLException ex){
            System.out.println("Exception SQL Exception");
            ex.printStackTrace(System.out);
        }finally {
            //Cerramos las conexiones de conexion, Resulset y preparetStatement
            try {
                closed(this.ps);
                closed(this.conn);
            }catch (SQLException ex){
                ex.printStackTrace(System.out);
            }
        }
        return registros;
    }

    public int actualizar (Mensaje mensaje) throws ClassNotFoundException{
        String sql = "UPDATE mensajes SET mensaje=?,autor=?,fecha=current_time" +
                     " WHERE id_mensaje =?";

        int registros = 0;
        try {
            this.conn = getConnection();
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setString(1,mensaje.getMensaje());
            this.ps.setString(2,mensaje.getAutor());
            this.ps.setInt(3,mensaje.getId_mensaje());
            registros = this.ps.executeUpdate();
        }catch (SQLException ex){
            System.out.println("Exception SQL Exception");
            ex.printStackTrace(System.out);
        }finally {
            //Cerramos las conexiones de conexion, Resulset y preparetStatement
            try {
                closed(this.ps);
                closed(this.conn);
            }catch (SQLException ex){
                ex.printStackTrace(System.out);
            }
        }
        return registros;
    }

    public int eliminar (Mensaje mensaje) throws ClassNotFoundException{
        String sql = "DELETE FROM mensajes WHERE id_mensaje =?";

        int registros = 0;
        try {
            this.conn = getConnection();
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setInt(1,mensaje.getId_mensaje());
            registros = this.ps.executeUpdate();
        }catch (SQLException ex){
            System.out.println("Exception SQL Exception");
            ex.printStackTrace(System.out);
        }finally {
            //Cerramos las conexiones de conexion, Resulset y preparetStatement
            try {
                closed(this.ps);
                closed(this.conn);
            }catch (SQLException ex){
                ex.printStackTrace(System.out);
            }
        }
        return registros;
    }
}
