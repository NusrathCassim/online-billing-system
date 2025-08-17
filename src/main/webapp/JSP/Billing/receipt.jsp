<%-- 
    Document   : receipt
    Created on : Aug 11, 2025, 12:00:15 AM
    Author     : Nusrath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<html>
<head>
    <title>Receipt</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 600px; margin: 20px auto; padding: 20px; background: #f9f9f9; }
        h2, h3 { text-align: center; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; background: white; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #eee; }
        .total { font-weight: bold; }
        .footer { margin-top: 30px; text-align: center; font-style: italic; color: #666; }
    </style>
</head>
<body>

<h2>Pahan Edu</h2>
<p style="text-align:center;">123 Park Street, Colombo, Sri-Lanka<br>Phone: 01234 567890</p>
<hr/>

<h3>Receipt</h3>

<p><strong>Bill Number:</strong> ${bill.id}</p>
<p><strong>Date:</strong> ${bill.billDate}</p>

<h4>Customer Details</h4>
<p>Name: ${customer.name}</p>
<p>Email: ${customer.email}</p>
<p>Phone: ${customer.phone}</p>

<table>
    <thead>
        <tr>
            <th>Item</th><th>Qty</th><th>Unit Price (Rs)</th><th>Total (Rs)</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="item" items="${billItems}">
            <tr>
                <td>${item.itemName}</td>
                <td>${item.quantity}</td>
                <td><fmt:formatNumber value="${item.unitPrice}" type="currency" currencySymbol="Rs"/></td>
                <td><fmt:formatNumber value="${item.unitPrice * item.quantity}" type="currency" currencySymbol="Rs"/></td>
            </tr>
        </c:forEach>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="3" class="total">Total Amount</td>
            <td class="total">Rs${bill.totalAmount}</td>
        </tr>
    </tfoot>
</table>

<div class="footer">
    Thank you for your purchase!<br/>
    Visit again!
</div>

</body>
</html>

