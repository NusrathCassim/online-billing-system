//package Servlet;
//
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.RequestDispatcher;
//import org.junit.jupiter.api.BeforeEach;
//import org.junit.jupiter.api.Test;
//import org.mockito.Mockito;
//
//import java.io.PrintWriter;
//import java.io.StringWriter;
//import static org.junit.jupiter.api.Assertions.assertFalse;
//import static org.junit.jupiter.api.Assertions.assertTrue;
//
//import static org.mockito.Mockito.*;
//
//public class CustomerServletTest {
//
//    private HttpServletRequest request;
//    private HttpServletResponse response;
//    private CustomerServlet servlet;
//
//    @BeforeEach
//    void setUp() {
//        request = mock(HttpServletRequest.class);
//        response = mock(HttpServletResponse.class);
//        servlet = new CustomerServlet();
//    }
//
//    @Test
//    void testDoPost_AddCustomer() throws Exception {
//        // Arrange: mock request params
//        when(request.getParameter("id")).thenReturn("101");
//        when(request.getParameter("name")).thenReturn("Alice");
//        when(request.getParameter("email")).thenReturn("alice@example.com");
//        when(request.getParameter("phone")).thenReturn("1234567890");
//
//        // Capture servlet response output
//        StringWriter stringWriter = new StringWriter();
//        PrintWriter writer = new PrintWriter(stringWriter);
//        when(response.getWriter()).thenReturn(writer);
//
//        // Act
//        servlet.doPost(request, response);
//
//        // Assert: verify servlet wrote something expected
//        writer.flush();
//        String output = stringWriter.toString();
//        assertFalse(output.contains("Alice"));   // Example check
//    }
//
//    @Test
//    void testDoGet_ForwardToJsp() throws Exception {
//        // Arrange
//        RequestDispatcher dispatcher = mock(RequestDispatcher.class);
//        when(request.getRequestDispatcher("JSP/CustomerList.jsp")).thenReturn(dispatcher);
//
//        // Act
//        servlet.doGet(request, response);
//
//        // Assert: verify it forwards to JSP
//        verify(dispatcher).forward(request, response);
//    }
//}
