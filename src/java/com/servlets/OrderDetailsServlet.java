 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import bookings.GuestBooking;
import bookings.IOrder;
import events.IChildEvent;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import people.Guest;
import people.IGuest;
import tickets.ITicket;
import utilities.Validator;
import utilities.WebWrapper;

/**
 *
 * @author Ruth
 */
@WebServlet(name = "OrderDetailsServlet", urlPatterns = {"/orderDetails.do"})
public class OrderDetailsServlet extends HttpServlet {

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
            out.println("<title>Servlet OrderDetailsServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderDetailsServlet at " + request.getContextPath() + "</h1>");
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
        
        HttpSession session = request.getSession();
        List<List<ITicket>> ticketList = (List)session.getAttribute("tickets");
        IChildEvent cId = (IChildEvent)session.getAttribute("child");
        
        
       if (!(Boolean)session.getAttribute("loggedIn")) {
           
                String guestEmail = request.getParameter("email");
                String guestAddress = request.getParameter("address");
                String guestPostcode = request.getParameter("postcode");
                //Validate postcode
                try{
                Validator.postcodeValidator(guestPostcode);
                }
                catch(IllegalArgumentException e){

                    request.setAttribute("error", e.getMessage());
                    request.getRequestDispatcher("Payment.jsp").forward(request, response);
                }

                //Validate email
                try{
                    Validator.emailValidator(guestEmail);
                }
                catch(IllegalArgumentException e){
                    request.setAttribute("error", "Please enter a valid email");
                    request.getRequestDispatcher("Payment.jsp").forward(request, response);
                }

                //Validate address
                try{
                    Validator.addressValidator(guestAddress);
                }
                catch(IllegalArgumentException e){
                    request.setAttribute("error", "Please enter a valid email");
                    request.getRequestDispatcher("Payment.jsp").forward(request, response);
                }


                IGuest newGuest;
                try{    
                    //Create the new guest
                newGuest = new Guest(guestEmail, guestAddress, guestPostcode);

                // create booking list
                //Iterate through the list of tickets 
                List<GuestBooking> bookings = new LinkedList();
                List<String> newTicketList = new LinkedList();
                for (List<ITicket> tList:  ticketList)
                {


                    ITicket ticket = tList.get(0);
                    int qty = tList.size();
                    Date date = new Date();
                    GuestBooking guestBooking = new GuestBooking(ticket, qty, date, newGuest);
                    bookings.add(guestBooking);
                    newTicketList.add(tList.get(0).getType() + "  x " + qty);
                }

                List<GuestBooking> completeOrder = WebWrapper.getInstance().makeGuestBookings(bookings);
                request.setAttribute("ticketList", newTicketList);
                request.setAttribute("bookingList", completeOrder);
                request.setAttribute("user", newGuest);
                request.setAttribute("order", completeOrder);  
                request.setAttribute("child", cId);

                 } catch (IllegalArgumentException e){
                        request.setAttribute("error", Arrays.toString(e.getStackTrace()));
                        request.getRequestDispatcher("Payment.jsp").forward(request, response); 
                     }
       }
       
       else {
           
           try {
               List<ITicket> ticketz = new LinkedList();
               List<Integer> quantity = new LinkedList();
               List<String> newTicketList = new LinkedList();
               for (List<ITicket> t : ticketList)
               {
                   ITicket ticket = t.get(0);
                   int qty = t.size();
                   
                   ticketz.add(ticket);
                   quantity.add(qty);
                   newTicketList.add(ticket.getType() + "  x " + qty);
               }
               
               IOrder order = WebWrapper.getInstance().makeCustomerBooking(ticketz, quantity);
               request.setAttribute("order", order);
               request.setAttribute("ticketList", newTicketList);
           }
           
           catch(IllegalArgumentException e)
           {
               
           }
           
       }
      
        session.removeAttribute("tickets");
        request.getRequestDispatcher("WEB-INF/orderConfirm.jsp").forward(request, response);
       
        
       
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
