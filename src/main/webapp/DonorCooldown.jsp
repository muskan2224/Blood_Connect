<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    String eligibleDate =
            (String) request.getAttribute(
                    "eligibleDate"
            );
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>
Donor Registration Temporarily Unavailable
</title>

<meta name="viewport"
      content="width=device-width, initial-scale=1">

<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">


<style>

body {

    margin: 0;

    min-height: 100vh;

    display: flex;

    align-items: center;

    justify-content: center;

    background:
        linear-gradient(
            135deg,
            #fff5f5,
            #ffe3e3
        );

    font-family: Arial, sans-serif;
}


.card-box {

    width: 92%;

    max-width: 600px;

    background: white;

    padding: 45px;

    border-radius: 20px;

    text-align: center;

    box-shadow:
        0 15px 40px
        rgba(0,0,0,.10);
}


.icon {

    font-size: 50px;

    margin-bottom: 15px;
}


.title {

    color: #b71c1c;

    font-weight: 800;
}


.date {

    color: #b71c1c;

    font-weight: 800;

    font-size: 22px;

    margin-top: 10px;
}


.btn-main {

    display: inline-block;

    background: #b71c1c;

    color: white;

    padding: 12px 28px;

    border-radius: 10px;

    text-decoration: none;

    font-weight: 700;

    margin-top: 20px;
}


.btn-main:hover {

    background: #8f1010;

    color: white;

    text-decoration: none;
}

</style>

</head>


<body>


<div class="card-box">


    <div class="icon">
        ⏳
    </div>


    <h2 class="title">

        Donor Registration
        Temporarily Unavailable

    </h2>


    <p class="text-muted mt-3">

        Our records show that you recently
        completed a blood donation.

        For donor safety, a strict
        <strong>3-month waiting period</strong>
        is required before registering again.

    </p>


    <% if (eligibleDate != null) { %>


        <p class="mt-4">

            You can register as a donor again on:

        </p>


        <div class="date">

            <%= eligibleDate %>

        </div>


    <% } %>


    <a href="Login.jsp"
       class="btn-main">

        Back to Login

    </a>


</div>


</body>

</html>