<%-- 
    Document   : addItem
    Created on : Aug 9, 2025, 8:42:42 PM
    Author     : Nusrath
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Item</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 40px;
        }

        .form-card {
            background: #fff;
            padding: 30px;
            border-radius: 16px;
            max-width: 550px;
            margin: 0 auto;
            box-shadow: 0 6px 14px rgba(0,0,0,0.1);
            border: 1px solid #e2e8f0;
        }

        h2 {
             font-family: 'Patrick Hand', cursive;
            font-size: 2rem;
            color: #222;
        }

        label {
            font-weight: 600;
            margin-top: 15px;
            display: block;
            color: #333;
        }

        input, select {
            width: 100%;
            padding: 12px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 1rem;
            background-color: #fafafa;
            transition: border 0.3s, box-shadow 0.3s;
        }

        input:focus, select:focus {
            border-color: #004080;
            box-shadow: 0 0 5px rgba(0,64,128,0.2);
            outline: none;
            background: #fff;
        }

        button {
            margin-top: 25px;
            width: 100%;
            background: linear-gradient(135deg, #FFD700, #FFC107);
            border: none;
            padding: 14px;
            font-weight: bold;
            font-size: 1.05rem;
            cursor: pointer;
            border-radius: 10px;
            transition: transform 0.2s, background 0.3s;
            color: #003366;
        }

        button:hover {
            background: linear-gradient(135deg, #FFC107, #FFB300);
            transform: translateY(-2px);
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            text-decoration: none;
            color: #004080;
            font-weight: bold;
            font-size: 0.95rem;
            transition: color 0.3s;
        }

        .back-link:hover {
            color: #FFB300;
        }
    </style>
</head>
<body>
    <div class="form-card">
        <h2>Add New Item</h2>
        <form action="ItemServlet" method="post">
            <input type="hidden" name="action" value="add"/>

            <label for="name">Item Name</label>
            <input type="text" id="name" name="name" required />

            <label for="category">Category</label>
            <select id="category" name="categoryId" required>
                <option value="">Select Category</option>
                <c:forEach var="cat" items="${categories}">
                    <option value="${cat.id}">${cat.name}</option>
                </c:forEach>
            </select>

            <label for="price">Price</label>
            <input type="number" step="0.01" id="price" name="price" required />

            <label for="quantity">Quantity</label>
            <input type="number" id="quantity" name="quantity" required />

            <button type="submit"> Save Item</button>
        </form>

        <a href="${pageContext.request.contextPath}/ItemServlet" class="back-link">← Back to Item List</a>
    </div>
</body>
</html>
