
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    Integer requestId =
            (Integer) request.getAttribute("requestId");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Request Sent</title>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<style>

body {
    background: #f8f9fa;
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
}

.card-box {
    background: white;
    padding: 40px;
    width: 450px;
    text-align: center;
    border-radius: 15px;
    box-shadow: 0 10px 30px rgba(0,0,0,.12);
}

h2 {
    color: #28a745;
}

.request-id {
    margin: 20px 0;
    padding: 12px;
    background: #f1f1f1;
    border-radius: 8px;
    font-weight: bold;
}

</style>

</head>

<body>

<div class="card-box">

    <h2>Request Sent!</h2>

    <p>
        Your blood request has been sent to the donor.
    </p>

    <div class="request-id">
        Request ID: <%= requestId %>
    </div>

    <a href="Dashboard.jsp"
       class="btn btn-danger">
        Back to Dashboard
    </a>

</div>

</body>

</html>
