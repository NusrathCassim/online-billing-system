<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Bill</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Comic+Neue:wght@700&family=Quicksand&display=swap');

        body {
    font-family: 'Quicksand', sans-serif;
    background: linear-gradient(135deg, #fefcf7, #fff8e7);
    margin: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 30px;
    color: #333;
}

.back-link {
    font-family: 'Comic Neue', cursive;
    font-weight: bold;
    font-size: 1.1rem;
    margin-bottom: 20px;
    text-decoration: none;
    color: #444;
    background-color: #ffcc00;
    padding: 10px 18px;
    border-radius: 12px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    transition: background-color 0.3s ease;
}

.back-link:hover {
    background-color: #e6b800;
}

.form-layout {
    display: flex;
    gap: 30px;
    max-width: 1000px;
    width: 100%;
    justify-content: center;
}

.panel {
    background: #fff;
    padding: 20px;
    border-radius: 18px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.08);
    flex: 1;
    display: flex;
    flex-direction: column;
    height: 500px; /* Increased height */
}

        h2, h3 {
            font-family: 'Comic Neue', cursive;
            color: #222;
            margin-bottom: 15px;
            text-align: center;
        }
        label {
            font-weight: 600;
            font-size: 1rem;
            margin-bottom: 8px;
            display: block;
            color: #444;
        }
        select, input[type=number] {
            width: 100%;
            padding: 12px 14px;
            margin-bottom: 15px;
            border: 2px solid #ddd;
            border-radius: 12px;
            font-size: 1rem;
            transition: 0.3s ease;
            background: #fafafa;
        }
        select:focus, input[type=number]:focus {
            border-color: #ffcc00;
            background: #fff;
            outline: none;
            box-shadow: 0 0 8px #ffcc00aa;
        }
        #itemsContainer {
            display: flex;
            flex-direction: column;
            gap: 12px;
            overflow-y: auto;
            flex: 1;
            padding-right: 5px;
        }
        .item-row {
            display: flex;
            gap: 10px;
            align-items: center;
        }
        .item-row select { flex: 2; }
        .item-row input { flex: 1; }
        .item-row button {
            background-color: #ff6b6b;
            color: #fff;
            border: none;
            padding: 8px 12px;
            border-radius: 10px;
            cursor: pointer;
            font-weight: 600;
        }
        .item-row button:hover {
            background-color: #e05252;
        }
        .btn {
            background-color: #ffcc00;
            color: #000;
            border: none;
            padding: 12px 20px;
            border-radius: 14px;
            cursor: pointer;
            font-weight: 700;
            font-family: 'Comic Neue', cursive;
            display: block;
            margin-top: auto;
            width: 100%;
        }
        .btn:hover {
            background-color: #e6b800;
        }
        
    </style>

    <script>
    function addItemRow() {
        const container = document.getElementById('itemsContainer');
        const row = document.createElement('div');
        row.className = 'item-row';
        row.innerHTML = `
            <select name="itemId" required>
                <c:forEach var="item" items="${itemList}">
                    <option value="${item.id}">${item.name} (Rs${item.price})</option>
                </c:forEach>
            </select>
            <input type="number" name="quantity" min="1" value="1" required>
            <button type="button" onclick="this.parentNode.remove()">Remove</button>
        `;
        container.appendChild(row);
    }
    </script>
</head>
<body>
    <a href="JSP/mainDashboard.jsp" class="back-link">← Back to Dashboard</a>

    <form action="BillServlet" method="post" class="form-layout">
        <!-- Left Panel -->
        <div class="panel">
            <h2>Customer & Add Item</h2>
            <label for="customerId">Select Customer:</label>
            <select name="customerId" id="customerId" required>
                <c:forEach var="customer" items="${customerList}">
                    <option value="${customer.id}">${customer.name}</option>
                </c:forEach>
            </select>

            <button type="button" class="btn" onclick="addItemRow()">+ Add Item</button>
        </div>

        <!-- Right Panel -->
        <div class="panel">
            <h3>Items in Bill</h3>
            <div id="itemsContainer">
                <div class="item-row">
                    <select name="itemId" required>
                        <c:forEach var="item" items="${itemList}">
                            <option value="${item.id}">${item.name} (Rs${item.price})</option>
                        </c:forEach>
                    </select>
                    <input type="number" name="quantity" min="1" value="1" required>
                </div>
            </div>
            <button type="submit" class="btn">Generate Bill</button>
        </div>
    </form>
</body>
</html>
