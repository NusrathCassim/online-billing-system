package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javaClasses.BillSummary;
import javaClasses.Customer;
import javaClasses.Inventory;
import javaClasses.ReportSummary;

public class ReportDAO {

    // ---------------- BILL REPORTS ----------------
   // ---------------- BILL REPORTS ----------------
public List<BillSummary> getBillReports() throws SQLException, ClassNotFoundException {
    List<BillSummary> list = new ArrayList<>();
    String sql = "SELECT id, customer_id, bill_date, total_amount FROM bill";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            // Using null for items since we only need the summary
            BillSummary b = new BillSummary(
                    rs.getInt("id"),
                    rs.getInt("customer_id"),
                    rs.getTimestamp("bill_date"),
                    null, // no items for summary
                    rs.getDouble("total_amount")
            );
            list.add(b);
        }
    }
    return list;
}

    // ---------------- CUSTOMER REPORTS ----------------
    public List<Customer> getCustomerReports() throws SQLException, ClassNotFoundException {
        List<Customer> list = new ArrayList<>();
        String sql = "SELECT id, name, email, phone FROM customers";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Customer c = new Customer(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("phone")
                );
                list.add(c);
            }
        }
        return list;
    }

    // ---------------- INVENTORY REPORTS ----------------
    public List<Inventory> getInventoryReports() throws SQLException, ClassNotFoundException {
        List<Inventory> list = new ArrayList<>();
        String sql = "SELECT id, name, quantity, price FROM item";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Inventory item = new Inventory(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getInt("quantity"),
                        rs.getDouble("price")
                );
                list.add(item);
            }
        }
        return list;
    }

    // ---------------- UNIFIED REPORTS ----------------
    public List<ReportSummary> getAllReports() throws SQLException, ClassNotFoundException {
        List<ReportSummary> reports = new ArrayList<>();

       for (BillSummary b : getBillReports()) {
            reports.add(new ReportSummary("Bill",
                    "Bill ID: " + b.getId() +
                    " | Customer ID: " + b.getCustomerId() +
                    " | Total: " + b.getTotalAmount()));
}

        for (Customer c : getCustomerReports()) {
            reports.add(new ReportSummary("Customer",
                    "Name: " + c.getName() +
                    " | Email: " + c.getEmail()));
        }
        for (Inventory i : getInventoryReports()) {
            reports.add(new ReportSummary("Inventory",
                    "Item: " + i.getName() +
                    " | Qty: " + i.getQuantity() +
                    " | Price: " + i.getPrice()));
        }

        return reports;
    }


}
