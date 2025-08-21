package Servlet;

import Service.BillService;
import Service.CustomerService;
import Service.ItemService;
import javaClasses.BillItem;
import javaClasses.ItemClass;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/BillServlet")
public class BillServlet extends HttpServlet {

    private final BillService billService = new BillService();
    private final CustomerService customerService = new CustomerService();
    private final ItemService itemService = new ItemService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setAttribute("customerList", customerService.listAllCustomers());
            req.setAttribute("itemList", itemService.listAll());
            req.getRequestDispatcher("JSP/Billing/BillCreation.jsp").forward(req, resp);
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int customerId = Integer.parseInt(req.getParameter("customerId"));

            // itemId and quantity come as multiple values
            String[] itemIds = req.getParameterValues("itemId");
            String[] quantities = req.getParameterValues("quantity");

            if (itemIds == null || quantities == null || itemIds.length != quantities.length) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid items data");
                return;
            }
            List<BillItem> billItems = new ArrayList<>();
            for (int i = 0; i < itemIds.length; i++) {
                int itemId = Integer.parseInt(itemIds[i]);
                int qty = Integer.parseInt(quantities[i]);
                ItemClass item = itemService.getItemById(itemId); 
                BillItem bi = new BillItem();
                bi.setItemId(itemId);
                bi.setItemName(item.getName());
                bi.setQuantity(qty);
                bi.setUnitPrice(item.getPrice());
                bi.setTotalPrice(qty * item.getPrice());
                billItems.add(bi);
            }
            
           int savedBillId = billService.createBill(customerId, billItems);
                if (savedBillId > 0) {
                    resp.sendRedirect("ReceiptServlet?billId=" + savedBillId);
                } else {
                    resp.sendRedirect("BillServlet?error=1");
                }
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }
}
