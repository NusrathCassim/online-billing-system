/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author Nusrath
 */
import java.sql.*;
import java.util.*;
import javaClasses.Customer;
public class CustomerDao {

    public List<Customer> getAllCustomers() {
        List<Customer> list = new ArrayList<>();
        String sql = "SELECT * FROM customers";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                list.add(new Customer(rs.getInt("id"), rs.getString("name"),
                        rs.getString("email"), rs.getString("phone")));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
    public Customer getCustomerById(int id) {
        Customer customer = null;
        String sql = "SELECT * FROM customers WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    customer = new Customer(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("phone")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customer;
    }


    public void addCustomer(Customer c) {
        String sql = "INSERT INTO customers (name, email, phone) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, c.getName());
            stmt.setString(2, c.getEmail());
            stmt.setString(3, c.getPhone());
            stmt.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void deleteCustomer(int id) {
        String sql = "DELETE FROM customers WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
    
   public void updateCustomer(Customer c) {
    String sql = "UPDATE customers SET name=?, email=?, phone=? WHERE id=?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, c.getName());
        stmt.setString(2, c.getEmail());
        stmt.setString(3, c.getPhone());
        stmt.setInt(4, c.getId());
        stmt.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

}
