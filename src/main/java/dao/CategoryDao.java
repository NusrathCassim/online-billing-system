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
import java.util.ArrayList;
import java.util.List;
import javaClasses.CategoryClass;
import dao.DBConnection;

public class CategoryDao {
    public List<CategoryClass> getAllCategories() {
        List<CategoryClass> categories = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM category";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CategoryClass cat = new CategoryClass(rs.getInt("id"), rs.getString("name"));
                categories.add(cat);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return categories;
    }
     public boolean addCategory(CategoryClass category) {
        String sql = "INSERT INTO category (name) VALUES (?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, category.getName());
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
