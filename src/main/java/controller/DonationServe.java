package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DonationDao;

@WebServlet("/DonationServe")
public class DonationServe extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Check whether user is logged in
        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        // Get logged-in user's ID
        String userId =
                (String) session.getAttribute("userId");

        try {

            DonationDao dao = new DonationDao();

            boolean recorded =
                    dao.recordDonation(userId);

            if (recorded) {

                response.sendRedirect("DonationSuccess.jsp");

            } else {

                request.setAttribute(
                        "errorMessage",
                        "Donation could not be recorded."
                );

                request.getRequestDispatcher(
                        "Error.jsp"
                ).forward(request, response);
            }

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Unable to record donation."
            );

            request.getRequestDispatcher(
                    "Error.jsp"
            ).forward(request, response);
        }
    }
}