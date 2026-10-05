package controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MyRequestsDao;

@WebServlet("/MyRequestsServe")
public class MyRequestsServe extends HttpServlet {


private static final long serialVersionUID = 1L;

protected void doGet(HttpServletRequest request,
                     HttpServletResponse response)
        throws ServletException, IOException {

    HttpSession session =
            request.getSession(false);

    if (session == null ||
        session.getAttribute("userId") == null) {

        response.sendRedirect("Login.jsp");
        return;
    }

    String donorId =
            (String) session.getAttribute("userId");

    System.out.println(
            "MyRequestsServe - Logged in donor: "
            + donorId
    );

    try {

        MyRequestsDao dao =
                new MyRequestsDao();

        ResultSet rs =
                dao.getRequests(donorId);

        if (rs == null) {

            request.setAttribute(
                    "errorMessage",
                    "Unable to load requests from database."
            );

            request.getRequestDispatcher(
                    "Error.jsp"
            ).forward(
                    request,
                    response
            );

            return;
        }

        /*
         * IMPORTANT:
         * The JSP must use the same attribute name.
         */
        request.setAttribute(
                "requests",
                rs
        );

        request.getRequestDispatcher(
                "MyRequests.jsp"
        ).forward(
                request,
                response
        );

    } catch (Exception e) {

        e.printStackTrace();

        request.setAttribute(
                "errorMessage",
                "Unable to load requests."
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
