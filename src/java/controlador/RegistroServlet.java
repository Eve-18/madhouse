/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controlador;

import modelo.Conexion;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegistroServlet")
public class RegistroServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("registro.jsp"); 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String nombre = request.getParameter("nombre");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        String confirmar = request.getParameter("confirmar");

        
        if (password == null || !password.equals(confirmar)) {
            request.setAttribute("error", "Las contraseñas no coinciden");
            request.getRequestDispatcher("registro.jsp").forward(request, response);
            return; 
        }

        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = Conexion.getConexion();

            if (con == null) {
                System.out.println("ERROR: No hay conexión a la BD");
                response.sendRedirect("registro.jsp?error=db");
                return;
            }

           
            String sql = "INSERT INTO usuarios (nombre, telefono, correo, password) VALUES ( ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);

         ps.setString(1, nombre);
         ps.setString(2, telefono);
         ps.setString(3, correo);
         ps.setString(4, password);
         
            int resultado = ps.executeUpdate();

            if (resultado > 0) {
                System.out.println("USUARIO GUARDADO EN MADHOUSE");
                response.sendRedirect("login.jsp?registro=exito");
            } else {
                System.out.println("NO SE INSERTÓ EL REGISTRO ");
                response.sendRedirect("registro.jsp?error=ins");
            }

        } catch (SQLException e) {
            System.out.println("Error de SQL: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("registro.jsp");
        } catch (Exception e) {
            System.out.println("Error general: " + e.getMessage());
            response.sendRedirect("registro.jsp");
        } finally {
          
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                System.out.println("Error al cerrar: " + ex.getMessage());
            }
        }
    }
}