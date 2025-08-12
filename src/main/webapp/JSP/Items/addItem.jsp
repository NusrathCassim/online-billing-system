<%-- 
    Document   : addItem
    Created on : Aug 9, 2025, 8:42:42 PM
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
                background-color: #f9f9f9;
                margin: 0;
                padding: 20px;
            }
            .form-card {
                background: white;
                padding: 25px;
                border-radius: 12px;
                max-width: 500px;
                margin: 0 auto;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }
            h2 {
                text-align: center;
                color: #004080;
                margin-bottom: 20px;
            }
            label {
                font-weight: bold;
                margin-top: 10px;
                display: block;
            }
            input, select {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 8px;
                font-size: 1rem;
            }
            button {
                margin-top: 20px;
                width: 100%;
                background-color: #ffcc00;
                border: none;
                padding: 12px;
                font-weight: bold;
                font-size: 1rem;
                cursor: pointer;
                border-radius: 8px;
                transition: background 0.3s;
            }
            button:hover {
                background-color: #ffb700;
            }
            .back-btn {
                display: inline-block;
                margin-top: 15px;
                text-decoration: none;
                color: #004080;
                font-weight: bold;
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

        <button type="submit">Save Item</button>
    </form>
    
    <a href="${pageContext.request.contextPath}/ItemServelt" class="back-link">← Back to Item List</a>

</div>

</body>
</html>

