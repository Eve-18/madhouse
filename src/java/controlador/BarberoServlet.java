

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/BarberoServlet")
public class BarberoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("servicios.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String servicio = request.getParameter("servicio");
        String precio = request.getParameter("precio");
        String barbero = request.getParameter("barbero");

        
        request.setAttribute("servicio", servicio);
        request.setAttribute("precio", precio);
        request.setAttribute("barbero", barbero);

        request.getRequestDispatcher("fecha.jsp").forward(request, response);
    }
}