/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import events.IChildEvent;
import events.IParentEvent;
import events.IVenue;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.LinkedList;
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
@WebServlet(urlPatterns = {"/event.do"})
public class EventServlet extends HttpServlet {

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
            out.println("<title>Servlet EventServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EventServlet at " + request.getContextPath() + "</h1>");
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
        
        String id = request.getParameter("eventdata");
        int integerID = Integer.parseInt(id);
        IParentEvent event = UserWrapper.getInstance().getParentEvent(integerID);
        List<IChildEvent> childEvents = event.getChildEvents();
        
        // Check for more than 0 child Events
        Boolean multiple;
        if (childEvents.size() > 0)
            multiple = true;
        else 
            multiple = false;
        
      
       // get a list of venue names without duplicates
      List<String> venueNames = new LinkedList();
      for (IChildEvent child: childEvents)
      {
          venueNames.add(child.getVenue().getName());
      }
      List<String> venueNamez = new LinkedList();
      for (String venue : venueNames)
      {
          if (!venueNamez.contains(venue))
              venueNamez.add(venue);
      }
      
      
      if (childEvents.size() > 0){
      IVenue ve = childEvents.get(0).getVenue();
      String address = ve.getAddress();
      String formattedAddress = address.replaceAll(",", ",").replaceAll("\\s", "+").replaceAll("\\+\\+", "+");
      request.setAttribute("address", formattedAddress);
       request.setAttribute("venue", ve);
      }
      String name = event.getName();
      String newName =  name.replaceAll("\\s+","+");
      
     
     
          
      
        request.setAttribute("name", newName);
       
        request.setAttribute("venueNamez", venueNamez);
        request.setAttribute("event", event);
        request.setAttribute("childEvents", childEvents);
        request.setAttribute("multipleChildren", multiple);
        //request.setAttribute("eventVenue", venue);
        
        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/ParentEvent.jsp"); // /WEB-INF/ParentEvent.jsp
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
