/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Management;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dhanu
 */
public class LoginManagementServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginManagementServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginManagementServlet at " + request.getContextPath() + "</h1>");
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

        String type = request.getParameter("type");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Management management = new Management();
        StaffManagement staffManagement = new StaffManagement();

        management.setType(type);
        management.setUsername(username);
        management.setPassword(password);

        /* if (type.equals("admin")) {
            if (staffManagement.adminLogin(management) == 0) {
                int sessionId = management.getSessionID();
                Cookie cookies[] = request.getCookies();

                for (Cookie c : cookies) {
                    if (c.getName().equals("session_id")) {
                        c.setValue(sessionId + "");
                        c.setMaxAge(60 * 60);
                        response.addCookie(c);
                    } else {
                        Cookie sesId = new Cookie("session_id", sessionId + "");
                        sesId.setMaxAge(60 * 60);
                        response.addCookie(sesId);
                    }
                }

                response.sendRedirect("staffDashboard.jsp");
            }
        } else if (type.equals("staff")) {
            if (staffManagement.staffLogin(management) == 0) {
                int sessionId = management.getSessionID();
                Cookie cookies[] = request.getCookies();

                for (Cookie c : cookies) {
                    if (c.getName().equals("session_id")) {
                        c.setValue(sessionId + "");
                        c.setMaxAge(60 * 60);
                        response.addCookie(c);
                    } else {
                        Cookie sesId = new Cookie("session_id", sessionId + "");
                        sesId.setMaxAge(60 * 60);
                        response.addCookie(sesId);
                    }
                }

                response.sendRedirect("staffDashboard.jsp");
            }
        } */
        if (staffManagement.managementLogin(management) == 0) {
            int sessionId = management.getSessionID();
            Cookie cookies[] = request.getCookies();

            for (Cookie c : cookies) {
                if (c.getName().equals("session_id")) {
                    c.setValue(sessionId + "");
                    c.setMaxAge(60 * 60);
                    response.addCookie(c);
                } else {
                    Cookie sesId = new Cookie("session_id", sessionId + "");
                    sesId.setMaxAge(60 * 60);
                    response.addCookie(sesId);
                }
            }

            response.sendRedirect("staffDashboard_g1.jsp");
        } else if (staffManagement.managementLogin(management) == 1) {
            int sessionId = management.getSessionID();
            Cookie cookies[] = request.getCookies();

            for (Cookie c : cookies) {
                if (c.getName().equals("session_id")) {
                    c.setValue(sessionId + "");
                    c.setMaxAge(60 * 60);
                    response.addCookie(c);
                } else {
                    Cookie sesId = new Cookie("session_id", sessionId + "");
                    sesId.setMaxAge(60 * 60);
                    response.addCookie(sesId);
                }
            }

            response.sendRedirect("staffDashboard_g2.jsp");

        } else if (staffManagement.managementLogin(management) == 2) {
            int sessionId = management.getSessionID();
            Cookie cookies[] = request.getCookies();

            for (Cookie c : cookies) {
                if (c.getName().equals("session_id")) {
                    c.setValue(sessionId + "");
                    c.setMaxAge(60 * 60);
                    response.addCookie(c);
                } else {
                    Cookie sesId = new Cookie("session_id", sessionId + "");
                    sesId.setMaxAge(60 * 60);
                    response.addCookie(sesId);
                }
            }

            response.sendRedirect("adminDashboard.jsp");
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
