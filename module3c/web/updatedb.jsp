<%-- 
    Document   : updatedb
    Created on : 31 Jul, 2024, 11:50:29 AM
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
         <sql:update dataSource="${dbsource}" var="count">
             UPDATE new_table SET PNAME = ?, QUANTITY=? WHERE PID='${param.PID}'
             <sql:param value="${param.PNAME}"/>
             <sql:param value="${param.QUANTITY}"/>
         </sql:update>
             <c:if test="${count>=1}">
                 <font size='5' color='green'>Congrtulations!!! Data Updated Succesfully 
             </c:if>
    </body>
</html>
