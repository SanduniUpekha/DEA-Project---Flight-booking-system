/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Flight;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dhanu
 */
public class ReserveFlightServlet extends HttpServlet {

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
            out.println("<title>Servlet ReserveFlightServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReserveFlightServlet at " + request.getContextPath() + "</h1>");
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
        
        HttpSession httpSession = request.getSession();
        
        Cookie cookies[] = request.getCookies();
            int sessionId = 0;

            for (Cookie c : cookies) {
                if (c.getName().equals("session_id")) {
                    sessionId = Integer.parseInt(c.getValue());
                }
            }
        
        int phone = Integer.parseInt(request.getParameter("phone"));
        String address = request.getParameter("address");
        String from = httpSession.getAttribute("from").toString();
        String to = httpSession.getAttribute("to").toString();
        String ticket_class = httpSession.getAttribute("ticket_class").toString();
        String flight_type = httpSession.getAttribute("flight_type").toString();
        String day = httpSession.getAttribute("day").toString();
        String flight_time = httpSession.getAttribute("flight_time").toString();
        String flight_date = httpSession.getAttribute("flight_date").toString();
        
        User user = new User();
        Flight flight = new Flight();
        FlightManage flightManage = new FlightManage();
        
        user.setPhone(phone);
        user.setAddress(address);
        user.setSessionId(sessionId);
        flight.setFrom(from);
        flight.setTo(to);
        flight.setTicket_class(ticket_class);
        flight.setFlight_type(flight_type);
        flight.setDay(day);
        flight.setFlight_time(flight_time);
        flight.setFlight_date(flight_date);
        
        if (flightManage.reservationInsert(flight, user) == 0) {
            response.sendRedirect("reservation.jsp");
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
