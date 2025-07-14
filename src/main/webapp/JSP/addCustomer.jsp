<%-- 
    Document   : addCustomer
    Created on : Jul 13, 2025, 10:39:59 AM
    Author     : Nusrath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Add New Customer</h2>
           <form action="${pageContext.request.contextPath}/CustomerServlet" method="post">
            <input type="hidden" name="action" value="add" />
            Name: <input type="text" name="name" required><br><br>
            Email: <input type="email" name="email"><br><br>
            Phone: <input type="text" name="phone"><br><br>
            <button type="submit">Save Customer</button>
        </form>
        <a href="CustomerList.jsp">Back to Customer List</a>
    </body>
</html>
