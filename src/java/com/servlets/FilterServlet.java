/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import events.IArtist;
import events.IChildEvent;
import events.IParentEvent;
import events.IVenue;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utilities.DateFilter;
import utilities.WebWrapper;

/**
 *
 * @author Ruth
 */
@WebServlet(name = "FilterServlet", urlPatterns = {"/filter.do"})
public class FilterServlet extends HttpServlet {

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
            out.println("<title>Servlet FilterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilterServlet at " + request.getContextPath() + "</h1>");
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
        
        String artist = request.getParameter("artist");
        String venue = request.getParameter("venue");
        String event = request.getParameter("event");
        String search = request.getParameter("user_search");
        String dateString = request.getParameter("dater");
        
        request.setAttribute("artist", artist);
        request.setAttribute("venue", venue);
        request.setAttribute("event", event);
        request.setAttribute("user_search", search);
        request.setAttribute("date", dateString);
        
        
        
        DateFilter df = new DateFilter();
        Date date = df.getDate(dateString);
       if (artist != null){
            if (artist.equals("artist")) {
                 List<IArtist> artists = WebWrapper.getInstance().searchArtists(search);
                 request.setAttribute("fArtists", artists); 
                 request.setAttribute("displayArtist", "true");
                 //Child events amounts
                 List<Integer> childEventAmount = new ArrayList();
                  for (IArtist a: artists)
                {
                    List<IChildEvent> child = a.getChildEvents();
                    int size = child.size();
                    childEventAmount.add(size);
                 }
                  request.setAttribute("artistChildren", childEventAmount);
             }
       }
       
       if (venue != null){
            if (venue.equals("venue")){
                 List<IVenue> venues = WebWrapper.getInstance().searchVenues(search);
                 request.setAttribute("fVenues", venues);
                 request.setAttribute("displayVenue", "true");
                 List<Integer> childEventAmountVenue = new ArrayList();
                  for (IVenue v: venues)
                    {
                        List<IChildEvent> child = v.getChildEvents();
                        int size = child.size();
                        childEventAmountVenue.add(size);
                        request.setAttribute("venueChildren", childEventAmountVenue);
                    }
             }
       }
       

       
       
        if (event != null){
            if(event.equals("event")){
                List<IParentEvent> events = new LinkedList();
                for (IParentEvent e : WebWrapper.getInstance().searchParentEvents(search))
                {
                    if (e.getChildEvents().size() > 0)
                        {
                            IChildEvent child = e.getChildEvents().get(0);
                            if (child.getStartDateTime().after(date))
                                events.add(e);
                            
                            List<IChildEvent> chi = e.getChildEvents();
                            List<Integer> childEventAmountEvent = new ArrayList();
                            int size = chi.size();
                             childEventAmountEvent.add(size);
                            request.setAttribute("eventChildren", childEventAmountEvent);
                            
                        }
                }
                request.setAttribute("fEvents", events);
                request.setAttribute("displayEvent", "true");
            }
        }
        
       
       RequestDispatcher view = request.getRequestDispatcher("WEB-INF/FilteredSearchResults.jsp");
        view.forward(request, response);
         
       
        
        
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
