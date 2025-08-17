<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reports Dashboard</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Comic+Neue:wght@700&family=Quicksand&display=swap');

        body {
            font-family: 'Quicksand', sans-serif;
            background: #faf7f2;
            margin: 0;
            padding: 0;
            color: #333;
        }

        h2 {
            text-align: center;
            margin: 30px 0 10px;
            font-family: 'Comic Neue', cursive;
            font-size: 2rem;
        }

        .back-link {
            display: inline-block;
            margin: 20px;
            text-decoration: none;
            font-weight: bold;
            color: #333;
            background: #ffdd00;
            padding: 8px 16px;
            border-radius: 10px;
            box-shadow: 3px 3px 0 #000;
            transition: transform 0.2s ease-in-out;
        }
        .back-link:hover {
            transform: translateY(-2px);
        }

        .container {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
            padding: 20px 40px;
        }

        .card {
            background: #fff;
            border-radius: 20px;
            box-shadow: 4px 6px 12px rgba(0,0,0,0.1);
            width: 270px;
            text-align: center;
            padding: 25px;
            transition: transform 0.2s ease-in-out, box-shadow 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 6px 10px 16px rgba(0,0,0,0.15);
        }

        .card h3 {
            margin-bottom: 10px;
            font-family: 'Comic Neue', cursive;
            font-size: 1.4rem;
        }

        .card p {
            font-size: 0.95rem;
            color: #555;
            margin-bottom: 20px;
        }

        .card a {
            display: inline-block;
            padding: 10px 20px;
            background: #ffdd00;
            color: #000;
            border-radius: 12px;
            text-decoration: none;
            font-weight: bold;
            box-shadow: 3px 3px 0 #000;
            transition: transform 0.2s ease-in-out;
        }

        .card a:hover {
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <a href="${pageContext.request.contextPath}/JSP/mainDashboard.jsp" class="back-link">← Back</a>
    <h2>Reports Dashboard</h2>
    <div class="container">
        <div class="card">
            <h3>Billing Reports</h3>
            <p>View all customer bills and transactions.</p>
            <a href="${pageContext.request.contextPath}/ReportServlet?type=bill">Open</a>
        </div>
        <div class="card">
            <h3>Customer Reports</h3>
            <p>See customer details and purchase history.</p>
            <a href="${pageContext.request.contextPath}/ReportServlet?type=customer">Open</a>
        </div>
        <div class="card">
            <h3>Inventory Reports</h3>
            <p>Check stock, prices, and availability.</p>
            <a href="${pageContext.request.contextPath}/ReportServlet?type=inventory">Open</a>
        </div>
    </div>
</body>
</html>
