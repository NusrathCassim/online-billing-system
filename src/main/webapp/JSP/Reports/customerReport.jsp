<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Reports</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Comic+Neue:wght@700&family=Quicksand&display=swap');

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
    <h2>Customer Reports</h2>
    <table>
        <thead>
            <tr>
                <th>Customer ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="cust" items="${customers}">
                <tr>
                    <td>${cust.id}</td>
                    <td>${cust.name}</td>
                    <td>${cust.email}</td>
                    <td>${cust.phone}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
