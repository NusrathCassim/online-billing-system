package javaClasses;

import java.sql.Timestamp;
import java.util.List;

public class BillSummary extends Bill {
    private Timestamp summaryGeneratedAt;

    public BillSummary(int id, int customerId, Timestamp billDate,
                       List<BillItem> items, double totalAmount) {
        super(id, customerId, billDate, items, totalAmount);
        this.summaryGeneratedAt = new Timestamp(System.currentTimeMillis());
    }

    // Getter + Setter
    public Timestamp getSummaryGeneratedAt() {
        return summaryGeneratedAt;
    }

    public void setSummaryGeneratedAt(Timestamp summaryGeneratedAt) {
        this.summaryGeneratedAt = summaryGeneratedAt;
    }
}
