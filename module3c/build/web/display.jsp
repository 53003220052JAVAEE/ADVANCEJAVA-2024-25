<%-- 
    Document   : display
    Created on : 31 Jul, 2024, 11:51:46 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql"%>
<%@page import="java.io.*, java.util.*, java.sql.*" %> 


<!DOCTYPE html>
<html>
    
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
        <script>
            function confirmGo(m,u){
                if (confirm(m) ) {
                    window.location = u;
                }
            }
            </script>   
    </head>
    <body>
         <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/test" user="root" password="root"/>
          <sql:query dataSource="${dbsource}" var="result">
                 SELECT * FROM new_table
             </sql:query>
         <table border="3">
             <tr>
             <th> ID </th>
             <th> NAME </th>
             <th> QUANTITY </th>
             <th colspan="2">Action</th>
             </tr>
             <c:forEach var="row" items="${result.rows}">
                 <tr>
                     <td> <c:out value = "${row.PID}" /></td>
                     <td> <c:out value = "${row.PNAME}" /></td>
                     <td> <c:out value = "${row.QUANTITY}" /></td>
                     <td>
                         <a href="update.jsp?PID= <c:out value="${row.PID}"/>">Update</a> 
                     </td>
                     <td> 
                         <a href="javascript:confirmGo('Sure to delete this record?', 'deletedb.jsp?PID=<c:out value="${row.PID}" />')">Delete</a>
                     </td>
                 </tr>
             </c:forEach>
         </table>
                 <a href="index.html">Go Home</a>
    </body>
</html>
