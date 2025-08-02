<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, javaClasses.Customer"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Customer List</title>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka&family=Patrick+Hand&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Fredoka', sans-serif;
            background-color: #f9f6f2;
            padding: 2rem;
        }

        h2 {
            font-family: 'Patrick Hand', cursive;
            color: #222;
        }

        .btn {
            font-family: 'Fredoka', sans-serif;
            padding: 8px 14px;
            margin: 4px 2px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            box-shadow: 3px 3px 0px #000;
            display: inline-block;
        }

        .yellow-btn {
            background-color: #ffcc00;
            color: #000;
            font-weight: bold;
        }

        .yellow-btn:hover {
            background-color: #ffd633;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
            background: #fff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.05);
        }

        th, td {
            padding: 14px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }

        th {
            background-color: #fff8dc;
            font-family: 'Patrick Hand', cursive;
        }

        #editModal {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #ffffff;
            padding: 2rem;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            z-index: 1000;
        }

        #editModal input {
            width: 100%;
            padding: 10px;
            margin: 0.5rem 0;
            border-radius: 10px;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>

<h2>Customer List</h2>

<a href="JSP/Customer/addCustomer.jsp" class="btn yellow-btn">➕ Add New Customer</a>
<a href="JSP/mainDashboard.jsp" class="back-link">← Back to Dashboard</a>

<c:if test="${empty customerList}">
    <p>No customers found.</p>
</c:if>

<c:if test="${not empty customerList}">
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="c" items="${customerList}">
            <tr>
                <td>${c.id}</td>
                <td>${c.name}</td>
                <td>${c.email}</td>
                <td>${c.phone}</td>
                <td>
                    <button class="btn yellow-btn" onclick="openEditModal('${c.id}', '${c.name}', '${c.email}', '${c.phone}')">Edit</button>
                    <form action="CustomerServlet" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete"/>
                        <input type="hidden" name="id" value="${c.id}"/>
                        <button type="submit" class="btn yellow-btn">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<!-- Edit Modal -->
<div id="editModal">
    <h3 style="font-family:'Patrick Hand', cursive;">Edit Customer</h3>
    <form action="UpdateCustomerServlet" method="post">
        <input type="hidden" name="id" id="editId">
        <input type="text" name="name" id="editName" placeholder="Customer Name" required>
        <input type="email" name="email" id="editEmail" placeholder="Email" required>
        <input type="text" name="phone" id="editPhone" placeholder="Phone" required>
        <button type="submit" class="btn yellow-btn">Save</button>
        <button type="button" class="btn" onclick="closeEditModal()">Cancel</button>
    </form>
</div>

<script>
    function openEditModal(id, name, email, phone) {
        document.getElementById("editId").value = id;
        document.getElementById("editName").value = name;
        document.getElementById("editEmail").value = email;
        document.getElementById("editPhone").value = phone;
        document.getElementById("editModal").style.display = "block";
    }

    function closeEditModal() {
        document.getElementById("editModal").style.display = "none";
    }
</script>

</body>
</html>
