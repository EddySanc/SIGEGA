/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servicios;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author EDDY
 */
public class Admin {
    
    public int IdAdmin;
    public String Nombre;
    public String Apellidos;
    public String Usuario;
    public String Contrasenia;

    public Admin(int IdAdmin, String Nombre, String Apellidos, String Usuario, String Contrasenia) {
        this.IdAdmin = IdAdmin;
        this.Nombre = Nombre;
        this.Apellidos = Apellidos;
        this.Usuario = Usuario;
        this.Contrasenia = Contrasenia;
    }

    public Admin() {
        this(0,"","","","");
    
    }

    public int getIdAdmin() {
        return IdAdmin;
    }

    public void setIdAdmin(int IdAdmin) {
        this.IdAdmin = IdAdmin;
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

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public String getContrasenia() {
        return Contrasenia;
    }

    public void setContrasenia(String Contrasenia) {
        this.Contrasenia = Contrasenia;
    }
    
    
    public ArrayList<Admin> Login() throws SQLException{
        GestionesBD_Admin Login = new GestionesBD_Admin(this);
        return Login.Login();
    }
    
    public boolean ActualizarAdmin(){
    
        GestionesBD_Admin Actualizar = new GestionesBD_Admin(this);
        return Actualizar.ActualizarAdmin();
    }
    
}
