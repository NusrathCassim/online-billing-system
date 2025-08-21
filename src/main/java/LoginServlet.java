import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javaClasses.userClass;
import dao.UserDao;
import javaClasses.SessionManager;

@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create user object
        userClass user = new userClass();
        user.setUsername(username);
        user.setPassword(password);

        // Validate user from DAO
        UserDao userDao = new UserDao();
        boolean isValid = userDao.validate(user);

        if (isValid) {
            HttpSession session = request.getSession();

            // set session attributes via SessionManager
            SessionManager.setUserSession(session, username, user.getRole());

            // store full user object too (optional)
            session.setAttribute("loggedUser", user);

            response.sendRedirect("JSP/mainDashboard.jsp");
        } else {
            response.sendRedirect("login.jsp?error=invalid");
        }
    }
}
