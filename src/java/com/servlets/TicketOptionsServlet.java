/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import events.IChildEvent;
import events.IParentEvent;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import people.IUser;
import tickets.ITicket;
import tickets.Ticket;
import utilities.WebWrapper;

/**
 *
 * @author Ruth
 */
@WebServlet(name = "TicketOptionsServlet", urlPatterns = {"/ticketOption.do"})
public class TicketOptionsServlet extends HttpServlet {

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
            out.println("<title>Servlet TicketOptionsServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TicketOptionsServlet at " + request.getContextPath() + "</h1>");
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
       
        HttpSession session = request.getSession(false);
        if (session == null) {
            
        }
        
        else {
            if ((Boolean)session.getAttribute("loggedIn")){
                    IUser currentUser = (IUser)session.getAttribute("currentUser");
            }
        }
        String parent = request.getParameter("parent");
        String child = request.getParameter("child");
        
        int parentID = Integer.parseInt(parent);
        int childID = Integer.parseInt(child);
        IParentEvent parentEvent = WebWrapper.getInstance().getParentEvent(parentID);
        IChildEvent purchaseEvent = parentEvent.getChildEvent(childID);
        
        request.setAttribute("childEvent", purchaseEvent);
        request.setAttribute("parentEvent", parentEvent);
        Boolean noEvents = false;
          List<ITicket> tickets = purchaseEvent.getTickets();
          for (ITicket tick : tickets){
              if (tick.getRemaining() < 1)
              noEvents = true;
              else{
                  noEvents = false;
              }
          }
         
          
          
          request.setAttribute("noEvents", noEvents);
          request.setAttribute("ticketList", tickets);
                    
        RequestDispatcher view = request.getRequestDispatcher("WEB-INF/buyTickets.jsp"); //
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
