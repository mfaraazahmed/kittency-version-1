package com.uniquedeveloper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class sell
 */
@WebServlet("/sell")
public class sell extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cat_name = request.getParameter("cat-name");
		String cat_breed = request.getParameter("breed");
		int cat_age = Integer.parseInt(request.getParameter("age"));
		int price = Integer.parseInt(request.getParameter("price"));
		String description = request.getParameter("description");
		int id = 0;
		
		RequestDispatcher dispatcher = null;
		HttpSession session = request.getSession();
		
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
		  for (Cookie cookie : cookies) {
		    if (cookie.getName().equals("logged_in_user_id")) {
		      id = Integer.parseInt(cookie.getValue());
		      session.setAttribute("id", id);
		      break;
		    }
		  }
		}
		
		
		
		Connection con = null;
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoSignUp?useSSL=false","root","Faraaz123$");
			
			PreparedStatement pst = con.prepareStatement("insert into cats(cat_name, cat_breed, cat_age, id, price, description) values(?,?,?,?,?,?)");
			pst.setString(1, cat_name);
			pst.setString(2, cat_breed);
			pst.setInt(3, cat_age);
			pst.setInt(4, id);
			pst.setInt(5, price);
			pst.setString(6, description);
			
			int rowCount = pst.executeUpdate();
			
			dispatcher = request.getRequestDispatcher("sell.jsp");
			
			if(rowCount > 0) {
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "failed");
			}
			
			
			dispatcher.forward(request, response);
					
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}
