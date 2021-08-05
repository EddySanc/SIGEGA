/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletsGanado;

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
public class ActualizarGanado extends HttpServlet {

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
        System.err.println("ActualizarGanado"+request.getParameter("NombreGanado"));
        
        try{
            
            Ganado Actualizar =  new Ganado(
                Integer.parseInt(request.getParameter("IdGanado")), request.getParameter("NumRegistro"), request.getParameter("NombreGanado"), request.getParameter("Raza"), request.getParameter("Sexo"), Integer.parseInt(request.getParameter("EdadAprox")),Float.parseFloat(request.getParameter("PesoAprox")), null, request.getParameter("UbicacionGanado"), 0, 0, 0, Integer.parseInt(request.getParameter("Duenio")), null);
                
            Resultado = Actualizar.ModificarGanado();
            
            
            if(Resultado){
                
                request.getRequestDispatcher("ConsultarGanado?IdDuenio="+request.getParameter("Duenio")).forward(request, response);
            }
        }
        catch(SQLException SQL){
            System.err.println("Error de SQL (Servlet ActualizarGanado)"+SQL.toString());
        
        }
        catch(Exception ex){
            System.err.println("Error de General (Servlet ActualizarGanado)"+ex.toString());
        
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
