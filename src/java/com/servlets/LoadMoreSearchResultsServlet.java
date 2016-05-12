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
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import wrappers.UserWrapper;

/**
 *
 * @author nickrudden
 */
@WebServlet(name = "LoadMoreSearchResultsServlet", urlPatterns = {"/loadMoreSearch.do"})
public class LoadMoreSearchResultsServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoadMoreSearchResultsServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoadMoreSearchResultsServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        request.setAttribute("user_search", "");
        UserWrapper instance = UserWrapper.getInstance();
        List<IParentEvent> events = instance.loadMoreParentEvents();
        List<IVenue> venues = instance.loadMoreVenues();
        List<IArtist> artists = instance.loadMoreArtists();
        
        String templateArtist = "";
        
        String templateVenue = "";
        
        String templateEvent = " <a href=\"event.do?eventdata=theId\">\n"
                + "                                <div class=\"col-lg-3 newEventGallery\" id=\"${loop.index}\"> \n"
                + "                                     <img class=\"eventImage\" src=\"Image?type=event&id=theId\">\n"
                + "                 \n"
                + "                                     <div class=\"underImageInfo\">\n"
                + "                                        <div class=\"boxName\"> theName </div> \n"
                + "\n"
                + "                                        <div class=\"boxChildren\"> \n"
                + "                                          childShows Shows</div>\n"
                + "                                    </div>\n"
                + "                                     \n"
                + "                                    \n"
                + "                                </div>\n"
                + "                            </a>";

            PrintWriter writer = response.getWriter();
            response.setContentType("text/plain");
            for (IParentEvent currEvent : events) {
            
            String output = templateEvent;
            Integer children = currEvent.getChildEvents().size();
            Integer id = currEvent.getID();
            String name = currEvent.getName();
            
            output = output.replaceAll("childShows", children.toString());
            output = output.replaceAll("theId", id.toString());
            output = output.replaceAll("theName", name);
             
            writer.println(output);
        }
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
