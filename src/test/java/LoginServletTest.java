//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import org.junit.jupiter.api.BeforeEach;
//import org.junit.jupiter.api.Test;
//import org.mockito.Mockito;
//
//import java.io.PrintWriter;
//import java.io.StringWriter;
//
//import static org.junit.jupiter.api.Assertions.*;
//
//public class LoginServletTest extends Mockito {
//
//    private LoginServlet loginServlet;
//    private HttpServletRequest request;
//    private HttpServletResponse response;
//    private HttpSession session;
//
//    @BeforeEach
//    public void setUp() {
//        loginServlet = new LoginServlet();
//        request = mock(HttpServletRequest.class);
//        response = mock(HttpServletResponse.class);
//        session = mock(HttpSession.class);
//    }
//
//    @Test
//    public void testValidAdminLogin() throws Exception {
//        when(request.getParameter("username")).thenReturn("admin");
//        when(request.getParameter("password")).thenReturn("admin123");
//        when(request.getSession()).thenReturn(session);
//
//        StringWriter sw = new StringWriter();
//        PrintWriter pw = new PrintWriter(sw);
//        when(response.getWriter()).thenReturn(pw);
//
//        loginServlet.doPost(request, response);
//
//        pw.flush(); // flush the writer
//        String output = sw.toString();
//        // You can assert redirect or message
//        // For example, if servlet sets attribute on session:
//        verify(session).setAttribute("role", "admin");
//        // Or if you redirect:
//      verify(response).sendRedirect("JSP/mainDashboard.jsp");
//
//    }
//
//    @Test
//    public void testInvalidLogin() throws Exception {
//        when(request.getParameter("username")).thenReturn("wronguser");
//        when(request.getParameter("password")).thenReturn("wrongpass");
//        when(request.getSession()).thenReturn(session);
//
//        StringWriter sw = new StringWriter();
//        PrintWriter pw = new PrintWriter(sw);
//        when(response.getWriter()).thenReturn(pw);
//
//        loginServlet.doPost(request, response);
//
//        pw.flush();
//        String output = sw.toString();
//        assertFalse(output.contains("Invalid username or password"));
//    }
//
//    @Test
//    public void testBlankFields() throws Exception {
//        when(request.getParameter("username")).thenReturn("");
//        when(request.getParameter("password")).thenReturn("");
//        when(request.getSession()).thenReturn(session);
//
//        StringWriter sw = new StringWriter();
//        PrintWriter pw = new PrintWriter(sw);
//        when(response.getWriter()).thenReturn(pw);
//
//        loginServlet.doPost(request, response);
//
//        pw.flush();
//        String output = sw.toString();
//        assertFalse(output.contains("Username and password cannot be blank"));
//    }
//}
