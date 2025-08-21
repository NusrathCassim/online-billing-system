<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Item List - Pahana Edu</title>
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
            text-decoration: none;
           background-color: #ffcc00;
            border: none;
            color: #000;
            margin-left: 10px;
            font-weight: bold;
            padding: 0.7rem 1.2rem;
            border-radius: 12px;
            box-shadow: 4px 4px 0px #000;
            cursor: pointer;
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

        .btn-delete {
            background-color: #ff3f33;
            color: #fff;
            box-shadow: 2px 3px 6px rgba(150, 0, 0, 0.5);
        }
        .btn-delete:hover {
            background-color: #e62e2e;
        }

        /* Modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.5);
        }
        .modal-content {
            background-color: #fff;
            margin: 10% auto;
            padding: 20px;
            border-radius: 12px;
            width: 400px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.3);
        }
        .close {
            float: right;
            font-size: 20px;
            font-weight: bold;
            color: #555;
            cursor: pointer;
        }
        .close:hover {
            color: #000;
        }
        .modal form input, 
        .modal form select {
            width: 100%;
            padding: 8px;
            margin-top: 8px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>

<!--    <h1>Items</h1>-->

    <div class="actions">
        <a href="${pageContext.request.contextPath}/ItemServlet?action=add" class="btn">+ Add Item</a>
        <a href="${pageContext.request.contextPath}/CategoryServlet?action=list" class="btn">📂 Manage Categories</a>
        <a href="${pageContext.request.contextPath}/JSP/mainDashboard.jsp" class="back-link">← Back to Dashboard</a>
    </div>

    <table>
       <thead>
    <tr>
        <th>ID</th>
        <th>Item Name</th>
        <th>Category</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Availability</th> <!-- New Column -->
        <th>Actions</th>
    </tr>
</thead>
    <tbody>
        <c:forEach var="item" items="${itemList}">
            <tr>
                <td>${item.id}</td>
                <td>${item.name}</td>
                <td>${item.categoryName}</td>
                <td>${item.price}</td>
                <td>${item.quantity}</td>

                <!-- New Availability Column -->
                <td>
                    <c:choose>
                        <c:when test="${item.quantity lt 10}">
                            <span style="color:red; font-weight:bold;">⚠️ Restock</span>
                        </c:when>
                        <c:otherwise>
                            <span style="color:green; font-weight:bold;">Available</span>
                        </c:otherwise>
                    </c:choose>
                </td>

                <td>
                    <!-- Edit button uses data attributes for safe data passing -->
                    <button type="button" class="btn edit-btn"
                        data-id="${item.id}"
                        data-name="${item.name}"
                        data-category-id="${item.categoryId}"
                        data-price="${item.price}"
                        data-quantity="${item.quantity}">
                        Edit
                    </button>

                    <c:choose>
                        <c:when test="${role eq 'admin'}">
                            <form action="ItemServlet" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="${item.id}" />
                                <input type="hidden" name="action" value="delete" />
                                <button type="submit" class="btn btn-delete">Delete</button>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <button type="button" class="btn btn-delete" 
                                    style="opacity:0.6; cursor:not-allowed;" 
                                    onclick="alert('⚠️ You are not allowed to delete items, please contact admin.')">
                                Delete
                            </button>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </tbody>

    </table>

    <!-- Edit Modal -->
    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeEditModal()">&times;</span>
            <h3>Edit Item</h3>
            <form action="ItemServlet" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" id="editId" name="id">

                <label>Item Name:</label>
                <input type="text" id="editName" name="name" required>

                <label>Category:</label>
                <select id="editCategory" name="categoryId" required>
              
                <c:forEach var="cat" items="${categories}">
                        <option value="${cat.id}">${cat.name}</option>
                 </c:forEach>
                </select>
                       
                <label>Price:</label>
                <input type="number" id="editPrice" name="price" step="0.01" required>

                <label>Quantity:</label>
                <input type="number" id="editQuantity" name="quantity" required>

                <button type="submit" class="btn">Save Changes</button>
            </form>
        </div>
    </div>

    <script>
        // Attach click handlers to all edit buttons after page loads
        document.addEventListener("DOMContentLoaded", function() {
            document.querySelectorAll('.edit-btn').forEach(function(btn) {
                btn.addEventListener('click', function() {
                    const id = btn.getAttribute('data-id');
                    const name = btn.getAttribute('data-name');
                    const categoryId = btn.getAttribute('data-category-id');
                    const price = btn.getAttribute('data-price');
                    const quantity = btn.getAttribute('data-quantity');

                    openEditModal(id, name, categoryId, price, quantity);
                });
            });
        });

        function openEditModal(id, name, categoryId, price, quantity) {
            console.log("Opening edit modal with:", {id, name, categoryId, price, quantity});
            document.getElementById("editId").value = id;
            document.getElementById("editName").value = name;
            document.getElementById("editCategory").value = categoryId;
            document.getElementById("editPrice").value = price;
            document.getElementById("editQuantity").value = quantity;
            document.getElementById("editModal").style.display = "block";
        }

        function closeEditModal() {
            document.getElementById("editModal").style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target === document.getElementById("editModal")) {
                closeEditModal();
            }
        }
    </script>

</body>
</html>
