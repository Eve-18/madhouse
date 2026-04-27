package controlador;

import modelo.Conexion;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/FechaServlet")
public class FechaServlet extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String barbero = request.getParameter("barbero");
        String fecha = request.getParameter("fecha");
        String servicio = request.getParameter("servicio");
        String precio = request.getParameter("precio");

        if (fecha == null || fecha.isEmpty()) {
            fecha = java.time.LocalDate.now().toString();
        }

        List<String> horasOcupadas = new ArrayList<>();

        try (Connection con = Conexion.getConexion()) {

            String sql = "SELECT hora FROM reservas WHERE barbero=? AND fecha=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, barbero);
            ps.setString(2, fecha);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                horasOcupadas.add(rs.getString("hora"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

       
        request.setAttribute("barbero", barbero);
        request.setAttribute("servicio", servicio);
        request.setAttribute("precio", precio);
        request.setAttribute("fechaActual", fecha);
        request.setAttribute("horasOcupadas", horasOcupadas);

        request.getRequestDispatcher("fecha.jsp").forward(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String correo = (String) session.getAttribute("correo");

        String servicio = request.getParameter("servicio");
        String barbero = request.getParameter("barbero");
        String precio = request.getParameter("precio");
        String fecha = request.getParameter("fecha");
        String hora = request.getParameter("hora");

        try (Connection con = Conexion.getConexion()) {

    
            String check = "SELECT * FROM reservas WHERE barbero=? AND fecha=? AND hora=?";
            PreparedStatement psCheck = con.prepareStatement(check);
            psCheck.setString(1, barbero);
            psCheck.setString(2, fecha);
            psCheck.setString(3, hora);

            ResultSet rs = psCheck.executeQuery();

            if (rs.next()) {
                request.setAttribute("error", "Esa hora ya está ocupada ");
                request.setAttribute("barbero", barbero);
                request.setAttribute("servicio", servicio);
                request.setAttribute("precio", precio);
                request.getRequestDispatcher("fecha.jsp").forward(request, response);
                return;
            }

            
            String sql = "INSERT INTO reservas (correo, servicio, precio, barbero, fecha, hora) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, correo);
            ps.setString(2, servicio);
            ps.setInt(3, Integer.parseInt(precio));
            ps.setString(4, barbero);
            ps.setString(5, fecha);
            ps.setString(6, hora);

            ps.executeUpdate();

            
            request.setAttribute("servicio", servicio);
            request.setAttribute("barbero", barbero);
            request.setAttribute("precio", precio);
            request.setAttribute("fecha", fecha);
            request.setAttribute("hora", hora);

            request.getRequestDispatcher("confirmacion.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("fecha.jsp");
        }
    }
}