package Servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import dao.ReportDAO;
import javaClasses.BillSummary;
import javaClasses.Customer;
import javaClasses.Inventory;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {

    private ReportDAO reportDAO;

    @Override
    public void init() {
        reportDAO = new ReportDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String type = request.getParameter("type");

        try {
            if ("bill".equals(type)) {
                List<BillSummary> bills = reportDAO.getBillReports();
                request.setAttribute("reportSummaries", bills);
                request.getRequestDispatcher("JSP/Reports/billReport.jsp").forward(request, response);

            } else if ("customer".equals(type)) {
                List<Customer> customers = reportDAO.getCustomerReports();
                request.setAttribute("customers", customers);
                request.getRequestDispatcher("JSP/Reports/customerReport.jsp").forward(request, response);

            } else if ("inventory".equals(type)) {
                List<Inventory> items = reportDAO.getInventoryReports();
                request.setAttribute("items", items);
                request.getRequestDispatcher("JSP/Reports/inventoryReport.jsp").forward(request, response);

            } else {
                request.getRequestDispatcher("JSP/Reports/report.jsp").forward(request, response);
            }
        } catch (Exception e) {
            throw new ServletException("Error while generating reports", e);
        }
    }
}
