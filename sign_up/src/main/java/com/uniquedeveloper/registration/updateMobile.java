package com.uniquedeveloper.registration;

import java.io.IOException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateMobile")
public class updateMobile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String umobile = request.getParameter("umobile");

        try {
            updateMobile(id, umobile);
            response.sendRedirect("adminhome.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateMobile(int id, String umobile) throws SQLException {
        Connection con = null;
        PreparedStatement stmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoSignUp?useSSL=false","root","Faraaz123$");
            String query = "UPDATE users SET umobile = ? WHERE id = ?";
            stmt = con.prepareStatement(query);
            stmt.setString(1, umobile);
            stmt.setInt(2, id);
            stmt.executeUpdate();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
}

