<%-- 
    Document   : billReport
    Created on : Aug 17, 2025, 9:54:54 PM
    Author     : Nusrath
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Bill Reports</title>
    <style>
        
        body {
            font-family: 'Quicksand', sans-serif;
            background: #faf7f2;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        h2 {
            font-family: 'Comic Neue', cursive;
            margin-bottom: 15px;
        }
        .back-link {
            display: inline-block;
            margin-bottom: 20px;
            text-decoration: none;
            font-weight: bold;
            color: #333;
            background: #ffdd00;
            padding: 6px 14px;
            border-radius: 10px;
            box-shadow: 3px 3px 0 #000;
            transition: transform 0.2s;
        }
        .back-link:hover { transform: translateY(-2px); }
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background: #fff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }
        th, td { padding: 12px; text-align: center; }
        th {
            background: #fff7d6;
            font-family: 'Comic Neue', cursive;
            font-size: 1rem;
        }
        tr:nth-child(even) { background: #fdfdfd; }
    </style>
</head>
<body>
        <a href="${pageContext.request.contextPath}/JSP/Reports/report.jsp" class="back-link">← Back</a>

    <h2>Bill Reports</h2>
    <table>
        <thead>
            <tr>
                <th>Bill ID</th>
                <th>Customer ID</th>
                <th>Bill Date</th>
                <th>Total Amount</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="bill" items="${reportSummaries}">
                <tr>
                    <td>${bill.id}</td>
                    <td>${bill.customerId}</td>
                    <td>${bill.billDate}</td>
                    <td>${bill.totalAmount}</td>

                </tr>
            </c:forEach>
        </tbody>
    </table>
    <!--<a href="${pageContext.request.contextPath}/JSP/Reports/report.jsp">⬅ Back</a>-->
    <!--<a href="${pageContext.request.contextPath}/JSP/mainDashboard.jsp" class="back-link">← Back to Dashboard</a>-->
</body>
</html>
