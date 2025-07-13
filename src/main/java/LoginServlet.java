

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javaClasses.userClass;
import dao.UserDao;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;



/**
 *
 * @author Nusrath
 */
//@WebServlet("/LoginServlet")
@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create user object
        userClass user = new userClass();
        user.setUsername(username);
        user.setPassword(password);

        // Validate user
        UserDao userDao = new UserDao();
        boolean isValid = userDao.validate(user);

        if (isValid) {
            // Store user in session
            HttpSession session = request.getSession();
            session.setAttribute("loggedUser", user);
            session.setAttribute("role", user.getRole());

            // Redirect to dashboard or admin page
            response.sendRedirect("JSP/mainDashboard.jsp");
        } else {
            // Redirect back to login with error
            response.sendRedirect("login.jsp?error=invalid");
        }
    }
}
