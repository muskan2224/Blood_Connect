package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RegisterDao;

@WebServlet("/RegisterServe")
public class RegisterServe extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {


        // =================================================
        // GET FORM DATA
        // =================================================

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

        String bloodGroup =
                request.getParameter("bloodGroup");

        String password =
                request.getParameter("password");

        String confirmPassword =
                request.getParameter("confirmPassword");


        // =================================================
        // BASIC VALIDATION
        // =================================================

        if (name == null ||
            name.trim().isEmpty() ||

            age == null ||
            age.trim().isEmpty() ||

            gender == null ||
            gender.trim().isEmpty() ||

            phone == null ||
            phone.trim().isEmpty() ||

            city == null ||
            city.trim().isEmpty() ||

            bloodGroup == null ||
            bloodGroup.trim().isEmpty() ||

            password == null ||
            password.trim().isEmpty()) {

            request.setAttribute(
                    "errorMessage",
                    "Please fill in all required fields."
            );

            request.getRequestDispatcher(
                    "Register.jsp"
            ).forward(request, response);

            return;
        }


        // =================================================
        // PASSWORD CHECK
        // =================================================

        if (!password.equals(confirmPassword)) {

            request.setAttribute(
                    "errorMessage",
                    "Passwords do not match. Please enter the same password in both fields."
            );

            request.getRequestDispatcher(
                    "Register.jsp"
            ).forward(request, response);

            return;
        }


        try {

            // =================================================
            // AGE CHECK
            // =================================================

            int ageValue =
                    Integer.parseInt(age);

            if (ageValue < 18) {

                request.setAttribute(
                        "errorMessage",
                        "Donor registration is allowed only for users aged 18 or above."
                );

                request.getRequestDispatcher(
                        "Register.jsp"
                ).forward(request, response);

                return;
            }


            // =================================================
            // PHONE CHECK
            // =================================================

            if (!phone.matches("[0-9]{10}")) {

                request.setAttribute(
                        "errorMessage",
                        "Please enter a valid 10-digit phone number."
                );

                request.getRequestDispatcher(
                        "Register.jsp"
                ).forward(request, response);

                return;
            }


            RegisterDao dao =
                    new RegisterDao();


            // =================================================
            // CHECK 3-MONTH COOLDOWN
            // =================================================

            Date eligibleDate =
                    dao.getCooldownDate(phone);

            if (eligibleDate != null) {

                request.setAttribute(
                        "eligibleDate",
                        eligibleDate.toString()
                );

                request.getRequestDispatcher(
                        "DonorCooldown.jsp"
                ).forward(request, response);

                return;
            }


            // =================================================
            // REGISTER DONOR
            // =================================================

            String userId =
                    dao.registerUser(
                            name,
                            ageValue,
                            gender,
                            phone,
                            city,
                            bloodGroup,
                            password
                    );


            // =================================================
            // SUCCESS
            // =================================================

            if (userId != null) {

                response.sendRedirect(
                        "RegistrationSuccess.jsp?userId="
                                + userId
                );

            } else {

                // Check again in case cooldown was created
                // by another request.

                Date retryDate =
                        dao.getCooldownDate(phone);

                if (retryDate != null) {

                    request.setAttribute(
                            "eligibleDate",
                            retryDate.toString()
                    );

                    request.getRequestDispatcher(
                            "DonorCooldown.jsp"
                    ).forward(request, response);

                } else {

                    request.setAttribute(
                            "errorMessage",
                            "Registration failed. Please check your details and try again."
                    );

                    request.getRequestDispatcher(
                            "Register.jsp"
                    ).forward(request, response);
                }
            }


        } catch (NumberFormatException e) {

            request.setAttribute(
                    "errorMessage",
                    "Please enter a valid age."
            );

            request.getRequestDispatcher(
                    "Register.jsp"
            ).forward(request, response);


        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "A system error occurred. Please try again later."
            );

            request.getRequestDispatcher(
                    "Error.jsp"
            ).forward(request, response);
        }
    }
}