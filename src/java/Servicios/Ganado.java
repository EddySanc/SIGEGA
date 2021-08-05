
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servicios;

import Servicios.GestionesBD_Ganado;
import java.awt.Image;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author EDDY
 */
public class Ganado {
    public int IdGanado;
    public String NumRegistro;
    public String Nombre;
    public String Raza;
    public String Sexo;
    public int EdadAprox;
    public float PesoAprox;
    public String Estado;
    public String UbicacionGanado;
    public float PosLatitud;
    public float PosLongitud;
    public float Precio;
    public int Duenio;
    public Image Imagen;
   

    public Ganado(int IdGanado, String NumRegistro, String Nombre, String Raza, String Sexo, int EdadAprox, float PesoAprox, String Estado, String UbicacionGanado, float PosLatitud, float PosLongitud, float Precio, int Duenio,Image  Imagen) {
        this.IdGanado = IdGanado;
        this.NumRegistro = NumRegistro;
        this.Nombre = Nombre;
        this.Raza = Raza;
        this.Sexo = Sexo;
        this.EdadAprox = EdadAprox;
        this.PesoAprox = PesoAprox;
        this.Estado = Estado;
        this.UbicacionGanado = UbicacionGanado;
        this.PosLatitud = PosLatitud;
        this.PosLongitud = PosLongitud;
        this.Precio = Precio;
        this.Duenio = Duenio;
        this.Imagen = Imagen;
        
        
    }

    public Ganado() {
        
        this(0,"","","","",0,0,"","",0,0,0,0,null);
    }

    public int getIdGanado() {
        return IdGanado;
    }

    public void setIdGanado(int IdGanado) {
        this.IdGanado = IdGanado;
    }

    
    
    public String getNumRegistro() {
        return NumRegistro;
    }

    public void setNumRegistro(String NumRegistro) {
        this.NumRegistro = NumRegistro;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getRaza() {
        return Raza;
    }

    public void setRaza(String Raza) {
        this.Raza = Raza;
    }

    public String getSexo() {
        return Sexo;
    }

    public void setSexo(String Sexo) {
        this.Sexo = Sexo;
    }

    public int getEdadAprox() {
        return EdadAprox;
    }

    public void setEdadAprox(int EdadAprox) {
        this.EdadAprox = EdadAprox;
    }

    public float getPesoAprox() {
        return PesoAprox;
    }

    public void setPesoAprox(float PesoAprox) {
        this.PesoAprox = PesoAprox;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public String getUbicacionGanado() {
        return UbicacionGanado;
    }

    public void setUbicacionGanado(String UbicacionGanado) {
        this.UbicacionGanado = UbicacionGanado;
    }

    public float getPosLatitud() {
        return PosLatitud;
    }

    public void setPosLatitud(float PosLatitud) {
        this.PosLatitud = PosLatitud;
    }

    public float getPosLongitud() {
        return PosLongitud;
    }

    public void setPosLongitud(float PosLongitud) {
        this.PosLongitud = PosLongitud;
    }

    public float getPrecio() {
        return Precio;
    }

    public void setPrecio(float Precio) {
        this.Precio = Precio;
    }

    public int getDuenio() {
        return Duenio;
    }

    public void setDuenio(int Duenio) {
        this.Duenio = Duenio;
    }

    public Image getImagen() {
        return Imagen;
    }

    public void setImagen(Image Imagen) {
        this.Imagen = Imagen;
    }
 
    public boolean Registrar() throws SQLException{
    
        GestionesBD_Ganado Registrar = new GestionesBD_Ganado(this);
        
        return Registrar.Registrar();
    }
    
    public boolean EliminarGanado() throws SQLException{
    
        GestionesBD_Ganado Eliminar = new GestionesBD_Ganado(this);
        return  Eliminar.EliminarGanado();
    }
    
    public ArrayList<Ganado> ConsultarGanados() throws SQLException{
        
        GestionesBD_Ganado Consultar = new GestionesBD_Ganado(this);
        
        return Consultar.ConsultarGanados();
    }
    
    public boolean ModificarGanado() throws SQLException{
        
        GestionesBD_Ganado Modificar = new GestionesBD_Ganado(this);
        return  Modificar.ModificarGanado();
    }

    
    
}
