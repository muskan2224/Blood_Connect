
package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BloodRequestDao;

@WebServlet("/BloodRequestServe")
public class BloodRequestServe extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Check login
        HttpSession session =
                request.getSession(false);

        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        String requesterId =
                (String) session.getAttribute("userId");

        // Get form values
        String donorId =
                request.getParameter("donorId");

        String bloodGroup =
                request.getParameter("bloodGroup");

        String durationText =
                request.getParameter("neededInHours");

        String minAgeText =
                request.getParameter("minAge");

        String maxAgeText =
                request.getParameter("maxAge");

        String requesterCity =
                request.getParameter("requesterCity");

        try {

            // Duration
            int neededInHours =
                    Integer.parseInt(durationText);

            // Minimum age
            Integer minAge = null;

            if (minAgeText != null &&
                !minAgeText.trim().isEmpty()) {

                minAge =
                        Integer.parseInt(minAgeText);
            }

            // Maximum age
            Integer maxAge = null;

            if (maxAgeText != null &&
                !maxAgeText.trim().isEmpty()) {

                maxAge =
                        Integer.parseInt(maxAgeText);
            }

            // Basic validation
            if (neededInHours <= 0) {

                request.setAttribute(
                        "errorMessage",
                        "Required time must be greater than 0."
                );

                request.getRequestDispatcher(
                        "SearchDonor.jsp"
                ).forward(request, response);

                return;
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

            // Send request to DAO
            BloodRequestDao dao =
                    new BloodRequestDao();

            int requestId =
                    dao.sendRequest(
                            requesterId,
                            donorId,
                            bloodGroup,
                            neededInHours,
                            minAge,
                            maxAge,
                            requesterCity
                    );

            if (requestId > 0) {

                request.setAttribute(
                        "message",
                        "Blood request sent successfully."
                );

                request.setAttribute(
                        "requestId",
                        requestId
                );

                request.getRequestDispatcher(
                        "RequestSent.jsp"
                ).forward(request, response);

            } else {

                String message =
                        "Unable to send blood request.";

                if (requestId == -2) {
                    message =
                        "The donor is currently unavailable.";
                }
                else if (requestId == -3) {
                    message =
                        "Blood group does not match.";
                }
                else if (requestId == -4) {
                    message =
                        "You cannot request blood from yourself.";
                }

                request.setAttribute(
                        "errorMessage",
                        message
                );

                request.getRequestDispatcher(
                        "SearchDonor.jsp"
                ).forward(request, response);
            }

        } catch (NumberFormatException e) {

            request.setAttribute(
                    "errorMessage",
                    "Please enter valid duration and age values."
            );

            request.getRequestDispatcher(
                    "SearchDonor.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Unable to send blood request."
            );

            request.getRequestDispatcher(
                    "Error.jsp"
            ).forward(request, response);
        }
    }
}
