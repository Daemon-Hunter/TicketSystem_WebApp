/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import people.IUser;
import wrappers.UserWrapper;

/**
 *
 * @author Ruth
 */
public class SignIn extends HttpServlet {

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
        
        String username = request.getParameter("usernameSignIn");
        String password = request.getParameter("passwordSignIn");
        
        try {
            Boolean loggedIn = UserWrapper.getInstance().loginUser(username, password);
            if (loggedIn){
                IUser currentUser = UserWrapper.getInstance().getUser();
                HttpSession session = request.getSession();
                session.setMaxInactiveInterval(600);
                session.setAttribute("currentUser", currentUser);
                session.setAttribute("loggedIn", loggedIn);
                request.getRequestDispatcher("WEB-INF/MyJunction.jsp").forward(request, response);
            }
            else
            {
                 request.setAttribute("loginFail", "Invalid username or password");
                 request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
        catch(IllegalArgumentException ex)
        {
            request.setAttribute("loginFail", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     * 
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
