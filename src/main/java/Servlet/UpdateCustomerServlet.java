/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import dao.CustomerDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javaClasses.Customer;

/**
 *
 * @author Nusrath
 */

public class UpdateCustomerServlet extends HttpServlet {
   
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
   throws ServletException, IOException {
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        Customer customer = new Customer(id, name, email, phone);
        CustomerDao dao = new CustomerDao();
        dao.updateCustomer(customer);

        response.sendRedirect("CustomerServlet");
    } catch (Exception e) {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Update failed");
    }
}



}
