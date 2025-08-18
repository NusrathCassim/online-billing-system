package Service;

import dao.BillDao;
import javaClasses.Bill;
import javaClasses.BillItem;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public class BillService {
    private final BillDao billDao = new BillDao();

    /**
     * Creates a bill with items and returns the generated bill ID.
     * Returns -1 if something fails.
     */
    public int createBill(int customerId, List<BillItem> items) throws SQLException, ClassNotFoundException {
    double total = 0;
    for (BillItem i : items) {
        total += i.getTotalPrice();
    }
    Bill bill = new Bill(0, customerId, new Date(), items, total);

    try {
        int billId = billDao.insertBill(bill);      // Insert bill
        billDao.insertBillItems(billId, items);     // Insert bill items
        billDao.updateItemQuantities(items);        // Reduce stock
        return billId;
    } catch (SQLException e) {
        e.printStackTrace();
        return -1;
    }
}

    
}
