/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import events.IChildEvent;
import events.IVenue;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import wrappers.UserWrapper;

/**
 *
 * @author Ruth
 */
@WebServlet(urlPatterns = {"/venue.do"})
public class VenueServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VenueServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VenueServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
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
        
        String venueID = request.getParameter("venuedata");
        IVenue venue = UserWrapper.getInstance().getVenue(Integer.parseInt(venueID));
        
         //check if venue has any current events
        Boolean currentEvent = false;
        if (venue.getChildEvents().size() >= 1)
            currentEvent = true;
        
        try {
            List<IChildEvent> venueEvents = venue.getChildEvents();
            request.setAttribute("venueEvents", venueEvents);
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
       
        try {
        String facebook = venue.getFacebook();
        String twitter = venue.getTwitter();
        request.setAttribute("twitter", twitter);
        request.setAttribute("facebook", facebook);
        }
        catch(NullPointerException e)
        {
            request.setAttribute("venue", venue);
        request.setAttribute("currentEvent", currentEvent);
        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/venue.jsp");
        view.forward(request, response);
        
        }
       
       
        
        request.setAttribute("venue", venue);
        request.setAttribute("currentEvent", currentEvent);
        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/venue.jsp");
        view.forward(request, response);
        
        
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
