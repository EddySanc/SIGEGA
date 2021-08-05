/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Servicios.Duenio;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author EDDY
 */
public class ActualizarUser extends HttpServlet {

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
        
        boolean Resultado = false;
        Duenio Actualizar = new Duenio(
        Integer.parseInt(request.getParameter("IdDuenio")), request.getParameter("Nombre"), request.getParameter("Apellidos"), request.getParameter("Direccion"),request.getParameter("Telefono"), request.getParameter("NombreUser"), request.getParameter("Contrasenia"), 0, null);
        
        try{
            Resultado=Actualizar.Actualizar();
            if(Resultado){
                    HttpSession Sesion = request.getSession(true);//Creo una sesión para poder mantener los datos del usuario permanentemente

                    Sesion.setAttribute("Nombre", request.getParameter("Nombre"));
                    Sesion.setAttribute("Apellidos", request.getParameter("Apellidos"));
                    Sesion.setAttribute("NombreUser", request.getParameter("NombreUser"));
                    Sesion.setAttribute("Contrasenia", request.getParameter("Contrasenia"));
                    Sesion.setAttribute("Direccion", request.getParameter("Direccion"));
                    Sesion.setAttribute("Telefono", request.getParameter("Telefono"));
                    
                    
                    request.setAttribute("Resultado", "Tus datos han sido actualizados");
                    request.getRequestDispatcher("Perfil.jsp").forward(request, response);
            
            }
        }
        catch(SQLException SQL){
            System.err.println("Error de SQL:(Modificacion) "+SQL.toString());
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
