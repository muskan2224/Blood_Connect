package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AcceptRequestDao;

@WebServlet("/AcceptRequestServe")
public class AcceptRequestServe extends HttpServlet {

private static final long serialVersionUID = 1L;

protected void doPost(HttpServletRequest request,
                      HttpServletResponse response)
        throws ServletException, IOException {

    // Check whether donor is logged in
    HttpSession session =
            request.getSession(false);

    if (session == null ||
        session.getAttribute("userId") == null) {

        response.sendRedirect("Login.jsp");
        return;
    }

    // Get logged-in donor ID
    String donorId =
            (String) session.getAttribute("userId");

    // Get blood request ID
    String requestIdText =
            request.getParameter("requestId");

    // Check request ID
    if (requestIdText == null ||
        requestIdText.trim().isEmpty()) {

        request.setAttribute(
                "errorMessage",
                "Invalid blood request."
        );

        request.getRequestDispatcher(
                "Error.jsp"
        ).forward(
                request,
                response
        );

        return;
    }

    try {

        int requestId =
                Integer.parseInt(
                        requestIdText
                );

        AcceptRequestDao dao =
                new AcceptRequestDao();

        // Accept the request
        boolean accepted =
                dao.acceptRequest(
                        requestId,
                        donorId
                );

        if (accepted) {

            /*
             * The request has been accepted successfully.
             *
             * The DAO has already:
             * 1. Updated blood_request
             * 2. Saved donor details
             * 3. Saved the 3-month cooldown
             * 4. Rejected other pending requests
             * 5. Deleted donor record
             * 6. Deleted register/login record
             */

            // Log the donor out
            session.invalidate();

            // Show success page
            response.sendRedirect(
                    "DonationSuccess.jsp"
            );

        } else {

            request.setAttribute(
                    "errorMessage",
                    "This blood request is no longer available or has already been processed."
            );

            request.getRequestDispatcher(
                    "Error.jsp"
            ).forward(
                    request,
                    response
            );
        }

    } catch (NumberFormatException e) {

        request.setAttribute(
                "errorMessage",
                "Invalid blood request ID."
        );

        request.getRequestDispatcher(
                "Error.jsp"
        ).forward(
                request,
                response
        );

    } catch (Exception e) {

        e.printStackTrace();

        request.setAttribute(
                "errorMessage",
                "Unable to accept the blood request. Please try again."
        );

        request.getRequestDispatcher(
                "Error.jsp"
        ).forward(
                request,
                response
        );
    }
}


}
