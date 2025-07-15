<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javaClasses.userClass" %>
<%
    userClass user = (userClass) session.getAttribute("loggedUser");
    if (user == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pahana Edu - Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka&family=Patrick+Hand&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Fredoka', sans-serif;
            background-color: #f9f6f2;
            margin: 0;
            padding: 2rem;
        }

        .dashboard-container {
            max-width: 1100px;
            margin: auto;
        }

        .header {
            background: #fff;
            padding: 1.5rem 2rem;
            border-radius: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
        }

        .header h1 {
            font-family: 'Patrick Hand', cursive;
            font-size: 2rem;
            color: #222;
        }

        .logout-btn {
            background-color: #ffcc00;
            border: none;
            color: #000;
            font-weight: bold;
            padding: 0.7rem 1.2rem;
            border-radius: 12px;
            box-shadow: 4px 4px 0px #000;
            cursor: pointer;
        }

        .logout-btn:hover {
            background-color: #ffd633;
        }

        .welcome-msg {
            margin: 2rem 0 1rem;
            font-size: 1.4rem;
            color: #444;
        }

        .card-section {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .card {
            background: #ffffff;
            padding: 20px;
            width: 240px;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.07);
            text-align: center;
            transition: transform 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h3 {
            font-family: 'Patrick Hand', cursive;
            color: #222;
            font-size: 1.3rem;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 0.9rem;
            color: #555;
            margin-bottom: 12px;
        }

        .card a {
            background-color: #ffcc00;
            color: #000;
            padding: 8px 14px;
            border-radius: 10px;
            font-weight: bold;
            text-decoration: none;
            box-shadow: 3px 3px 0px #000;
            display: inline-block;
        }

        .card a:hover {
            background-color: #ffd633;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">

        <div class="header">
            <h1>Pahana Edu - Admin Dashboard</h1>
            <form action="../LogoutServlet" method="post">
                <button type="submit" class="logout-btn">Logout</button>
            </form>
        </div>

        <div class="welcome-msg">
            Welcome, <strong><%= user.getUsername() %></strong>! You are logged in as <%= user.getRole() %>.
        </div>

        <div class="card-section">
            <div class="card">
                <h3>Manage Customers</h3>
                <p>Add, update, and delete customer records.</p>
                <a href="${pageContext.request.contextPath}/CustomerServlet">Open</a>

            </div>
            <div class="card">
                <h3>Manage Items</h3>
                <p>Handle item catalog and pricing.</p>
                <a href="items.jsp">Open</a>
            </div>
            <div class="card">
                <h3>Billing</h3>
                <p>Generate and print bills easily.</p>
                <a href="billing.jsp">Open</a>
            </div>
            <div class="card">
                <h3>Reports</h3>
                <p>View transaction history and analytics.</p>
                <a href="reports.jsp">Open</a>
            </div>
        </div>

    </div>
</body>
</html>
