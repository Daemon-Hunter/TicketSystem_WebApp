/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import events.IChildEvent;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tickets.ITicket;
import wrappers.UserWrapper;

/**
 *
 * @author Ruth
 */
@WebServlet(name = "OrderSummaryServlet", urlPatterns = {"/orderSummary.do"})
public class OrderSummaryServlet extends HttpServlet {

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
            out.println("<title>Servlet OrderSummaryServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderSummaryServlet at " + request.getContextPath() + "</h1>");
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
        
        String child = request.getParameter("child");
        String parent = request.getParameter("parent");
        int pId = Integer.parseInt(parent);
        int cId = Integer.parseInt(child);
        IChildEvent childEvent = UserWrapper.getInstance().getParentEvent(pId).getChildEvent(cId);
        List<ITicket> tickets = childEvent.getTickets();
        
        // List of lists of tickets for different types of tickets
        List<List<ITicket>> listOfTickets = new LinkedList();
        ITicket tick;
        String selectedValue;
        for (int i = 1; i < tickets.size()+1 ; i++)
        {
            selectedValue = request.getParameter("hello"+i);
            String[] parts = selectedValue.split(":");
            int qty = Integer.parseInt(parts[0]);
            int ticketID = Integer.parseInt(parts[1]);
          
            // if purchase amount is less than 1 do nothing
            if (qty > 0)
            {   
                //Create a nice ticket list containing the quantity specified
                List<ITicket> aList = new LinkedList();
                for (int j = 0 ; j < qty; j++)
                {
                    aList.add(tickets.get(i-1));
                }
                //Add the list to the list of lists
                listOfTickets.add(aList);
            }
        }
        
        HttpSession session = request.getSession();
        session.setAttribute("parent", pId);
        session.setAttribute("child", cId);
        session.setAttribute("tickets", listOfTickets);
        request.getRequestDispatcher("Payment.jsp").forward(request, response);
        
        
        
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
