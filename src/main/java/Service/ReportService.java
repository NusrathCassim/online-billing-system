package Service;

import dao.ReportDAO;
import javaClasses.ReportSummary;

import java.sql.SQLException;
import java.util.List;

public class ReportService {
    private ReportDAO reportDAO;

    public ReportService() {
        this.reportDAO = new ReportDAO();
    }

    public List<ReportSummary> getReportSummaries() throws SQLException, ClassNotFoundException {
        return reportDAO.getAllReports();
    }

    public List<ReportSummary> getBills() throws SQLException, ClassNotFoundException {
        return reportDAO.getAllReports();
    }
}
