/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletsAdmin;

import Servicios.Duenio;
import Servicios.Ganado;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author EDDY
 */
public class RegistrarUsuarios extends HttpServlet {

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
        
         boolean Resultado;
        
         System.err.println("Nombre");
   
        try{
            
            Duenio Registrar = new Duenio(0, request.getParameter("Nombre"), request.getParameter("Apellidos"), request.getParameter("Direccion"), request.getParameter("Telefono"), request.getParameter("NombreUser"), request.getParameter("Contrasenia"), 0,"");
            
            
            Resultado = Registrar.RegistrarUsuario();
       
            if(Resultado){
                    request.setAttribute("Resultado", "El usuario ha sido registrado");
                    request.getRequestDispatcher("Perfil_Gestiones.jsp").forward(request, response);
            
            }
        }
        catch(SQLException SQL){
            System.err.println("Erro de SQL(Servlet RegistrarUsuarios"+SQL.toString());
        }
        catch(Exception ex){
            System.err.println("Error de General(Servlet RegistrarUsuarios"+ex.toString());
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
