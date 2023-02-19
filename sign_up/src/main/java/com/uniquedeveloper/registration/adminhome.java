//package com.uniquedeveloper.registration;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet("/adminhome")
//public class adminhome extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int totalUsers = 0;
//        int totalCats = 0;
//        int totalProducts = 0;
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection con = DriverManager.getConnection(
//            		"jdbc:mysql://localhost:3306/demoSignUp?useSSL=false","root","Faraaz123$");
//            PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM users");
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                totalUsers = rs.getInt(1);
//            }
//            ps = con.prepareStatement("SELECT COUNT(*) FROM cats");
//            rs = ps.executeQuery();
//            if (rs.next()) {
//                totalCats = rs.getInt(1);
//            }
//            ps = con.prepareStatement("SELECT COUNT(*) FROM products");
//            rs = ps.executeQuery();
//            if (rs.next()) {
//                totalProducts = rs.getInt(1);
//            }
//            con.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        request.setAttribute("totalUsers", totalUsers);
//        request.setAttribute("totalCats", totalCats);
//        request.setAttribute("totalProducts", totalProducts);
//        request.getRequestDispatcher("adminhome.jsp").forward(request, response);
//    }
//}
