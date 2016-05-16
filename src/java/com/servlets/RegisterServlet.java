/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import people.Customer;
import people.ICustomer;
import people.IUser;
import utilities.HashString;
import utilities.Validator;
import utilities.WebWrapper;

/**
 *
 * @author Ruth
 */
public class RegisterServlet extends HttpServlet {

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
        
        
        
        
        
        String firstName = request.getParameter("firstName");
        String secondName = request.getParameter("surname");
        String address = request.getParameter("address");
        String postcode = request.getParameter("postcode");
        String userName = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirm = request.getParameter("passwordConfirm");
        
        
        
        // Check for empty inputs
        if (firstName.isEmpty() || secondName.isEmpty() || address.isEmpty() || postcode.isEmpty() 
                ||userName.isEmpty() || password.isEmpty() || passwordConfirm.isEmpty())
        {
            request.setAttribute("errorMessage", "Plese fill in all fields");
            RequestDispatcher view = request.getRequestDispatcher("/register.jsp");
            view.forward(request, response);
        }
        
        // Check for non matching passwords
        else if (!password.equals(passwordConfirm))
        {
            request.setAttribute("errorMessage", "Passwords do not match");
            RequestDispatcher view = request.getRequestDispatcher("/register.jsp");
            view.forward(request, response);
        }
        
        
        else {
            Validator v = new Validator();
            try{
                Validator.emailValidator(userName);
            }
           catch(IllegalArgumentException e){
           
                request.setAttribute("errorMessage", "Email address is already registered");
                RequestDispatcher view = request.getRequestDispatcher("/register.jsp");
                view.forward(request, response);
            }
           }
                
                try{
                IUser user = new Customer(firstName, secondName, userName, address, postcode, password);
                WebWrapper.getInstance().registerUser(user);
                request.setAttribute("username", userName);
                request.setAttribute("name", firstName);
               
                
                
                RequestDispatcher view = request.getRequestDispatcher("registerComplete.jsp");
                view.forward(request, response);
                }
                catch(Exception ex)
                {
                    request.setAttribute("errorMessage", "An undefined error has occured");
                RequestDispatcher view = request.getRequestDispatcher("/register.jsp");
                view.forward(request, response);
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
