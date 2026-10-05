package controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SearchDonorDao;

@WebServlet("/SearchDonorServe")
public class SearchDonorServe extends HttpServlet {

    private static final long serialVersionUID = 1L;

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

        /*
         * Check whether the user is restricted.
         */
        String accountStatus = null;

        try {

            dao.RegisterDao registerDao =
                    new dao.RegisterDao();

            /*
             * We will add this check properly when we build
             * the request DAO. For now the search itself is
             * allowed.
             */

        } catch (Exception e) {
            e.printStackTrace();
        }

        String bloodGroup =
                request.getParameter("bloodGroup");

        String city =
                request.getParameter("city");

        String minAgeText =
                request.getParameter("minAge");

        String maxAgeText =
                request.getParameter("maxAge");

        Integer minAge = null;
        Integer maxAge = null;

        try {

            if (minAgeText != null &&
                !minAgeText.trim().isEmpty()) {

                minAge = Integer.parseInt(minAgeText);
            }

            if (maxAgeText != null &&
                !maxAgeText.trim().isEmpty()) {

                maxAge = Integer.parseInt(maxAgeText);
            }

            if (minAge != null && minAge < 18) {
                request.setAttribute(
                    "errorMessage",
                    "Minimum age cannot be below 18."
                );

                request.getRequestDispatcher(
                    "SearchDonor.jsp"
                ).forward(request, response);

                return;
            }

            if (maxAge != null && maxAge < 18) {
                request.setAttribute(
                    "errorMessage",
                    "Maximum age cannot be below 18."
                );

                request.getRequestDispatcher(
                    "SearchDonor.jsp"
                ).forward(request, response);

                return;
            }

            if (minAge != null &&
                maxAge != null &&
                minAge > maxAge) {

                request.setAttribute(
                    "errorMessage",
                    "Minimum age cannot be greater than maximum age."
                );

                request.getRequestDispatcher(
                    "SearchDonor.jsp"
                ).forward(request, response);

                return;
            }

            SearchDonorDao dao =
                    new SearchDonorDao();

            ResultSet rs =
                    dao.searchDonors(
                        bloodGroup,
                        city,
                        minAge,
                        maxAge
                    );

            request.setAttribute("donors", rs);

            request.getRequestDispatcher(
                "SearchDonor.jsp"
            ).forward(request, response);

        } catch (NumberFormatException e) {

            request.setAttribute(
                "errorMessage",
                "Please enter valid age values."
            );

            request.getRequestDispatcher(
                "SearchDonor.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                "errorMessage",
                "Unable to search donors."
            );

            request.getRequestDispatcher(
                "Error.jsp"
            ).forward(request, response);
        }
    }
}