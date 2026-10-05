<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.sql.ResultSet" %>


<%

    if (session.getAttribute("userId") == null ||
        !"ADMIN".equals(
            session.getAttribute("role")
        )) {

        response.sendRedirect(
                "Login.jsp"
        );

        return;
    }


    ResultSet donors =
            (ResultSet) request.getAttribute(
                    "donors"
            );


    ResultSet requests =
            (ResultSet) request.getAttribute(
                    "requests"
            );

%>


<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>
Admin Dashboard | Emergency Blood Donor Finder
</title>

<meta name="viewport"
      content="width=device-width, initial-scale=1">


<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">


<style>

body {

    margin: 0;

    background: #f5f7fb;

    font-family: Arial, sans-serif;

    color: #222;
}


.navbar {

    background:
        linear-gradient(
            90deg,
            #9b111e,
            #d62828
        );

    padding:
        16px 6%;
}


.brand {

    color: white !important;

    font-size: 22px;

    font-weight: 800;
}


.admin-badge {

    background:
        rgba(255,255,255,.15);

    color: white;

    padding:
        7px 13px;

    border-radius: 20px;

    font-size: 13px;

    margin-right: 20px;
}


.logout {

    color: white !important;

    font-weight: 600;

    text-decoration: none;
}


.page {

    padding:
        35px 5%;
}


.title {

    color: #9b111e;

    font-weight: 800;
}


.subtitle {

    color: #777;
}


.card {

    border: 0;

    border-radius: 16px;

    box-shadow:
        0 8px 28px
        rgba(0,0,0,.07);
}


.section-title {

    color: #9b111e;

    font-weight: 800;
}


.table thead th {

    background: #fff0f0;

    color: #8f101b;

    border: 0;
}


.table td,
.table th {

    vertical-align: middle;
}


.badge-available {

    background: #198754;

    color: white;
}


.badge-pending {

    background: #ffc107;

    color: #222;
}


.badge-accepted {

    background: #198754;

    color: white;
}


.badge-rejected {

    background: #6c757d;

    color: white;
}


.empty {

    padding: 30px;

    text-align: center;

    color: #888;
}

</style>

</head>


<body>


<!-- ================================================= -->
<!-- NAVBAR -->
<!-- ================================================= -->


<nav class="navbar">


    <a class="brand"
       href="AdminDashboardServe">

        Emergency Blood Donor Finder

    </a>


    <div class="ml-auto">


        <span class="admin-badge">

            ADMIN PANEL

        </span>


        <a href="LogoutServe"
           class="logout">

            Logout

        </a>


    </div>


</nav>



<div class="page">


<!-- ================================================= -->
<!-- TITLE -->
<!-- ================================================= -->


<div class="mb-4">


    <h1 class="title">

        Admin Dashboard

    </h1>


    <p class="subtitle">

        Monitor registered donors and
        blood requests from one place.

    </p>


</div>



<!-- ================================================= -->
<!-- DONOR LIST -->
<!-- ================================================= -->


<div class="card p-4 mb-4">


    <h4 class="section-title mb-3">

        Available Blood Donors

    </h4>


    <% if (donors != null) { %>


    <div class="table-responsive">


    <table class="table table-hover">


    <thead>


    <tr>

        <th>User ID</th>

        <th>Name</th>

        <th>Blood Group</th>

        <th>Age</th>

        <th>Gender</th>

        <th>Phone</th>

        <th>City</th>

        <th>Status</th>

    </tr>


    </thead>


    <tbody>


    <%

        boolean hasDonors = false;


        while (donors.next()) {

            hasDonors = true;

    %>


    <tr>


        <td>

            <%= donors.getString(
                    "user_id"
               ) %>

        </td>


        <td>

            <%= donors.getString(
                    "name"
               ) %>

        </td>


        <td>

            <strong>

                <%= donors.getString(
                        "blood_group"
                   ) %>

            </strong>

        </td>


        <td>

            <%= donors.getInt(
                    "age"
               ) %>

        </td>


        <td>

            <%= donors.getString(
                    "gender"
               ) %>

        </td>


        <td>

            <%= donors.getString(
                    "phone"
               ) %>

        </td>


        <td>

            <%= donors.getString(
                    "city"
               ) %>

        </td>


        <td>

            <span class="badge badge-available">

                AVAILABLE

            </span>

        </td>


    </tr>


    <% } %>


    <% if (!hasDonors) { %>


    <tr>

        <td colspan="8"
            class="empty">

            No active donors are currently
            available.

        </td>

    </tr>


    <% } %>


    </tbody>


    </table>


    </div>


    <% } else { %>


        <div class="alert alert-danger">

            Unable to load donor list.

        </div>


    <% } %>


</div>



<!-- ================================================= -->
<!-- BLOOD REQUEST LIST -->
<!-- ================================================= -->


<div class="card p-4">


    <h4 class="section-title mb-3">

        Blood Requestors / Requests

    </h4>


    <% if (requests != null) { %>


    <div class="table-responsive">


    <table class="table table-hover">


    <thead>


    <tr>

        <th>Request ID</th>

        <th>Requestor</th>

        <th>Phone</th>

        <th>Blood Group</th>

        <th>City</th>

        <th>Request Date</th>

        <th>Donor</th>

        <th>Status</th>

    </tr>


    </thead>


    <tbody>


    <%

        boolean hasRequests = false;


        while (requests.next()) {

            hasRequests = true;


            String status =
                    requests.getString(
                            "status"
                    );


            String badge;


            if ("PENDING".equalsIgnoreCase(
                    status)) {

                badge = "badge-pending";

            } else if ("ACCEPTED".equalsIgnoreCase(
                    status)) {

                badge = "badge-accepted";

            } else {

                badge = "badge-rejected";
            }

    %>


    <tr>


        <td>

            <%= requests.getInt(
                    "request_id"
               ) %>

        </td>


        <td>

            <%= requests.getString(
                    "requester_name"
               ) %>

        </td>


        <td>

            <%= requests.getString(
                    "requester_phone"
               ) %>

        </td>


        <td>

            <strong>

                <%= requests.getString(
                        "blood_group"
                   ) %>

            </strong>

        </td>


        <td>

            <%= requests.getString(
                    "requester_city"
               ) %>

        </td>


        <td>

            <%= requests.getDate(
                    "request_date"
               ) %>

        </td>


        <td>

        <%

            String donorName =
                    requests.getString(
                            "donor_name"
                    );


            if (donorName == null) {

        %>

            Not accepted yet

        <%

            } else {

        %>

            <%= donorName %>

        <%

            }

        %>


        </td>


        <td>


            <span class="badge <%= badge %>">

                <%= status %>

            </span>


        </td>


    </tr>


    <% } %>


    <% if (!hasRequests) { %>


    <tr>

        <td colspan="8"
            class="empty">

            No blood requests have been
            submitted yet.

        </td>

    </tr>


    <% } %>


    </tbody>


    </table>


    </div>


    <% } else { %>


        <div class="alert alert-danger">

            Unable to load request list.

        </div>


    <% } %>


</div>


</div>


</body>

</html>