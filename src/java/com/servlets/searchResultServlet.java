/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import events.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import wrappers.UserWrapper;
import wrappers.UserWrapper;


/**
 *
 * @author Ruth
 */
@WebServlet(name = "searchResultServlet", urlPatterns = {"/searchResult"})
public class searchResultServlet extends HttpServlet {

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
       
        String userInput = request.getParameter("user_search");
        
        if (userInput.equals(""))
        {
            response.sendRedirect(request.getHeader("referer"));
         
        }
        else {
        
        List<IArtist> artistList = UserWrapper.getInstance().searchArtists(userInput);
        List<IVenue> venueList = UserWrapper.getInstance().searchVenues(userInput);
        List<IParentEvent> eventList = UserWrapper.getInstance().searchParentEvents(userInput);
       
        // Retrieve list of ArrayLists which match the users search
       
        // Seperate into lists of appropriate objects
        
        request.setAttribute("user_search", userInput);
        request.setAttribute("artistList", artistList);
        request.setAttribute("venueList", venueList);
        request.setAttribute("eventList", eventList);
    
        // Send re-direct to search result page
        RequestDispatcher req = request.getRequestDispatcher("/WEB-INF/searchResults.jsp");
        req.forward(request, response);
        }
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
