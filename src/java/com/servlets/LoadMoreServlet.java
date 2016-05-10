/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import events.IChildEvent;
import events.IParentEvent;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import wrappers.UserWrapper;

/**
 *
 * @author Ruth
 */
public class LoadMoreServlet extends HttpServlet {

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
            out.println("<title>Servlet LoadMoreServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoadMoreServlet at " + request.getContextPath() + "</h1>");
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

        /*List<IParentEvent> loadMoreList = UserWrapper.getInstance().loadMoreParentEvents();
        
        ArrayList<Integer> childEventAmount = new ArrayList();
        for (IParentEvent parent: loadMoreList)
        {
            List<IChildEvent> child = parent.getChildEvents();
            int size = child.size();
            childEventAmount.add(size);
        }
        
        request.setAttribute("eventList", loadMoreList);
        request.setAttribute("childAmount", childEventAmount);
        
        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/index.jsp");//
        view.forward(request, response);*/
        System.out.println("Starting the request despatcher...");
        List<IParentEvent> event = UserWrapper.getInstance().loadMoreParentEvents();
        request.setAttribute("moreEvents", event);
        response.setContentType("text/plain");
        PrintWriter writer = response.getWriter();
        String template = "<div class=\"col-lg-2  newEventGallery\"> \n"
                + "            <a href=\"event.do?eventdata=theId\">\n"
                + "                <img class=\"eventImage\" src=\"Image?type=event&id=theId\">\n"
                + "                 <div class=\"underImageInfo\">\n"
                + "                     <div class=\"boxName\"> theName </div> \n"
                + "\n"
                + "                <div class=\"boxChildren\">  </div>\n"
                + "                </div>\n"
                + "            </a>  \n"
                + "        </div>";
        for (IParentEvent currEvent : event) {
            String output = template;
            Integer id = currEvent.getID();
            String name = currEvent.getName();
            output = output.replaceAll("theId", id.toString());
            output = output.replaceAll("theName", name);
            writer.println(output);
        }
        //writer.println("<div>Test div from servlet</div>");
        //request.getRequestDispatcher("/WEB-INF/includes/moreDetailsTab.jsp").forward(request, response);

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
