package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RegisterDao;

@WebServlet("/LoginServe")
public class LoginServe extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {


        String userId =
                request.getParameter("userId");

        String password =
                request.getParameter("password");


        // =================================================
        // VALIDATION
        // =================================================

        if (userId == null ||
            password == null ||
            userId.trim().isEmpty() ||
            password.trim().isEmpty()) {

            request.setAttribute(
                    "errorMessage",
                    "Please enter User ID and Password."
            );

            request.getRequestDispatcher(
                    "Login.jsp"
            ).forward(request, response);

            return;
        }


        // =================================================
        // ADMIN LOGIN
        // =================================================

        if (userId.equals("admin") &&
            password.equals("admin")) {

            HttpSession session =
                    request.getSession();

            session.setAttribute(
                    "userId",
                    "admin"
            );

            session.setAttribute(
                    "role",
                    "ADMIN"
            );

            response.sendRedirect(
                    "AdminDashboardServe"
            );

            return;
        }


        // =================================================
        // NORMAL USER LOGIN
        // =================================================

        RegisterDao dao =
                new RegisterDao();


        if (dao.checkLogin(userId, password)) {

            HttpSession session =
                    request.getSession();

            session.setAttribute(
                    "userId",
                    userId
            );

            session.setAttribute(
                    "role",
                    "USER"
            );

            response.sendRedirect(
                    "Dashboard.jsp"
            );

        } else {

            request.setAttribute(
                    "errorMessage",
                    "Invalid User ID or Password."
            );

            request.getRequestDispatcher(
                    "Login.jsp"
            ).forward(request, response);
        }
    }
}