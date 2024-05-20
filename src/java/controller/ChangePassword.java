package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import dal.AcountDBContext;
import model.Account;

@WebServlet(name = "ChangePassword", urlPatterns = {"/ChangePassword"})
public class ChangePassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("changepassword.jsp");
        // Retrieve parameters from the request
        String username = request.getParameter("username");
        String newPassword = request.getParameter("newPassword");

        try (PrintWriter out = response.getWriter()) {
            // Perform password update operation
            AcountDBContext dbContext = new AcountDBContext();
            dbContext.changePassword(username, newPassword);

            // Display success message
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Password Changed</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Password changed successfully!</h1>");
            out.println("</body>");
            out.println("</html>");
        } catch (Exception ex) {
            // Display error message if an exception occurs
            try (PrintWriter out = response.getWriter()) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Error</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Error occurred: " + ex.getMessage() + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }
        }
    }

    // Other methods...
}
