/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servicios;

import ConexionBD.BDConexion;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

/**
 *
 * @author EDDY
 */
public class GestionesBD_Duenio {
     
    //Nos servira para la coneccion y cunsultas
    private Connection Conexion;//Serivira para lograr hacer la conexion desde la clase BDConexion
    //private Duenio ObjDuenio; //Objeto de la clase Duenio de la  cual extraeremos sus aatributos  para manipularlos
    private PreparedStatement Pst;
    private ResultSet Rs;
    private String Query;
    private boolean Resultado = false;
    private Duenio ObjDuenio;
    private ArrayList<Duenio> DatosGanado = new ArrayList<>();

    
    public GestionesBD_Duenio(Duenio Duenio){
        ObjDuenio = Duenio;
        Conexion = BDConexion.Singleton().ConectarBD(); 
    }
    
    
    public ArrayList<Duenio> Login() throws SQLException{
        
        ArrayList<Duenio> DuenioList = new ArrayList<>(); //Lista para guardar las consultas a la BD
        Query ="SELECT * FROM duenio where NombreUser=? and Contrasenia=?"; 
        
        try{
            Pst=Conexion.prepareStatement(Query);//se Prepara el preparedStatement con la conexion y consulta(query)
            //Envio de parametros
            Pst.setString(1,ObjDuenio.getNombreUser());
            Pst.setString(2,ObjDuenio.getContrasenia());
            
            Rs=Pst.executeQuery();//Alojo el resultado de ejecutar el pst en ResultSet
            if(Rs!=null){//Evaluo si mi Rs obtuvo algun valor en la consulta
                while(Rs.next()){//Recorro el Rs
                    //Llenado de la lista con los atributos de la tupla obtenida
                    DuenioList.add(new Duenio(Rs.getInt("IdDuenio"),Rs.getString("Nombre"),Rs.getString("Apellidos"),Rs.getString("Direccion"),Rs.getString("Telefono"),Rs.getString("NombreUser"),Rs.getString("Contrasenia"),Rs.getInt("Tipo"),Rs.getString("Estado")));
                }
            }
            
        }
        catch(SQLException ex){
            
            System.out.println("Error de SQL ocurrido Usuario(Login): "+ex.toString());
        
        }
        catch(Exception e){
            System.err.println("Error General: Usuario(Login)"+ e.toString());
        }
        finally{
            Rs.close();//cierrre de el result set
            Pst.close();
        }
        
        return DuenioList;
    }
    
    //METODO MODIFICAR USUARIO 
    
    public boolean ModificarUsuario() throws SQLException{
        
        Query="UPDATE Duenio SET Nombre=? , Apellidos=? , Direccion=? , Telefono=? , NombreUser=? , Contrasenia=? WHERE IdDuenio=?";
       
        
        try{
        
            Pst=Conexion.prepareStatement(Query);//Preparo el pst con la conexion y consulta
            //Envio de parametros
            Pst.setString(1, ObjDuenio.getNombre());
            Pst.setString(2, ObjDuenio.getApellidos());
            Pst.setString(3, ObjDuenio.getDirecion());
            Pst.setString(4, ObjDuenio.getTelefono());
            Pst.setString(5, ObjDuenio.getNombreUser());
            Pst.setString(6, ObjDuenio.getContrasenia());
            Pst.setInt(7, ObjDuenio.getId());
            Pst.executeUpdate();
            Resultado=true;
        }
        catch(SQLException SQl){
            System.err.println("Error SQL : (Actualizar User)"+SQl.toString());
        }
        catch(Exception ex){
            System.err.println("Error General(Actualizar Duenio): "+ex.toString());
        }
        
        return Resultado;//Retorno un dato tipo booleano
   }
    
    public boolean RegistrarUsuario(){
    
        Query = "INSERT duenio VALUES(?,?,?,?,?,?,1,'Alta')";
        
        try{
            Pst = Conexion.prepareStatement(Query);
            Pst.setString(1, ObjDuenio.getNombre());
            Pst.setString(2, ObjDuenio.getApellidos());
            Pst.setString(3, ObjDuenio.getDirecion());
            Pst.setString(4, ObjDuenio.getTelefono());
            Pst.setString(5,ObjDuenio.getNombreUser());
            Pst.setString(6, ObjDuenio.getContrasenia());
            Pst.execute();
            Resultado = true;
        
        }
        catch(SQLException SQL){
            System.err.println("Error de SQL (Registro User): "+SQL.toString());
        }
        catch(Exception e){
            System.err.println("Error de General (Registro User): "+e.toString());
        }
        return Resultado;
    }
    
    public boolean EliminarUsuario() throws SQLException{
        Query = "UPDATE duenio SET Estado='Baja' WHERE IdDuenio=?";
        
        try{
            Pst = Conexion.prepareStatement(Query);
            Pst.setInt(1, ObjDuenio.getId());
            
            Pst.executeUpdate();
            Resultado=true;
            
            }
        catch(SQLException SQL){
            System.err.println("Error de SQL (EliminarUsuario)"+SQL.toString());
        }
        catch(Exception ex){
            System.err.println("Error General (EliminaUsuario):"+ex.toString());
        }
        finally{
            Pst.close();
        }
        
        return Resultado;
        }
    
    public ArrayList<Duenio> ConsultarDuenios() {
    
        Query = "SELECT * FROM duenio where Estado='Alta'";
        
        try{
            
            Pst = Conexion.prepareStatement(Query);
            
            
            Rs = Pst.executeQuery();
            
            if(Rs!=null){
                
                while(Rs.next()){
                    
                    DatosGanado.add(new Duenio(Rs.getInt("IdDuenio"), Rs.getString("Nombre"), Rs.getString("Apellidos"), Rs.getString("Direccion"), Rs.getString("Telefono"), Rs.getString("NombreUser"), Rs.getString("Contrasenia"),Rs.getInt("Tipo"),Rs.getString("Estado")));
                }
                
                
            }
            
        
        }
        catch(SQLException SQL){
            System.err.println("Error de SQL(Consulta Ganado)"+SQL.toString());
        
        }
        catch(Exception ex){
            System.err.println("Error de General(Consulta Ganado)"+ex.toString());
        
        }
       
        return DatosGanado;
    }
    
}
