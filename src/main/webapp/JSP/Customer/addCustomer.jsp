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
    <title>Add New Customer</title>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka&family=Patrick+Hand&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Fredoka', sans-serif;
            background-color: #f9f6f2;
            padding: 2rem;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        h2 {
            font-family: 'Patrick Hand', cursive;
            font-size: 2rem;
            color: #333;
            margin-bottom: 1.5rem;
        }

        form {
            background: #fff;
            padding: 2rem 2.5rem;
            border-radius: 20px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
            width: 100%;
            max-width: 500px;
        }

        label {
            display: block;
            margin-top: 1rem;
            font-weight: bold;
            color: #444;
        }

        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 12px;
            margin-top: 0.5rem;
            border-radius: 12px;
            border: 1px solid #ccc;
            font-size: 1rem;
        }

        button {
            background-color: #ffcc00;
            color: #000;
            font-weight: bold;
            padding: 10px 18px;
            border: none;
            border-radius: 12px;
            margin-top: 1.5rem;
            box-shadow: 3px 3px 0px #000;
            cursor: pointer;
            font-family: 'Fredoka', sans-serif;
        }

        button:hover {
            background-color: #ffd633;
        }

        .back-link {
            margin-top: 1.5rem;
            text-decoration: none;
            color: #000;
            font-weight: bold;
            background-color: #ddd;
            padding: 8px 14px;
            border-radius: 10px;
            box-shadow: 2px 2px 0px #999;
            font-family: 'Fredoka', sans-serif;
        }

        .back-link:hover {
            background-color: #ccc;
        }
    </style>
</head>
<body>

    <h2>Add New Customer</h2>

    <form action="${pageContext.request.contextPath}/CustomerServlet" method="post">
        <input type="hidden" name="action" value="add" />

        <label for="name">Name</label>
        <input type="text" name="name" id="name" required>

        <label for="email">Email</label>
        <input type="email" name="email" id="email">

        <label for="phone">Phone</label>
        <input type="text" name="phone" id="phone">

        <button type="submit">Save Customer</button>
    </form>

    <a href="${pageContext.request.contextPath}/CustomerServlet" class="back-link">← Back to Customer List</a>

</body>
</html>
