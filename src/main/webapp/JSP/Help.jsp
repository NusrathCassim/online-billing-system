<%-- 
    Document   : Help
    Created on : Aug 18, 2025, 12:20:27 AM
    Author     : Nusrath
--%>

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
    <title>Pahana Edu - Help Center</title>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka&family=Patrick+Hand&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Fredoka', sans-serif;
            background-color: #f9f6f2;
            margin: 0;
            padding: 2rem;
        }

        .help-container {
            max-width: 900px;
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

        .faq-section {
            margin-top: 2rem;
        }

        .faq {
            background: #fff;
            border-radius: 18px;
            padding: 1.2rem 1.6rem;
            margin-bottom: 1rem;
            box-shadow: 0 6px 16px rgba(0,0,0,0.05);
        }

        .faq h3 {
            font-family: 'Patrick Hand', cursive;
            font-size: 1.3rem;
            color: #333;
            margin-bottom: 0.5rem;
        }

        .faq p {
            font-size: 0.95rem;
            color: #555;
            line-height: 1.5;
        }

        .contact {
            margin-top: 2rem;
            background: #fffcf2;
            border: 2px dashed #ffcc00;
            border-radius: 18px;
            padding: 1.5rem;
            text-align: center;
        }

        .contact h2 {
            font-family: 'Patrick Hand', cursive;
            color: #222;
            margin-bottom: 1rem;
        }

        .contact p {
            font-size: 1rem;
            color: #444;
        }

        .back-btn {
            display: inline-block;
            margin-top: 1.5rem;
            background: #ffcc00;
            color: #000;
            padding: 10px 18px;
            border-radius: 12px;
            font-weight: bold;
            text-decoration: none;
            box-shadow: 3px 3px 0px #000;
        }

        .back-btn:hover {
            background: #ffd633;
        }
    </style>
</head>
<body>
    <div class="help-container">
        <div class="header">
            <h1>Help Center</h1>
            <a href="${pageContext.request.contextPath}/JSP/mainDashboard.jsp" class="back-btn">← Back to Dashboard</a>
       
        </div>

        <div class="faq-section">
            <div class="faq">
                <h3>How do I manage customers?</h3>
                <p>Go to the <strong>Manage Customers</strong> section from your dashboard. You can add, update, or delete customer details.</p>
            </div>

            <div class="faq">
                <h3>How do I create a bill?</h3>
                <p>Open the <strong>Billing</strong> section. Select a customer, add items, and the system will automatically calculate totals for you.</p>
            </div>

            <div class="faq">
                <h3>Where can I see reports?</h3>
                <p>Only <strong>Admin</strong> users can access reports. Navigate to the <strong>Reports</strong> card on the dashboard.</p>
            </div>

            <div class="faq">
                <h3>I forgot my password. What should I do?</h3>
                <p>Please contact your system administrator to reset your password securely.</p>
            </div>
        </div>

        <div class="contact">
            <h2>Need More Help?</h2>
            <p>Email us at <strong>support@pahanaedu.lk</strong></p>
            <p>Or call our support team at <strong>+94 77 123 4567</strong></p>
        </div>
    </div>
</body>
</html>
