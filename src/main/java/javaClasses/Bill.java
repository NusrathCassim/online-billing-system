/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
// Bill.java
package javaClasses;

import java.util.Date;
import java.util.List;

public class Bill {
    public int id;
    public int customerId;
    public Date billDate;
    public List<BillItem> items;
    public double totalAmount;

    public Bill() {}

    public Bill(int id, int customerId, Date billDate, List<BillItem> items, double totalAmount) {
        this.id = id;
        this.customerId = customerId;
        this.billDate = billDate;
        this.items = items;
        this.totalAmount = totalAmount;
    }

    // getters and setters...

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public Date getBillDate() {
        return billDate;
    }

    public void setBillDate(Date billDate) {
        this.billDate = billDate;
    }

    public List<BillItem> getItems() {
        return items;
    }

    public void setItems(List<BillItem> items) {
        this.items = items;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }
}
