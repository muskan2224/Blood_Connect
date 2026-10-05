
package controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MyBloodRequestsDao;

@WebServlet("/MyBloodRequestsServe")
public class MyBloodRequestsServe extends HttpServlet {

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

        String requesterId =
                (String) session.getAttribute("userId");

        MyBloodRequestsDao dao =
                new MyBloodRequestsDao();

        ResultSet rs =
                dao.getMyRequests(requesterId);

        request.setAttribute(
                "myRequests",
                rs
        );

        request.getRequestDispatcher(
                "MyBloodRequests.jsp"
        ).forward(request, response);
    }
}
