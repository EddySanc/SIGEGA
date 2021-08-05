/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servicios;

import ConexionBD.BDConexion;
import java.awt.Image;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author EDDY
 */
public class GestionesBD_Ganado {
    
    private Connection Conexion;
    private PreparedStatement Pst;
    private ResultSet Rs;
    private ArrayList<Ganado> DatosGanado = new ArrayList<>();
    private boolean Resultado = false;
    private String Query;
    private Ganado ObjGanado;

    public GestionesBD_Ganado(Ganado ObjGanados) {
        Conexion =  BDConexion.Singleton().ConectarBD();
        ObjGanado = ObjGanados;
        
    }
    
    public boolean Registrar() throws SQLException{
        Query="INSERT ganado VALUES(?,?,?,?,?,?,'Alta',?,null,null,null,?,null)";
        
        try{
            Pst = Conexion.prepareStatement(Query);
            Pst.setString(1, ObjGanado.getNumRegistro());
            Pst.setString(2, ObjGanado.getNombre());
            Pst.setString(3, ObjGanado.getRaza());
            Pst.setString(4, ObjGanado.getSexo());
            Pst.setInt(5, ObjGanado.getEdadAprox());
            Pst.setFloat(6, ObjGanado.getPesoAprox());
            Pst.setString(7, ObjGanado.getUbicacionGanado());
            Pst.setInt(8, ObjGanado.getDuenio());
            
            Pst.executeUpdate();
            Resultado = true;
            
        }
        catch(SQLException SQL){
            System.err.println("Error de SQL en Inserccion Ganado:"+SQL.toString());
        }
        catch(Exception ex){
            System.err.println("Error General(Inserccion Ganado): "+ex.toString());
        }
            return Resultado;
        }
    
    public ArrayList<Ganado> ConsultarGanados() {
    
        Query = "SELECT * FROM ganado where Duenio=? and (Estado='Alta' or Estado='Venta' or Estado='Vendido')";
        
        try{
            
            Pst = Conexion.prepareStatement(Query);
            Pst.setInt(1, ObjGanado.getDuenio());
            
            Rs = Pst.executeQuery();
            
            if(Rs!=null){
                
                while(Rs.next()){
                    
                    DatosGanado.add(new Ganado(Rs.getInt("IdGanado"),Rs.getString("NumRegistro"), Rs.getString("Nombre"), Rs.getString("Raza"), Rs.getString("Sexo"), Rs.getInt("EdadAprox"), Rs.getInt("PesoAprox"), Rs.getString("Estado"), Rs.getString("UbicacionGanado"), Rs.getFloat("PosLatitud"), Rs.getFloat("PosLongitud"), Rs.getFloat("Precio"), Rs.getInt("Duenio"),null));
                    
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
    
    
    public boolean EliminarGanado() throws SQLException {
        Query = "UPDATE ganado SET Estado='Baja' WHERE IdGanado=?";
        
        try{
            Pst = Conexion.prepareStatement(Query);
            Pst.setInt(1, ObjGanado.getIdGanado());
            
            Pst.executeUpdate();
            Resultado=true;
            
            }
        catch(SQLException SQL){
            System.err.println("Error de SQL (EliminarGanado)"+SQL.toString());
        }
        catch(Exception ex){
            System.err.println("Error General (EliminaGanado):"+ex.toString());
        }
        finally{
            Pst.close();
        }
        
        return Resultado;
        }
    
        public boolean ModificarGanado() throws SQLException{
        
        Query="UPDATE ganado SET NumRegistro=?,Nombre=?,Raza=?,Sexo=?,EdadAprox=?,PesoAprox=?,UbicacionGanado=? WHERE IdGanado=?";
       
        
        try{
        
            Pst=Conexion.prepareStatement(Query);//Preparo el pst con la conexion y consulta
            //Envio de parametros
            Pst.setString(1, ObjGanado.getNumRegistro());
            Pst.setString(2, ObjGanado.getNombre());
            Pst.setString(3, ObjGanado.getRaza());
            Pst.setString(4, ObjGanado.getSexo());
            Pst.setInt(5, ObjGanado.getEdadAprox());
            Pst.setFloat(6, ObjGanado.getPesoAprox());
            Pst.setString(7, ObjGanado.getUbicacionGanado());
            Pst.setInt(8, ObjGanado.getIdGanado());
            
            Pst.executeUpdate();
            Resultado=true;
        }
        catch(SQLException SQl){
            System.err.println("Error SQL : (Actualizar Ganado)"+SQl.toString());
        }
        catch(Exception ex){
            System.err.println("Error General: (Actualizar Ganado)"+ex.toString());
        }
        
        return Resultado;//Retorno un dato tipo booleano
   }
    
    }
    

    







