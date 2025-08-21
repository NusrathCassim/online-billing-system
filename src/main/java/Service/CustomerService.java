/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import dao.CustomerDao;
import javaClasses.Customer;
import java.sql.SQLException;
import java.util.List;

public class CustomerService {
    private final CustomerDao customerDao = new CustomerDao();

    public List<Customer> listAllCustomers() throws SQLException, ClassNotFoundException {
        return customerDao.getAllCustomers();
    }

    public boolean addCustomer(Customer customer) throws SQLException, ClassNotFoundException {        // Here you can add validation or business logic before adding
        customerDao.addCustomer(customer);
        return true; 
    }

    public boolean updateCustomer(Customer customer) throws SQLException, ClassNotFoundException {
        customerDao.updateCustomer(customer);
        return true;
    }

    public boolean deleteCustomer(int id) throws SQLException, ClassNotFoundException {
        customerDao.deleteCustomer(id);
        return true;
    }

    public Customer getCustomerById(int id) throws SQLException, ClassNotFoundException {
        return customerDao.getCustomerById(id);
    }
}
