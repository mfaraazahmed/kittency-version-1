package com.uniquedeveloper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uemail = request.getParameter("username");
		String upass = request.getParameter("password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		 try {
			 Class.forName("com.mysql.cj.jdbc.Driver");
			 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoSignUp?useSSL=false","root","Faraaz123$");
			 PreparedStatement pst = con.prepareStatement("select * from users where uemail = ? and upass = ?");
			 
			 pst.setString(1, uemail);
			 pst.setString(2, upass);
			 
			 ResultSet rs = pst.executeQuery();
			 if(rs.next()) {
				 session.setAttribute("name", rs.getString("uname"));
				 int user_id = rs.getInt("id");
				 String user_id_string = Integer.toString(user_id);
				 Cookie cookie = new Cookie("logged_in_user_id", user_id_string);
				 response.addCookie(cookie);
				 
				// increment login count
                 incrementLoginCount();

				 dispatcher = request.getRequestDispatcher("index.jsp");
			 } else {
				 request.setAttribute("status", "failed");
				 dispatcher = request.getRequestDispatcher("login.jsp");
			 }
			 dispatcher.forward(request, response);
		 } catch(Exception e) {
			 e.printStackTrace();
		 }
	}


	public void incrementLoginCount() throws SQLException {
	    Connection con = null;
	    PreparedStatement stmt = null;
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoSignUp?useSSL=false","root","Faraaz123$");
	        String query = "UPDATE login_count SET count = count + 1";
	        stmt = con.prepareStatement(query);
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

