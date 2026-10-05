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

@WebServlet("/UpdateProfileServe")
public class UpdateProfileServe extends HttpServlet {


private static final long serialVersionUID = 1L;

protected void doGet(HttpServletRequest request,
                     HttpServletResponse response)
        throws ServletException, IOException {

    HttpSession session =
            request.getSession(false);

    if (session == null ||
        session.getAttribute("userId") == null) {

        response.sendRedirect("login.jsp");
        return;
    }

    String userId =
            (String) session.getAttribute("userId");

    ProfileDao dao =
            new ProfileDao();

    ResultSet rs =
            dao.getProfile(userId);

    try {

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

            request.getRequestDispatcher(
                    "UpdateProfile.jsp"
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

protected void doPost(HttpServletRequest request,
                      HttpServletResponse response)
        throws ServletException, IOException {

    HttpSession session =
            request.getSession(false);

    if (session == null ||
        session.getAttribute("userId") == null) {

        response.sendRedirect("login.jsp");
        return;
    }

    String userId =
            (String) session.getAttribute("userId");

    String name =
            request.getParameter("name");

    String age =
            request.getParameter("age");

    String gender =
            request.getParameter("gender");

    String phone =
            request.getParameter("phone");

    String city =
            request.getParameter("city");

    if (name == null || name.trim().isEmpty() ||
        age == null || age.trim().isEmpty() ||
        gender == null || gender.trim().isEmpty() ||
        phone == null || phone.trim().isEmpty() ||
        city == null || city.trim().isEmpty()) {

        request.setAttribute(
                "errorMessage",
                "Please fill in all profile details."
        );

        request.getRequestDispatcher(
                "Error.jsp"
        ).forward(request, response);

        return;
    }

    try {

        int ageValue =
                Integer.parseInt(age);

        if (ageValue <= 0) {

            request.setAttribute(
                    "errorMessage",
                    "Please enter a valid age."
            );

            request.getRequestDispatcher(
                    "Error.jsp"
            ).forward(request, response);

            return;
        }

        ProfileDao dao =
                new ProfileDao();

        boolean updated =
                dao.updateProfile(
                        userId,
                        name.trim(),
                        ageValue,
                        gender,
                        phone.trim(),
                        city.trim()
                );

        if (updated) {

            response.sendRedirect(
                    "ProfileServe"
            );

        } else {

            request.setAttribute(
                    "errorMessage",
                    "Profile update failed. Please try again."
            );

            request.getRequestDispatcher(
                    "Error.jsp"
            ).forward(request, response);
        }

    } catch (NumberFormatException e) {

        request.setAttribute(
                "errorMessage",
                "Please enter a valid age."
        );

        request.getRequestDispatcher(
                "Error.jsp"
        ).forward(request, response);

    } catch (Exception e) {

        e.printStackTrace();

        request.setAttribute(
                "errorMessage",
                "Unable to update profile."
        );

        request.getRequestDispatcher(
                "Error.jsp"
        ).forward(request, response);
    }
}


}
