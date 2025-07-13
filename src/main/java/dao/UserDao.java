package dao;

import java.sql.*;
import javaClasses.userClass;

public class UserDao {

  public boolean validate(userClass user) {
    boolean isValid = false;

    String sql = "SELECT * FROM Agents WHERE username = ? AND password = ?";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setString(1, user.getUsername());
        stmt.setString(2, user.getPassword());

        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            String role = rs.getString("role");
            user.setRole(role);
            isValid = true;
        }

    } catch (SQLException | ClassNotFoundException e) {
        System.err.println("Error during login validation: " + e.getMessage());     
//        System.err.println("Error during login validation: " + e.getMessage());

    }

    return isValid;
}


}
