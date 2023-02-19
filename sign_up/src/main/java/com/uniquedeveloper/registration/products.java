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
 * Servlet implementation class products
 */
@WebServlet("/products")
public class products extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pname = request.getParameter("pname");
		String pexp = request.getParameter("pexp");
		String pmfc = request.getParameter("pmfc");
		int pqty = 0;
		try {
		    pqty = Integer.parseInt(request.getParameter("pqty"));
		} catch (NumberFormatException e) {
		    pqty = 0;
		}

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
			
			PreparedStatement pst = con.prepareStatement("insert into products(pname, pexp, pmfc, id, pqty) values(?,?,?,?,?)");
			pst.setString(1, pname);
			pst.setString(2, pexp);
			pst.setString(3, pmfc);
			pst.setInt(4, id);
			pst.setInt(5, pqty);
			
			int rowCount = pst.executeUpdate();
			
			dispatcher = request.getRequestDispatcher("products.jsp");
			
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
