/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import events.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utilities.ImageScale;
import wrappers.UserWrapper;

/**
 *
 * @author Ruth
 */
@WebServlet(name = "ImageServlet", urlPatterns = {"/Image"})
public class ImageServlet extends HttpServlet {

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
     * 
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //get the current artist and its its social id
        String type = request.getParameter("type");
        String id = request.getParameter("id");
        ISocial soc = null;
        
        if (type.equals("event"))
            soc = UserWrapper.getInstance().getParentEvent(Integer.parseInt(id)).getSocialMedia();
        else if(type.equals("artist"))
            soc = UserWrapper.getInstance().getArtist(Integer.parseInt(id)).getSocialMedia();
        else if(type.equals("venue")) 
            soc = UserWrapper.getInstance().getVenue(Integer.parseInt(id)).getSocialMedia();
        
        BufferedImage image;
        if ("large".equals(request.getParameter("image")))
        {
            image = soc.getImage(0);
            image = ImageScale.resize(image, 400, 400);
            if (image != null)
                image=soc.getImage(3);
        }
        else
            image = soc.getImage(0);
          
            
            ByteArrayOutputStream byteStream = new ByteArrayOutputStream();
            ImageIO.write(image, "jpg", byteStream);
            byte[] bytes = byteStream.toByteArray();
            int contentLength = byteStream.size();
           
            response.setContentType("image/jpg");
            response.setContentLength(contentLength);
            OutputStream stream = response.getOutputStream();
            stream.write(bytes);
           // ImageIO.write(image, "jpeg", stream);
            
        
      
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
