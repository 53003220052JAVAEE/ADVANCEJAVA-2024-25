<%-- 
    Document   : update.jsp
    Created on : 31 Jul, 2024, 11:50:14 AM
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
    </head>
    <body>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/test" user="root" password="root"/>
          <sql:query dataSource="${dbsource}" var="result">
                 SELECT * FROM new_table where PID=?
                 <sql:param value ="${param.PID}"/>
          </sql:query>
                 <form action="updatedb.jsp" method="post">
                     <table border="2" >
                         <caption>Update Product</caption>
                         <tr>
                             <th>
                                 product ID
                             </th>
                             <th>
                                 Product Name
                             </th>
                             <th>
                                 Quantity
                             </th>
                         </tr>
                         <c:forEach var="row" items="${result.rows}">
                             <tr>
                                 <td>
                                     <input type="hidden" value="${row.PID}" name="PID"/>
                                 </td>
                                 <td>
                                     <input type="text" value="${row.PNAME}" name="PNAME"/>
                                 </td>
                                 <td>
                                     <input type="text" value="${row.QUANTITY}" name="QUANTITY"/>
                                 </td>
                                 <td>
                                     <input type="submit" value="Update"/>
                                 </td>
                             </tr>
                         </c:forEach>
                     </table>
                     <a href="index.html">Go Home</a>
                 </form>
             
    </body>
</html>
