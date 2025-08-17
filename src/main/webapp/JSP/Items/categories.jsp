<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Category Management</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            background-color: #fef9f2;
            padding: 20px 40px;
            color: #222;
        }
        h1 {
            font-weight: 700;
            margin-bottom: 15px;
        }
        .actions {
            margin-bottom: 20px;
            display: flex;
            gap: 12px;
            align-items: center;
        }
        .btn {
            background-color: #ffcc00;
            padding: 10px 18px;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            cursor: pointer;
            box-shadow: 2px 3px 5px rgba(0, 0, 0, 0.25);
            color: #000;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #ffb700;
        }
        .back-link {
            color: #4b4b4b;
            font-weight: 500;
            font-size: 0.9rem;
            text-decoration: underline;
            cursor: pointer;
        }
        form {
            background: #fff;
            padding: 1.2rem 1.5rem;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
            display: flex;
            gap: 1rem;
            align-items: center;
        }
        label {
            font-weight: bold;
            min-width: 160px;
            font-size: 1rem;
        }
        input[type="text"] {
            flex-grow: 1;
            padding: 10px 12px;
            border-radius: 10px;
            border: 1px solid #ccc;
            font-size: 1rem;
        }
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 3px 7px rgba(0, 0, 0, 0.12);
            border-radius: 12px;
            overflow: hidden;
        }
        thead tr {
            background-color: #f7d400;
        }
        thead th {
            padding: 14px 20px;
            font-weight: 700;
            color: #222;
            text-align: left;
            border-bottom: 2px solid #e6c200;
        }
        tbody tr:nth-child(even) {
            background-color: #fffbea;
        }
        tbody tr:hover {
            background-color: #fffbcc;
        }
        tbody td {
            padding: 12px 20px;
        }
    </style>
</head>
<body>

    <h1>Category Management</h1>

    <div class="actions">
        <a href="${pageContext.request.contextPath}/ItemServlet?action=list" class="back-link">← Back to Items</a>
    </div>

    <form action="CategoryServlet" method="post">
        <label for="name">New Category Name:</label>
        <input type="text" id="name" name="name" required>
        <button type="submit" class="btn">+ Add Category</button>
    </form>

    <table>
        <thead>
            <tr>
                <th>Category Name</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="category" items="${categories}">
                <tr>
                    <td>${category.name}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>
