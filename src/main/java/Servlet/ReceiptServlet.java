package Servlet;

import dao.BillDao;
import dao.CustomerDao;
import java.io.IOException;
import javaClasses.Bill;
import javaClasses.BillItem;
import javaClasses.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet("/ReceiptServlet")
public class ReceiptServlet extends HttpServlet {

    private final BillDao billDao = new BillDao();
    private final CustomerDao customerDao = new CustomerDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String billIdStr = req.getParameter("billId");
            if (billIdStr == null) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing billId parameter");
                return;
            }

            int billId = Integer.parseInt(billIdStr);
            Bill bill = billDao.getBillById(billId);
            if (bill == null) {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Bill not found");
                return;
            }

            Customer customer = customerDao.getCustomerById(bill.getCustomerId());
            List<BillItem> billItems = billDao.getBillItemsByBillId(billId);

            req.setAttribute("bill", bill);
            req.setAttribute("customer", customer);
            req.setAttribute("billItems", billItems);

            req.getRequestDispatcher("JSP/Billing/receipt.jsp").forward(req, resp);

        } catch (Exception e) {
            throw new ServletException("Error loading receipt", e);
        }
    }
}
