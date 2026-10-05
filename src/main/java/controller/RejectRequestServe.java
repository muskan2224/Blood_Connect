package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RejectRequestDao;

@WebServlet("/RejectRequestServe")
public class RejectRequestServe
        extends HttpServlet {

    private static final long serialVersionUID = 1L;


    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {


        // =================================================
        // CHECK LOGIN
        // =================================================

        HttpSession session =
                request.getSession(false);


        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect(
                    "Login.jsp"
            );

            return;
        }


        try {

            int requestId =
                    Integer.parseInt(
                            request.getParameter(
                                    "requestId"
                            )
                    );


            String donorId =
                    (String) session.getAttribute(
                            "userId"
                    );


            RejectRequestDao dao =
                    new RejectRequestDao();


            boolean rejected =
                    dao.rejectRequest(
                            requestId,
                            donorId
                    );


            if (rejected) {

                response.sendRedirect(
                        "MyRequestsServe"
                );


            } else {

                request.setAttribute(
                        "errorMessage",
                        "This request could not be rejected. It may already have been processed."
                );


                request.getRequestDispatcher(
                        "Error.jsp"
                ).forward(
                        request,
                        response
                );
            }


        } catch (Exception e) {

            e.printStackTrace();


            request.setAttribute(
                    "errorMessage",
                    "Unable to process the request rejection."
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