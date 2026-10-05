<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>

<%
if (session.getAttribute("userId") == null) {
response.sendRedirect("Login.jsp");
return;
}

ResultSet rs = (ResultSet) request.getAttribute("myRequests");
String message = (String) request.getAttribute("message");
String errorMessage = (String) request.getAttribute("errorMessage");
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>My Blood Requests - Emergency Blood Donor Finder</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    min-height: 100vh;
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #fff5f5, #f7f9fc);
    color: #222;
}

/* Navbar */

.navbar-custom {
    background: linear-gradient(90deg, #8f101b, #d62828);
    padding: 16px 6%;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.10);
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

/* Main Container */

.container-main {
    width: 92%;
    max-width: 1100px;
    margin: 45px auto;
}

/* Page Heading */

.heading {
    color: #8f101b;
    font-weight: 800;
    margin-bottom: 5px;
}

.subtitle {
    color: #777;
    margin-bottom: 30px;
}

/* Request Card */

.request-card {
    background: white;
    border-radius: 18px;
    padding: 28px;
    margin-bottom: 22px;
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.07);
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

/* Blood Group */

.blood-group {
    display: inline-block;
    background: #fff0f0;
    color: #b71c1c;
    padding: 8px 16px;
    border-radius: 20px;
    font-weight: 800;
    font-size: 18px;
}

/* Donor Details */

.section-title {
    color: #8f101b;
    font-weight: 800;
    margin-bottom: 15px;
}

.info-row {
    margin-bottom: 10px;
    color: #555;
}

.info-label {
    font-weight: 700;
    color: #333;
}

/* Status */

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
    background: #f8d7da;
    color: #842029;
}

/* Accepted Box */

.accepted-box {
    background: #f0fff6;
    border: 1px solid #b7e4c7;
    border-radius: 12px;
    padding: 18px;
    margin-top: 20px;
    color: #155724;
}

/* Pending Box */

.pending-box {
    background: #fffaf0;
    border: 1px solid #ffe69c;
    border-radius: 12px;
    padding: 18px;
    margin-top: 20px;
    color: #664d03;
}

/* Rejected Box */

.rejected-box {
    background: #fff5f5;
    border: 1px solid #f1aeb5;
    border-radius: 12px;
    padding: 18px;
    margin-top: 20px;
    color: #842029;
}

/* Empty Box */

.empty-box {
    background: white;
    padding: 55px 30px;
    border-radius: 18px;
    text-align: center;
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.06);
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

/* Responsive Design */

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

    .request-header {
        align-items: flex-start;
        gap: 12px;
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
        <a href="Dashboard.jsp" class="nav-link-custom">Dashboard</a>
        <a href="SearchDonor.jsp" class="nav-link-custom">Find Donor</a>
        <a href="MyBloodRequestsServe" class="nav-link-custom">My Requests</a>
        <a href="Profile.jsp" class="nav-link-custom">Profile</a>
        <a href="LogoutServe" class="nav-link-custom">Logout</a>
    </div>
</div>


</nav>

<div class="container-main">


<h1 class="heading">My Blood Requests</h1>

<p class="subtitle">
    Track the blood requests you have made and check their current status.
</p>

<% if (message != null) { %>
    <div class="alert alert-success">
        <strong>Success!</strong> <%= message %>
    </div>
<% } %>

<% if (errorMessage != null) { %>
    <div class="alert alert-danger">
        <strong>Error!</strong> <%= errorMessage %>
    </div>
<% } %>

<%
if (rs != null) {
    boolean found = false;

    while (rs.next()) {
        found = true;

        int requestId = rs.getInt("request_id");
        String status = rs.getString("status");
        String bloodGroup = rs.getString("blood_group");
        String donorName = rs.getString("donor_name");
        String donorPhone = rs.getString("donor_phone");
        String donorCity = rs.getString("donor_city");
        String requestDate = String.valueOf(rs.getDate("request_date"));

        if (donorName == null) {
            donorName = "Not available";
        }

        if (donorPhone == null) {
            donorPhone = "Not available";
        }

        if (donorCity == null) {
            donorCity = "Not available";
        }

        String statusClass = "status-pending";

        if ("ACCEPTED".equalsIgnoreCase(status)) {
            statusClass = "status-accepted";
        } else if ("REJECTED".equalsIgnoreCase(status)) {
            statusClass = "status-rejected";
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

    <h5 class="section-title">
        Donor Details
    </h5>

    <div class="row">

        <div class="col-md-6">
            <div class="info-row">
                <span class="info-label">Donor Name:</span>
                <%= donorName %>
            </div>
        </div>

        <div class="col-md-6">
            <div class="info-row">
                <span class="info-label">Donor Phone:</span>
                <%= donorPhone %>
            </div>
        </div>

        <div class="col-md-6">
            <div class="info-row">
                <span class="info-label">Donor City:</span>
                <%= donorCity %>
            </div>
        </div>

        <div class="col-md-6">
            <div class="info-row">
                <span class="info-label">Request Date:</span>
                <%= requestDate %>
            </div>
        </div>

    </div>

    <% if ("PENDING".equalsIgnoreCase(status)) { %>

    <div class="pending-box">
        <strong>⏳ Request Pending</strong>

        <p class="mb-0 mt-2">
            Your request has been sent to the selected donor.
            Please wait for the donor to accept your request.
        </p>
    </div>

    <% } else if ("ACCEPTED".equalsIgnoreCase(status)) { %>

    <div class="accepted-box">
        <strong>✓ Request Accepted</strong>

        <p class="mb-0 mt-2">
            The donor has accepted your blood request.
            Please contact the donor using the provided contact details
            and coordinate the blood donation.
        </p>
    </div>

    <% } else if ("REJECTED".equalsIgnoreCase(status)) { %>

    <div class="rejected-box">
        <strong>✕ Request Rejected</strong>

        <p class="mb-0 mt-2">
            Unfortunately, the selected donor has rejected your request.
            You can search for another available donor.
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
        You have not made any blood requests yet.
        <br>
        Find a suitable donor and send a blood request when you need blood.
    </p>

    <a href="SearchDonor.jsp" class="btn btn-danger mt-3">
        Find a Donor
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
        We could not retrieve your blood request information.
        <br>
        Please try again later.
    </p>

    <a href="MyBloodRequestsServe" class="btn btn-danger mt-3">
        Try Again
    </a>

</div>

<%
}
%>


</div>

</body>
</html>
