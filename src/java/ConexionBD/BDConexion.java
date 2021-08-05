/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConexionBD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author EDDY
 */
public class BDConexion {
   
    private Connection Conexion=null;
    private static BDConexion objConexion;
   
    
    public Connection ConectarBD(){
    
    if(Conexion==null){   
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String connectionUrl = "jdbc:sqlserver://localhost:1433;"+
                "databaseName=SIGEGA;user=sa;password=Eddy21gamaliel";
              Conexion = DriverManager.getConnection(connectionUrl);

            } 
        catch (SQLException e) {
                System.out.println("SQL Exception: "+ e.toString());      
            } 
        catch (ClassNotFoundException cE) {
                System.out.println("Class Not Found Exception: "+ cE.toString());    
            }    
    }
        
    return Conexion;    
    }
    
    public static BDConexion Singleton(){
    
        if(objConexion==null){
            objConexion = new BDConexion();
        }
        return objConexion;
    } 
    
}
