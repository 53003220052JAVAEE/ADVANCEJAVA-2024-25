<%-- 
    Document   : Login
    Created on : 12 Jul, 2024, 12:40:05 PM
    Author     : Admin
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="javax.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                    
          String s1= request.getParameter(("p1"));
          String s2= request.getParameter(("p2"));
            
          
          
          try
          {
             Class.forName("com.mysql.jdbc.Driver");
             Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
             
                     PreparedStatement pst = conn.prepareStatement("select * from registration_52 where username=?");
                     pst.setString(1,s1);
                     ResultSet rs = pst.executeQuery();
                     if(rs.next())
                     {
                         //check for password
                         
                         if(rs.getString(2).equals(s2))
                         {
                             out.print("Login Succesfulll....;");
                         }
                         else
                         {
                             out.print("Wrong passworddddd....");
                             %>
                             <jsp:include page="Login.html"></jsp:include>
                             <%
                         }
                             
                     }
                     else
                     {
                         out.print("Username does not exist....");
                         %>
                         <jsp:include page="Login.html"></jsp:include>
                         <%
                     }
                     
          }
          catch(Exception e)
          {
              out.print("Exception:"+e);
          }






        %>
    </body>
</html>
