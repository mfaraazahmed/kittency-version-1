package com.uniquedeveloper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.jdbc.CallableStatement;

/**
 * Servlet implementation class adminlogin
 */
@WebServlet("/adminlogin")
public class adminlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String admin_name = request.getParameter("admin_name");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		 try {
			 Class.forName("com.mysql.cj.jdbc.Driver");
			 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoSignUp?useSSL=false","root","Faraaz123$");
			 java.sql.CallableStatement cstmt = con.prepareCall("{CALL admin_login(?,?)}");
			 cstmt.setString(1, admin_name);
			 cstmt.setString(2, password);
			 ResultSet rs = cstmt.executeQuery();

			 if(rs.next()) {
			        int admin_id = rs.getInt(1);
			        session.setAttribute("admin_id", admin_id);
			        dispatcher = request.getRequestDispatcher("adminhome.jsp");
			    } else {
			        request.setAttribute("status", "failed");
			        dispatcher = request.getRequestDispatcher("adminhome.jsp");
			    }
			 dispatcher.forward(request, response);
		 } catch(Exception e) {
			 e.printStackTrace();
		 }
	}
}
