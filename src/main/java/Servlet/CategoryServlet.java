/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servlet;

import Service.CategoryService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import javaClasses.CategoryClass;

/**
 *
 * @author Nusrath
 */
@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CategoryClass> categories = categoryService.listAll();
        req.setAttribute("categories", categories);   
        req.getRequestDispatcher("JSP/Items/categories.jsp").forward(req, resp);
        req.getRequestDispatcher("JSP/Items/addItem.jsp").forward(req, resp);
    }
//    @Override
//protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//    List<CategoryClass> categories = categoryService.listAll(); // load categories from DB
//    req.setAttribute("categories", categories);                // set as request attribute
//    req.getRequestDispatcher("JSP/Items/addItem.jsp").forward(req, resp);  // forward to JSP
//}
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");

        CategoryClass category = new CategoryClass(0, name);
        categoryService.createCategory(category);

        resp.sendRedirect("CategoryServlet");
    }
}
