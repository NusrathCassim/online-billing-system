/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import dao.CustomerDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import javaClasses.Customer;

/**
 *
 * @author Nusrath
 */
public class CustomerServlet extends HttpServlet {

    CustomerDao dao = new CustomerDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {
        List<Customer> list = dao.getAllCustomers();

        System.out.println("Customers fetched: " + list.size());

        req.setAttribute("customerList", list);
        req.getRequestDispatcher("/JSP/CustomerList.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {

        String action = req.getParameter("action");
        if ("add".equals(action)) {
            Customer c = new Customer();
            c.setName(req.getParameter("name"));
            c.setEmail(req.getParameter("email"));
            c.setPhone(req.getParameter("phone"));
            dao.addCustomer(c);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            dao.deleteCustomer(id);
        }

        res.sendRedirect("CustomerServlet");
    }
}
