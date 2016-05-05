/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import events.IArtist;
import events.IParentEvent;
import events.IVenue;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import wrappers.UserWrapper;

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
        request.setAttribute("search", search);
        request.setAttribute("date", dateString);
        
        RequestDispatcher view = request.getRequestDispatcher("debug.jsp");
        //view.forward(request, response);
        
        DateFilter df = new DateFilter();
        Date date = df.getDate(dateString);
      
       if (artist.equals("artist")) {
            List<IArtist> artists = UserWrapper.getInstance().searchArtists(search);
            request.setAttribute("fArtists", artists);
            
            view.forward(request, response);
        }
        /*
       if (venue.equals("venue")){
            List<IVenue> venues = UserWrapper.getInstance().searchVenues(search);
            request.setAttribute("fVenues", venues);
        }
        
        if(event.equals("event")){
            List<IParentEvent> events = new LinkedList();
            for (IParentEvent e : UserWrapper.getInstance().searchParentEvents(search))
            {
                if (e.getChildEvents().get(0).getStartDateTime().after(date))
                    events.add(e);
            }
            request.setAttribute("fEvents", events);
        }
        
       
        RequestDispatcher view = request.getRequestDispatcher("/searchResult");
        view.forward(request, response);
         
        */
        
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
