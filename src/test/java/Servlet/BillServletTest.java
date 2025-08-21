//package Servlet;
//
//import jakarta.servlet.RequestDispatcher;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import org.junit.jupiter.api.BeforeEach;
//import org.junit.jupiter.api.Test;
//import org.mockito.Mockito;
//
//import static org.mockito.Mockito.*;
//
//class BillServletTest {
//
//    private HttpServletRequest request;
//    private HttpServletResponse response;
//    private RequestDispatcher dispatcher;
//    private BillServlet servlet;
//
//    @BeforeEach
//    void setUp() {
//        request = mock(HttpServletRequest.class);
//        response = mock(HttpServletResponse.class);
//        dispatcher = mock(RequestDispatcher.class);
//        servlet = new BillServlet();
//    }
//
//    @Test
//    void testDoGet_ForwardToJsp() throws Exception {
//        // Arrange
//        when(request.getRequestDispatcher("JSP/Billing/BillCreation.jsp")).thenReturn(dispatcher);
//
//        // Act
//        servlet.doGet(request, response);
//
//        // Assert
//        verify(request).getRequestDispatcher("JSP/Billing/BillCreation.jsp");
//        verify(dispatcher).forward(request, response);
//    }
//
//    @Test
//    void testNoItems() throws Exception {
//        when(request.getParameter("customerId")).thenReturn("1");
//        when(request.getParameter("items")).thenReturn("[]");
//        when(request.getRequestDispatcher("JSP/Billing/BillCreation.jsp")).thenReturn(dispatcher);
//
//        servlet.doPost(request, response);
//
//        verify(request).setAttribute(eq("error"), contains("Cannot create bill without items"));
//        verify(dispatcher).forward(request, response);
//    }
//}
