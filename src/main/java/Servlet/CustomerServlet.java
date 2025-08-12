package Servlet;

import Service.CustomerService;
import javaClasses.Customer;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CustomerServlet extends HttpServlet {

    private final CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            List<Customer> list = customerService.listAllCustomers();
            req.setAttribute("customerList", list);
            req.getRequestDispatcher("JSP/Customer/CustomerList.jsp").forward(req, res);
        } catch (Exception e) {
            throw new ServletException("Error fetching customers", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        try {
            if ("add".equals(action)) {
                Customer customer = new Customer();
                customer.setName(req.getParameter("name"));
                customer.setEmail(req.getParameter("email"));
                customer.setPhone(req.getParameter("phone"));
                customerService.addCustomer(customer);
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                customerService.deleteCustomer(id);
            } else if ("update".equals(action)) {
                Customer customer = new Customer();
                customer.setId(Integer.parseInt(req.getParameter("id")));
                customer.setName(req.getParameter("name"));
                customer.setEmail(req.getParameter("email"));
                customer.setPhone(req.getParameter("phone"));
                customerService.updateCustomer(customer);
            }
            res.sendRedirect("CustomerServlet");
        } catch (Exception e) {
            throw new ServletException("Error processing customer action", e);
        }
    }
}
