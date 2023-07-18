package com.mensajeweb.conexion;

public class Mensaje {

    private int id_mensaje;
    private String mensaje;
    private String autor;
    private String fecha;

    public Mensaje(){

    }
    public Mensaje(int id_mensaje) {
        this.id_mensaje = id_mensaje;
    }
    public Mensaje(String mensaje, String autor) {
        this.mensaje = mensaje;
        this.autor = autor;
    }

    public Mensaje(int id_mensaje, String mensaje, String autor) {
        this.id_mensaje = id_mensaje;
        this.mensaje = mensaje;
        this.autor = autor;
    }

    public Mensaje(int id_mensaje, String mensaje, String autor, String fecha) {
        this.id_mensaje = id_mensaje;
        this.mensaje = mensaje;
        this.autor = autor;
        this.fecha = fecha;
    }

    public int getId_mensaje() {
        return id_mensaje;
    }

    public void setId_mensaje(int id_mensaje) {
        this.id_mensaje = id_mensaje;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    @Override
    public String toString() {
        return "Mensajeo{" +
                "id_mensaje=" + id_mensaje +
                ", mensaje='" + mensaje + '\'' +
                ", autor='" + autor + '\'' +
                ", fecha='" + fecha + '\'' +
                '}';
    }
}
