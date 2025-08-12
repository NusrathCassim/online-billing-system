/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import dao.CategoryDao;
import java.util.List;
import javaClasses.CategoryClass;

/**
 *
 * @author Nusrath
 */
public class CategoryService {
     private CategoryDao categoryDao = new CategoryDao();

    public List<CategoryClass> listAll() {
        return categoryDao.getAllCategories();
    }

    public boolean createCategory(CategoryClass category) {
        return categoryDao.addCategory(category);
    }

}
