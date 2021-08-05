/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servicios;

import ConexionBD.BDConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Observable;
import javafx.collections.ObservableList;

/**
 *
 * @author EDDY
 */
public class Duenio {
    public int Id;
    public String Nombre;
    public String Apellidos;
    public String Direcion;
    public String Telefono;
    public String NombreUser;
    public String Contrasenia;
    public int Tipo;
    public String Estado;
    
    
    public Duenio(int Id, String Nombre, String Apellidos, String Direcion, String Telefono, String NombreUser, String Contrasenia, int Tipo, String Estado) {
        this.Id = Id;
        this.Nombre = Nombre;
        this.Apellidos = Apellidos;
        this.Direcion = Direcion;
        this.Telefono = Telefono;
        this.NombreUser = NombreUser;
        this.Contrasenia = Contrasenia;
        this.Tipo = Tipo;
        this.Estado = Estado;
         
        
    }

    public Duenio() {
        this(0,"","","","","","",0,"");
        
        
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String Apellidos) {
        this.Apellidos = Apellidos;
    }

    public String getDirecion() {
        return Direcion;
    }

    public void setDirecion(String Direcion) {
        this.Direcion = Direcion;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    public String getNombreUser() {
        return NombreUser;
    }

    public void setNombreUser(String NombreUser) {
        this.NombreUser = NombreUser;
    }

    public String getContrasenia() {
        return Contrasenia;
    }

    public void setContrasenia(String Contrasenia) {
        this.Contrasenia = Contrasenia;
    }

    public int getTipo() {
        return Tipo;
    }

    public void setTipo(int Tipo) {
        this.Tipo = Tipo;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }
    
    
    
    public ArrayList<Duenio> Login() throws SQLException{
        GestionesBD_Duenio Login = new GestionesBD_Duenio(this);
        return Login.Login();
    }
    
    public boolean Actualizar() throws SQLException{
        GestionesBD_Duenio Actualizar = new GestionesBD_Duenio(this);
        return  Actualizar.ModificarUsuario();
    }
    public boolean RegistrarUsuario() throws SQLException{
        GestionesBD_Duenio Registrar = new GestionesBD_Duenio(this);
        return  Registrar.RegistrarUsuario();
    }
    
    public ArrayList<Duenio> ConsultarUsuarios() throws SQLException{
        GestionesBD_Duenio Consultar = new GestionesBD_Duenio(this);
        return  Consultar.ConsultarDuenios();
    }
    
     public boolean EliminarUsuario() throws SQLException{
        GestionesBD_Duenio Eliminar = new GestionesBD_Duenio(this);
        return  Eliminar.EliminarUsuario();
     }
    
   
    
   
    
    
}
