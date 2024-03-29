package com.servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import events.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utilities.ChildToParent;

import utilities.WebWrapper;

/**
 *
 * @author Ruth
 */
@WebServlet(urlPatterns = {"/artist"})
public class ArtistServlet extends HttpServlet {

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
       
       // Get the id of the required artist
       String artistIndex = request.getParameter("artistdata");
       int artistIntIndex = Integer.parseInt(artistIndex);
       
       IArtist displayArtist = WebWrapper.getInstance().getArtist(artistIntIndex);
        Boolean currentEvent = false;
       List<IChildEvent> children = displayArtist.getChildEvents();
        if (children.size() >= 1)
        {
            currentEvent = true;
           /* ChildToParent ctp = new ChildToParent(displayArtist);
            List<IParentEvent> pEvents = ctp.getParents();
            request.setAttribute("parentEvents", pEvents);*/
        }
       
       
       try {
        String facebook = displayArtist.getFacebook();
       String twitter = displayArtist.getTwitter();
        request.setAttribute("twitter", twitter);
       request.setAttribute("facebook", facebook);
       }
       catch(NullPointerException ex){
            request.setAttribute("childList", children);
       request.setAttribute("multiple", currentEvent);
       request.setAttribute("currentArtist", displayArtist);
      
        
       RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/artist.jsp");
       view.forward(request, response);
       }
       
      
       request.setAttribute("childList", children);
       request.setAttribute("multiple", currentEvent);
       request.setAttribute("currentArtist", displayArtist);
      
        
       RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/artist.jsp");
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
