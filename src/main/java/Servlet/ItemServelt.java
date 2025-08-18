/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Service.CategoryService;
import Service.ItemService;
import dao.CategoryDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import javaClasses.CategoryClass;
import javaClasses.ItemClass;

/**
 *
 * @author Nusrath
 */
@WebServlet("/ItemServlet")
public class ItemServelt extends HttpServlet {
     private final CategoryService categoryService = new CategoryService();
      private final ItemService itemService = new ItemService();

//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        CategoryDao categoryDao = new CategoryDao();
//        List<CategoryClass> categoryList = categoryDao.getAllCategories();
//
//        request.setAttribute("categoryList", categoryList);
//
//        // Forward to JSP page
//        request.getRequestDispatcher("JSP/Items/itemList.jsp").forward(request, response);
//      
//    }
     
    // Assume you have ItemService for item handling

//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
////            List<CategoryClass> categories = categoryService.listAll();
////            System.out.println("ItemServlet loaded categories: " + categories.size());  // Debug
////            req.setAttribute("categories", categories);
////             req.getRequestDispatcher("JSP/Items/addItem.jsp").forward(req, resp);
////            req.getRequestDispatcher("JSP/Items/itemList.jsp").forward(req, resp);
//            List<ItemClass> itemList = itemService.listAll(); // You must implement this method in ItemService
//            req.setAttribute("itemList", itemList);
//
//            // Forward to item list page
//            req.getRequestDispatcher("JSP/Items/itemList.jsp").forward(req, resp);
//            
//        
//    }
      @Override
      protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
        List<CategoryClass> categories = categoryService.listAll();
        List<ItemClass> itemList = itemService.listAll();

        req.setAttribute("categories", categories);
        req.setAttribute("itemList", itemList);

        String action = req.getParameter("action");
        if ("add".equalsIgnoreCase(action)) {
           
            req.getRequestDispatcher("JSP/Items/addItem.jsp").forward(req, resp);
        } else {
           
            req.getRequestDispatcher("JSP/Items/itemList.jsp").forward(req, resp);
        }
    } catch (SQLException | ClassNotFoundException e) {
        throw new ServletException("Error fetching data", e);
    }
}


   
    @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String action = req.getParameter("action");

    try {
        if ("add".equals(action)) {
            String name = req.getParameter("name");
            int categoryId = Integer.parseInt(req.getParameter("categoryId"));
            double price = Double.parseDouble(req.getParameter("price"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));

            ItemClass item = new ItemClass(0, name, categoryId, price, quantity);
            boolean success = itemService.createItem(item);

            if (success) {
                resp.sendRedirect("ItemServlet?action=list");
            } else {
                resp.sendRedirect("ItemServlet?action=add&error=1");
            }

        } else if ("update".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            int categoryId = Integer.parseInt(req.getParameter("categoryId"));
            double price = Double.parseDouble(req.getParameter("price"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));

            ItemClass item = new ItemClass(id, name, categoryId, price, quantity);
            boolean success = itemService.updateItem(item);

            if (success) {
                resp.sendRedirect("ItemServlet?action=list");
            } else {
                resp.sendRedirect("ItemServlet?action=list&error=update_failed");
            }

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            boolean success = itemService.deleteItem(id);

            if (success) {
                resp.sendRedirect("ItemServlet?action=list");
            } else {
                resp.sendRedirect("ItemServlet?action=list&error=delete_failed");
            }
        } else {
            // Unknown action or just list
            resp.sendRedirect("ItemServlet?action=list");
        }
    } catch (SQLException | ClassNotFoundException e) {
        throw new ServletException("Error processing item action", e);
    }
}


    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
    
    

}
