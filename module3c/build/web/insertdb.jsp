<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql"%>
<%@page import="java.io.*, java.util.*, java.sql.*" %> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP page</title>
    </head>
    <body>
        <c:if test="${empty param.id or empty param.name or empty param.qty}">
            <c:redirect url="insert.jsp">
                <c:param name="errMsg" value="Please Enter Product Details" />
            </c:redirect>
        </c:if>

        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/test" user="root" password="root"/>
        
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO new_table (PID, PNAME, QUANTITY) VALUES (?, ?, ?);
            <sql:param value="${param.id}" />
            <sql:param value="${param.name}"/>
            <sql:param value="${param.qty}"/>
        </sql:update>
        
        <c:if test="${result >= 1}">
            <font size="5" color="green">Congrats! Data inserted </font>
            <c:redirect url="insert.jsp">
                <c:param name="susMsg" value="data inserted!" />
            </c:redirect>
        </c:if>
    </body>
</html>
