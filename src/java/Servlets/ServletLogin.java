/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Servicios.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Servicios.Duenio;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

/**
 *
 * @author EDDY
 */
public class ServletLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        
        //Se obtienen los parametros desde el jsp
        String Usuario = request.getParameter("NombreUsuario");
        String Contrasenia = request.getParameter("Contrasenia");
        
        
        
        try{
            Duenio Login = new Duenio();//Creo  una objeto de la clase Duenio, nos servirá para poder acceder al método login
            Admin LoginAdm = new Admin();//Objeto para validar si es un adminstrador
           
            //Envío unicamente es Usuario y Pass, ya que solo eso ocupo para ambos objetos
            Login.setNombreUser(Usuario);
            Login.setContrasenia(Contrasenia);
            
            LoginAdm.setUsuario(Usuario);
            LoginAdm.setContrasenia(Contrasenia);
            
            ArrayList<Duenio> DatosUsuario = Login.Login();//Lista para alojar el resultado
            ArrayList<Admin> DatosAdmin = LoginAdm.Login();//Lista para datos de adminitradores
            
            if(!DatosUsuario.isEmpty()){
                
                if(DatosUsuario.get(0).getEstado().equals("Alta")){//Se evalua si el usuario no ha sido dado de baja
                    
                    System.err.println("inicio correcto");
                    

                    HttpSession Sesion = request.getSession(true);//Creo una sesión para poder mantener los datos del usuario permanentemente

                    Sesion.setAttribute("IdUsuario",DatosUsuario.get(0).getId());
                    Sesion.setAttribute("Nombre", DatosUsuario.get(0).getNombre());
                    Sesion.setAttribute("Apellidos", DatosUsuario.get(0).getApellidos());
                    Sesion.setAttribute("Direccion", DatosUsuario.get(0).getDirecion());
                    Sesion.setAttribute("Telefono", DatosUsuario.get(0).getTelefono());
                    Sesion.setAttribute("NombreUser", DatosUsuario.get(0).getNombreUser());
                    Sesion.setAttribute("Contrasenia", DatosUsuario.get(0).getContrasenia());
                    Sesion.setAttribute("Tipo", DatosUsuario.get(0).getTipo());
                    Sesion.setAttribute("TipoUser", "Usuario");
                    
                    
                    request.getRequestDispatcher("Perfil.jsp").forward(request, response);
                
                }
                else if(DatosUsuario.get(0).getEstado().equals("Baja")){
                    request.setAttribute("Respuesta","Tu cuenta ha sido dado de baja, por favor comunicate con el Administrador");
                    request.getRequestDispatcher("Inicia_Registrate.jsp").forward(request, response);
                }
                
                }
            
            else if (!DatosAdmin.isEmpty()){

                HttpSession Sesion = request.getSession(true);
                
                Sesion.setAttribute("IdAdmin",DatosAdmin.get(0).getIdAdmin());
                Sesion.setAttribute("Nombre", DatosAdmin.get(0).getNombre());
                Sesion.setAttribute("Apellidos", DatosAdmin.get(0).getApellidos());
                Sesion.setAttribute("NombreUser", DatosAdmin.get(0).getUsuario());
                Sesion.setAttribute("Contrasenia", DatosAdmin.get(0).getContrasenia());
                Sesion.setAttribute("TipoUser", "Administrador");
          
                request.getRequestDispatcher("Perfil_Gestiones.jsp").forward(request, response);
            }
            
            else{
                
                request.setAttribute("Respuesta","Usuario y/o Contraseña incorrectos");
                    request.getRequestDispatcher("Inicia_Registrate.jsp").forward(request, response);
            }
        }
        catch(Exception ex){
            System.err.println("Error General:  "+ex.toString());
        }
        
        
        
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
