<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>

<%
if (session.getAttribute("userId") == null) {
response.sendRedirect("Login.jsp");
return;
}

ResultSet rs = (ResultSet) request.getAttribute("requests");

String message = (String) request.getAttribute("message");
String errorMessage = (String) request.getAttribute("errorMessage");
%>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">

<title>My Requests - Emergency Blood Donor Finder</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    min-height: 100vh;
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #fff5f5, #f7f9fc);
}

.navbar-custom {
    background: linear-gradient(90deg, #8f101b, #d62828);
    padding: 16px 6%;
}

.logo {
    color: white;
    font-size: 21px;
    font-weight: 800;
    text-decoration: none;
}

.logo:hover {
    color: white;
    text-decoration: none;
}

.nav-link-custom {
    color: white;
    margin-left: 22px;
    font-weight: 600;
    text-decoration: none;
}

.nav-link-custom:hover {
    color: #ffe5e5;
    text-decoration: none;
}

.container-main {
    width: 92%;
    max-width: 1100px;
    margin: 45px auto;
}

.heading {
    color: #8f101b;
    font-weight: 800;
    margin-bottom: 5px;
}

.subtitle {
    color: #777;
    margin-bottom: 30px;
}

.request-card {
    background: white;
    border-radius: 18px;
    padding: 28px;
    margin-bottom: 22px;
    box-shadow: 0 8px 30px rgba(0, 0, 0, .07);
    border-left: 5px solid #d62828;
}

.request-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    margin-bottom: 20px;
}

.request-id {
    color: #555;
    font-size: 14px;
    font-weight: 600;
}

.blood-group {
    display: inline-block;
    background: #fff0f0;
    color: #b71c1c;
    padding: 8px 16px;
    border-radius: 20px;
    font-weight: 800;
    font-size: 18px;
}

.requester-title {
    color: #8f101b;
    font-weight: 800;
    margin-bottom: 15px;
}

.info-row {
    margin-bottom: 9px;
    color: #555;
}

.info-label {
    font-weight: 700;
    color: #333;
}

.status-badge {
    display: inline-block;
    padding: 8px 15px;
    border-radius: 20px;
    font-size: 13px;
    font-weight: 800;
}

.status-pending {
    background: #fff3cd;
    color: #856404;
}

.status-accepted {
    background: #d1e7dd;
    color: #0f5132;
}

.status-rejected {
    background: #e2e3e5;
    color: #41464b;
}

.action-area {
    margin-top: 25px;
    padding-top: 20px;
    border-top: 1px solid #eee;
}

.action-note {
    color: #777;
    font-size: 14px;
    margin-bottom: 15px;
}

.btn-accept {
    background: #198754;
    color: white;
    border: none;
    border-radius: 9px;
    padding: 11px 22px;
    font-weight: 700;
}

.btn-accept:hover {
    background: #146c43;
    color: white;
}

.btn-reject {
    background: #dc3545;
    color: white;
    border: none;
    border-radius: 9px;
    padding: 11px 22px;
    font-weight: 700;
}

.btn-reject:hover {
    background: #b02a37;
    color: white;
}

.accepted-box {
    background: #f0fff6;
    border: 1px solid #b7e4c7;
    border-radius: 12px;
    padding: 18px;
    margin-top: 18px;
    color: #155724;
}

.rejected-box {
    background: #f8f9fa;
    border: 1px solid #dee2e6;
    border-radius: 12px;
    padding: 18px;
    margin-top: 18px;
    color: #495057;
}

.empty-box {
    background: white;
    padding: 55px 30px;
    border-radius: 18px;
    text-align: center;
    box-shadow: 0 8px 30px rgba(0, 0, 0, .06);
}

.empty-icon {
    font-size: 50px;
    margin-bottom: 15px;
}

.empty-title {
    color: #8f101b;
    font-weight: 800;
}

.empty-text {
    color: #777;
}

@media (max-width: 768px) {

    .navbar-custom {
        padding: 15px 4%;
    }

    .logo {
        font-size: 17px;
    }

    .nav-link-custom {
        margin-left: 10px;
        font-size: 13px;
    }

    .container-main {
        width: 94%;
        margin-top: 30px;
    }

    .request-card {
        padding: 20px;
    }
}
</style>

</head>

<body>

<nav class="navbar-custom">


<div class="d-flex justify-content-between align-items-center flex-wrap">

    <a href="Dashboard.jsp" class="logo">
        Emergency Blood Donor Finder
    </a>

    <div class="mt-2 mt-md-0">

        <a href="Dashboard.jsp"
           class="nav-link-custom">
            Dashboard
        </a>

        <a href="SearchDonor.jsp"
           class="nav-link-custom">
            Find Donor
        </a>

        <a href="ProfileServe"
           class="nav-link-custom">
            Profile
        </a>

        <a href="LogoutServe"
           class="nav-link-custom">
            Logout
        </a>

    </div>

</div>
```

</nav>

<div class="container-main">

```
<h1 class="heading">
    My Blood Requests
</h1>

<p class="subtitle">
    View and manage blood requests sent to you.
</p>

<% if (message != null) { %>

    <div class="alert alert-success">

        <strong>Success!</strong>
        <%= message %>

    </div>

<% } %>

<% if (errorMessage != null) { %>

    <div class="alert alert-danger">

        <strong>Error!</strong>
        <%= errorMessage %>

    </div>

<% } %>

<%

if (rs != null) {

    boolean found = false;

    while (rs.next()) {

        found = true;

        int requestId =
                rs.getInt("request_id");

        String status =
                rs.getString("status");

        String bloodGroup =
                rs.getString("blood_group");

        String requesterName =
                rs.getString("requester_name");

        String requesterPhone =
                rs.getString("requester_phone");

        String requesterCity =
                rs.getString("requester_city");

        String requestDate =
                String.valueOf(
                        rs.getDate("request_date")
                );

        if (requesterName == null) {
            requesterName = "Not available";
        }

        if (requesterPhone == null) {
            requesterPhone = "Not available";
        }

        if (requesterCity == null) {
            requesterCity = "Not available";
        }

        String statusClass =
                "status-pending";

        if ("ACCEPTED".equalsIgnoreCase(status)) {

            statusClass =
                    "status-accepted";

        } else if ("REJECTED".equalsIgnoreCase(status)) {

            statusClass =
                    "status-rejected";
        }

%>

<div class="request-card">

    <div class="request-header">

        <div>

            <div class="request-id">

                Request ID:
                <strong>#<%= requestId %></strong>

            </div>

            <div class="mt-2">

                <span class="blood-group">
                    <%= bloodGroup %>
                </span>

            </div>

        </div>

        <span class="status-badge <%= statusClass %>">

            <%= status %>

        </span>

    </div>

    <h5 class="requester-title">

        Blood Requestor Details

    </h5>

    <div class="row">

        <div class="col-md-6">

            <div class="info-row">

                <span class="info-label">
                    Name:
                </span>

                <%= requesterName %>

            </div>

        </div>

        <div class="col-md-6">

            <div class="info-row">

                <span class="info-label">
                    Phone:
                </span>

                <%= requesterPhone %>

            </div>

        </div>

        <div class="col-md-6">

            <div class="info-row">

                <span class="info-label">
                    City:
                </span>

                <%= requesterCity %>

            </div>

        </div>

        <div class="col-md-6">

            <div class="info-row">

                <span class="info-label">
                    Request Date:
                </span>

                <%= requestDate %>

            </div>

        </div>

    </div>

    <% if ("PENDING".equalsIgnoreCase(status)) { %>

    <div class="action-area">

        <p class="action-note">

            Please review the request and choose whether you can donate blood.

        </p>

        <div class="d-flex flex-wrap">

            <form action="AcceptRequestServe"
                  method="post"
                  class="mr-2 mb-2">

                <input type="hidden"
                       name="requestId"
                       value="<%= requestId %>">

                <button type="submit"
                        class="btn-accept"
                        onclick="return confirm('Are you sure you want to accept this blood request?');">

                    ✓ Accept Request

                </button>

            </form>

            <form action="RejectRequestServe"
                  method="post"
                  class="mb-2">

                <input type="hidden"
                       name="requestId"
                       value="<%= requestId %>">

                <button type="submit"
                        class="btn-reject"
                        onclick="return confirm('Are you sure you want to reject this blood request?');">

                    ✕ Reject Request

                </button>

            </form>

        </div>

    </div>

    <% } else if ("ACCEPTED".equalsIgnoreCase(status)) { %>

    <div class="accepted-box">

        <strong>
            ✓ Request Accepted
        </strong>

        <p class="mb-0 mt-2">

            You have accepted this blood request.
            Thank you for helping someone in need.

        </p>

    </div>

    <% } else if ("REJECTED".equalsIgnoreCase(status)) { %>

    <div class="rejected-box">

        <strong>
            Request Rejected
        </strong>

        <p class="mb-0 mt-2">

            You rejected this blood request.

        </p>

    </div>

    <% } %>

</div>

<%

    }

    if (!found) {

%>

<div class="empty-box">

    <div class="empty-icon">
        🩸
    </div>

    <h4 class="empty-title">

        No Blood Requests

    </h4>

    <p class="empty-text">

        You currently have no blood requests.

        <br>

        New requests will appear here when someone selects you as a donor.

    </p>

    <a href="Dashboard.jsp"
       class="btn btn-danger mt-3">

        Back to Dashboard

    </a>

</div>

<%

    }

} else {

%>

<div class="empty-box">

    <div class="empty-icon">
        ⚠️
    </div>

    <h4 class="empty-title">

        Unable to Load Requests

    </h4>

    <p class="empty-text">

        No request data was received from the server.

    </p>

    <a href="MyRequestsServe"
       class="btn btn-danger mt-3">

        Try Again

    </a>

</div>

<%

}

%>

</div>

</body>
</html>
