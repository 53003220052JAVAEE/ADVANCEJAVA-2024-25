<%-- 
    Document   : Register
    Created on : 12 Jul, 2024, 12:39:50 PM
    Author     : Admin
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="javax.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String s1 = request.getParameter(("n1"));
        String s2 = request.getParameter(("n2"));
        String s3 = request.getParameter(("n3"));
        String s4 = request.getParameter(("n4"));
        String s5 = request.getParameter(("n5"));
         
        if(s2.equals(s3))
        {
            //database code
            try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement pst=con.prepareStatement("insert into registration_52 values (?,?,?,?)");
            pst.setString(1, s1);
            pst.setString(2, s2);
            pst.setString(3, s4);
            pst.setString(4, s5);
            
            
            int rows = pst.executeUpdate();
            
            
            if(rows==1)
            {
             out.print("Registration Succesfull....");
            }
            else
            {
                out.print("Registration Failed...... Try once again");
                %>
                <jsp:include page="Register.html"></jsp:include>
                <%
            }
        }
            catch(Exception e)
                    {
                     out.print("Exception shown");   
                    }
        }
            else
        {
            out.print("password mis match......Re Enter login details once again");
        %>
        <jsp:include page="Register.html"></jsp:include>
        <%
        }
        %>
    </body>
</html>
