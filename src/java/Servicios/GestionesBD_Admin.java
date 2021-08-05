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

/**
 *
 * @author EDDY
 */
public class GestionesBD_Admin {

    private Connection Conexion;
    private PreparedStatement Pst;
    private ResultSet Rs;
    private boolean Resutlado = false;
    private Admin ObjAdministrador;
    private String Query;
    
    
    public GestionesBD_Admin(Admin Administrador) {
        
        ObjAdministrador = Administrador;
        Conexion = BDConexion.Singleton().ConectarBD();   
    }
    
    
    public ArrayList<Admin> Login() throws SQLException{
        ArrayList<Admin> ListaAdmin = new ArrayList<>();
       
        Query = "SELECT * FROM administradores where Usuario=? and Contrasenia=?";
        
        try{
            Pst = Conexion.prepareStatement(Query);
            Pst.setString(1, ObjAdministrador.getUsuario());
            Pst.setString(2, ObjAdministrador.getContrasenia());
            Rs=Pst.executeQuery();
            
            
            if(Rs!=null){
                while(Rs.next()){
                    
                    ListaAdmin.add(new Admin(Rs.getInt("IdAdmin"),Rs.getString("Nombre"), Rs.getString("Apellidos"), Rs.getString("Usuario"), Rs.getString("Contrasenia")));
                
                }
            
            }
            
        }
        catch(SQLException Sql){
        
            System.err.println("Error de SQL en Admin(Login): "+Sql.toString());
        }
        catch(Exception ex){
        
            System.err.println("Error de general en Admin(Login): "+ex.toString());
        }
        finally{
            Pst.close();;
            Rs.close();
        }
    
        return ListaAdmin;
    }
    
    public boolean ActualizarAdmin(){
        Query = "UPDATE administradores SET Nombre=? , Apellidos=? , Usuario=? , Contrasenia=? WHERE IdAdmin=?";
    
        try{
            Pst = Conexion.prepareStatement(Query); 
            Pst.setString(1, ObjAdministrador.getNombre());
            Pst.setString(2, ObjAdministrador.getApellidos());
            Pst.setString(3, ObjAdministrador.getUsuario());
            Pst.setString(4, ObjAdministrador.getContrasenia());
            Pst.setInt(5, ObjAdministrador.getIdAdmin());
            
            Pst.execute();
            Resutlado = true;
        }
        
        catch(SQLException SQL){
            System.err.println("Error de SQL (ActualizarAmin): "+SQL.toString());
        }
        return Resutlado;
    }
    
    
}
