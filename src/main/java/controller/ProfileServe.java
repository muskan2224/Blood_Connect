package controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProfileDao;

@WebServlet("/ProfileServe")
public class ProfileServe extends HttpServlet {


private static final long serialVersionUID = 1L;

protected void doGet(HttpServletRequest request,
                      HttpServletResponse response)
        throws ServletException, IOException {

    HttpSession session = request.getSession(false);

    if (session == null ||
        session.getAttribute("userId") == null) {

        response.sendRedirect("login.jsp");
        return;
    }

    String userId =
            (String) session.getAttribute("userId");

    try {

        ProfileDao dao = new ProfileDao();

        dao.updateAvailability(userId);

        ResultSet rs =
                dao.getProfile(userId);

        if (rs != null && rs.next()) {

            request.setAttribute(
                    "userId",
                    rs.getString("user_id")
            );

            request.setAttribute(
                    "name",
                    rs.getString("name")
            );

            request.setAttribute(
                    "age",
                    rs.getInt("age")
            );

            request.setAttribute(
                    "gender",
                    rs.getString("gender")
            );

            request.setAttribute(
                    "phone",
                    rs.getString("phone")
            );

            request.setAttribute(
                    "city",
                    rs.getString("city")
            );

            String donorId =
                    rs.getString("donor_id");

            request.setAttribute(
                    "donorId",
                    donorId
            );

            request.setAttribute(
                    "bloodGroup",
                    rs.getString("blood_group")
            );

            request.setAttribute(
                    "lastDonationDate",
                    rs.getDate("last_donation_date")
            );

            request.setAttribute(
                    "availableFrom",
                    rs.getDate("available_from")
            );

            request.setAttribute(
                    "status",
                    rs.getString("status")
            );

            request.getRequestDispatcher(
                    "Profile.jsp"
            ).forward(request, response);

        } else {

            request.setAttribute(
                    "errorMessage",
                    "Profile information could not be found."
            );

            request.getRequestDispatcher(
                    "Error.jsp"
            ).forward(request, response);
        }

    } catch (Exception e) {

        e.printStackTrace();

        request.setAttribute(
                "errorMessage",
                "Unable to load profile."
        );

        request.getRequestDispatcher(
                "Error.jsp"
        ).forward(request, response);
    }
}


}
