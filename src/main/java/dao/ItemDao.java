package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javaClasses.ItemClass;

public class ItemDao {

    public List<ItemClass> getAllItems() throws SQLException, ClassNotFoundException {
        List<ItemClass> items = new ArrayList<>();
        String sql = "SELECT i.id, i.name, c.name AS categoryName, i.price, i.quantity " +
                     "FROM item i " +
                     "JOIN category c ON i.category_id = c.id";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                ItemClass item = new ItemClass();
                item.setId(rs.getInt("id"));
                item.setName(rs.getString("name"));
                item.setCategoryName(rs.getString("categoryName")); 
                item.setPrice(rs.getDouble("price"));
                item.setQuantity(rs.getInt("quantity"));
                items.add(item);
            }
        }
        return items;
    }

    public boolean addItem(ItemClass item) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO item (name, category_id, price, quantity) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, item.getName());
            stmt.setInt(2, item.getCategoryId());
            stmt.setDouble(3, item.getPrice());
            stmt.setInt(4, item.getQuantity());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean updateItem(ItemClass item) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE item SET name = ?, category_id = ?, price = ?, quantity = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, item.getName());
            stmt.setInt(2, item.getCategoryId());
            stmt.setDouble(3, item.getPrice());
            stmt.setInt(4, item.getQuantity());
            stmt.setInt(5, item.getId());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean deleteItem(int id) throws SQLException, ClassNotFoundException {
    String sql = "DELETE FROM item WHERE id = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        
        stmt.setInt(1, id);
        return stmt.executeUpdate() > 0; 
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}
    public ItemClass getItemById(int id) throws SQLException, ClassNotFoundException {
    String sql = "SELECT i.id, i.name, i.category_id, i.price, i.quantity, c.name AS categoryName " +
                 "FROM item i JOIN category c ON i.category_id = c.id WHERE i.id = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, id);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                ItemClass item = new ItemClass();
                item.setId(rs.getInt("id"));
                item.setName(rs.getString("name"));
                item.setCategoryId(rs.getInt("category_id"));
                item.setCategoryName(rs.getString("categoryName"));
                item.setPrice(rs.getDouble("price"));
                item.setQuantity(rs.getInt("quantity"));
                return item;
            }
        }
    }
    return null;
}

}
