// BillDao.java
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javaClasses.Bill;
import javaClasses.BillItem;

public class BillDao {

    // Insert bill and get generated id
    public int insertBill(Bill bill) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO bill (customer_id, bill_date, total_amount) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, bill.getCustomerId());
            ps.setTimestamp(2, new Timestamp(bill.getBillDate().getTime()));
            ps.setDouble(3, bill.getTotalAmount());
            int affectedRows = ps.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating bill failed, no rows affected.");
            }
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating bill failed, no ID obtained.");
                }
            }
        }
    }

    // Insert bill items (multiple) in one go
    public void insertBillItems(int billId, List<BillItem> items) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO bill_item (bill_id, item_id, item_name, quantity, unit_price, total_price) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            for (BillItem item : items) {
                ps.setInt(1, billId);
                ps.setInt(2, item.getItemId());
                ps.setString(3, item.getItemName());
                ps.setInt(4, item.getQuantity());
                ps.setDouble(5, item.getUnitPrice());
                ps.setDouble(6, item.getTotalPrice());
                ps.addBatch();
            }
            ps.executeBatch();
        }
    }

    // Optional: Fetch bills by customer or all bills
    public List<Bill> getBillsByCustomer(int customerId) throws SQLException, ClassNotFoundException {
        // Implement if needed...
        return new ArrayList<>();
    }
    public Bill getBillById(int billId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM bill WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, billId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Bill bill = new Bill();
                    bill.setId(rs.getInt("id"));
                    bill.setCustomerId(rs.getInt("customer_id"));
                    bill.setBillDate(rs.getTimestamp("bill_date"));
                    bill.setTotalAmount(rs.getDouble("total_amount"));
                    return bill;
                }
            }
        }
        return null;
    }

    public List<BillItem> getBillItemsByBillId(int billId) throws SQLException, ClassNotFoundException {
        List<BillItem> items = new ArrayList<>();
        String sql = "SELECT bi.id, bi.bill_id, bi.item_id, bi.quantity, bi.unit_price, i.name " +
                     "FROM bill_item bi JOIN item i ON bi.item_id = i.id WHERE bi.bill_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, billId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    BillItem item = new BillItem();
                    item.setId(rs.getInt("id"));
                    item.setBillId(rs.getInt("bill_id"));
                    item.setItemId(rs.getInt("item_id"));
                    item.setQuantity(rs.getInt("quantity"));
                    item.setUnitPrice(rs.getDouble("unit_price"));
                    item.setItemName(rs.getString("name"));
                    items.add(item);
                }
            }
        }
        return items;
    }
    // Reduce item quantity after billing
    public void updateItemQuantities(List<BillItem> items) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE item SET quantity = quantity - ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            for (BillItem item : items) {
                ps.setInt(1, item.getQuantity());
                ps.setInt(2, item.getItemId());
                ps.addBatch();
            }
            ps.executeBatch();
        }
    }

}
