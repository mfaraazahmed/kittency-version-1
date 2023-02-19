<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/";
    String dbName = "demoSignUp";
    String driver = "com.mysql.cj.jdbc.Driver";
    String userName = "root";
    String password ="Faraaz123$";
    Connection con = null;
    try{
        Class.forName(driver).newInstance();
        con = DriverManager.getConnection(url+dbName,userName,password);

        //Retrieve the id of the user to be deleted
        int cat_id = Integer.parseInt(request.getParameter("cat_id"));

        //Create a statement
        Statement st = con.createStatement();
        
        //validating the id
        if(cat_id>0){
            
            //Execute the delete statement
            int rowsAffected = st.executeUpdate("DELETE FROM cats WHERE cat_id = " + cat_id);
            
            if(rowsAffected > 0) {
                //redirect to mainPage.jsp
                response.sendRedirect("admincats.jsp");
            } else {
                out.println("Error: No record found with cat_id = " + cat_id);
            }
        }else{
            out.println("Invalid id provided");
        }
    } catch(SQLException se){
        //handle errors for JDBC
        se.printStackTrace();
    }catch(Exception e){
        //handle errors for Class.forName
        e.printStackTrace();
    }finally{
        //finally block used to close resources
        try{
            if(con!=null)
            con.close();
        }catch(SQLException se){
            se.printStackTrace();
        }//end finally try
    }
%>


</body>
</html>