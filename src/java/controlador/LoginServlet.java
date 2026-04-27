package controlador;

import modelo.Conexion;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String correo = request.getParameter("correo");
        String password = request.getParameter("password");

        try {

            Connection con = Conexion.getConexion();

            if (con == null) {
                System.out.println("ERROR: No conecta a la BD ");
                response.sendRedirect("login.jsp?error=db");
                return;
            }

            String sql = "SELECT * FROM usuarios WHERE correo=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, correo);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

               
                HttpSession session = request.getSession();
                session.setAttribute("correo", correo);

                System.out.println("LOGIN EXITOSO");

                response.sendRedirect("servicios.jsp");

            } else {

                System.out.println("DATOS INCORRECTOS");

                response.sendRedirect("login.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=2");
        }
    }
}