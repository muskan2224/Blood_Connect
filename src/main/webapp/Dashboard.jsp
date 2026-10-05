```jsp
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String userId = (String) session.getAttribute("userId");

if (userId == null) {
    response.sendRedirect("Login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>Dashboard | BloodConnect</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap -->

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- Google Font -->

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
          rel="stylesheet">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: #f7f8fc;
            color: #222;
        }

        /* =========================
           SIDEBAR
           ========================= */

        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: 250px;
            height: 100vh;
            background: linear-gradient(180deg, #9e1b1b, #d62828);
            padding: 28px 20px;
            color: white;
            box-shadow: 5px 0 25px rgba(0,0,0,0.08);
        }

        .brand {
            display: flex;
            align-items: center;
            font-size: 23px;
            font-weight: 800;
            margin-bottom: 45px;
            padding-left: 8px;
        }

        .brand-icon {
            width: 40px;
            height: 40px;
            background: rgba(255,255,255,0.18);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
            font-size: 21px;
        }

        .menu-title {
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            opacity: 0.65;
            margin: 0 0 12px 10px;
        }

        .nav-item {
            margin-bottom: 8px;
        }

        .nav-link-custom {
            display: flex;
            align-items: center;
            padding: 13px 14px;
            color: rgba(255,255,255,0.88);
            text-decoration: none;
            border-radius: 11px;
            font-size: 14px;
            font-weight: 500;
            transition: 0.25s;
        }

        .nav-link-custom:hover,
        .nav-link-custom.active {
            background: rgba(255,255,255,0.16);
            color: white;
            text-decoration: none;
        }

        .nav-icon {
            width: 30px;
            font-size: 18px;
        }

        .logout {
            position: absolute;
            bottom: 25px;
            left: 20px;
            right: 20px;
        }

        .logout a {
            display: flex;
            align-items: center;
            padding: 13px 14px;
            border-radius: 11px;
            background: rgba(0,0,0,0.12);
            color: white;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
        }

        .logout a:hover {
            background: rgba(0,0,0,0.2);
        }

        /* =========================
           MAIN CONTENT
           ========================= */

        .main {
            margin-left: 250px;
            padding: 35px 45px;
        }

        /* TOP BAR */

        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .page-title {
            margin: 0;
            font-size: 27px;
            font-weight: 800;
            color: #222;
        }

        .page-subtitle {
            margin-top: 6px;
            color: #777;
            font-size: 14px;
        }

        .user-badge {
            display: flex;
            align-items: center;
            background: white;
            padding: 9px 15px 9px 9px;
            border-radius: 30px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.06);
            font-size: 13px;
            font-weight: 600;
        }

        .user-avatar {
            width: 36px;
            height: 36px;
            background: #ffe1e1;
            color: #c62828;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 9px;
            font-weight: 800;
        }

        /* =========================
           HERO
           ========================= */

        .hero {
            position: relative;
            overflow: hidden;
            background: linear-gradient(120deg, #b71c1c, #e53935);
            border-radius: 20px;
            padding: 35px 40px;
            color: white;
            margin-bottom: 30px;
            box-shadow: 0 12px 30px rgba(198,40,40,0.20);
        }

        .hero:after {
            content: "";
            position: absolute;
            width: 230px;
            height: 230px;
            border-radius: 50%;
            background: rgba(255,255,255,0.08);
            right: -70px;
            top: -90px;
        }

        .hero h2 {
            font-size: 27px;
            font-weight: 800;
            margin-bottom: 10px;
        }

        .hero p {
            margin: 0;
            max-width: 600px;
            font-size: 14px;
            line-height: 1.7;
            opacity: 0.92;
        }

        .hero-badge {
            display: inline-block;
            margin-top: 18px;
            background: rgba(255,255,255,0.15);
            border: 1px solid rgba(255,255,255,0.25);
            padding: 8px 13px;
            border-radius: 20px;
            font-size: 12px;
        }

        /* =========================
           FEATURE CARDS
           ========================= */

        .section-heading {
            font-size: 18px;
            font-weight: 800;
            margin-bottom: 17px;
        }

        .feature-card {
            height: 100%;
            background: white;
            border-radius: 16px;
            padding: 25px;
            border: 1px solid #eee;
            transition: 0.3s;
            box-shadow: 0 5px 18px rgba(0,0,0,0.04);
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 14px 30px rgba(0,0,0,0.09);
        }

        .feature-icon {
            width: 52px;
            height: 52px;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #fff0f0;
            color: #d62828;
            font-size: 24px;
            margin-bottom: 18px;
        }

        .feature-card h4 {
            font-size: 17px;
            font-weight: 750;
            margin-bottom: 8px;
        }

        .feature-card p {
            color: #777;
            font-size: 13px;
            line-height: 1.6;
            min-height: 42px;
            margin-bottom: 18px;
        }

        .card-link {
            color: #d62828;
            font-size: 13px;
            font-weight: 700;
            text-decoration: none;
        }

        .card-link:hover {
            color: #a71919;
            text-decoration: none;
        }

        /* =========================
           QUICK ACTIONS
           ========================= */

        .quick-section {
            margin-top: 32px;
        }

        .quick-card {
            background: white;
            border-radius: 16px;
            padding: 22px 25px;
            display: flex;
            align-items: center;
            border: 1px solid #eee;
            transition: 0.25s;
        }

        .quick-card:hover {
            border-color: #f1b5b5;
            text-decoration: none;
            transform: translateY(-2px);
        }

        .quick-icon {
            width: 45px;
            height: 45px;
            border-radius: 12px;
            background: #fff0f0;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            font-size: 20px;
        }

        .quick-card strong {
            color: #333;
            font-size: 14px;
        }

        .quick-card span {
            display: block;
            color: #888;
            font-size: 12px;
            margin-top: 3px;
        }

        /* =========================
           FOOTER
           ========================= */

        .footer {
            text-align: center;
            margin-top: 45px;
            color: #aaa;
            font-size: 12px;
        }

        /* =========================
           RESPONSIVE
           ========================= */

        @media (max-width: 900px) {

            .sidebar {
                width: 210px;
            }

            .main {
                margin-left: 210px;
                padding: 25px;
            }

        }

        @media (max-width: 700px) {

            .sidebar {
                position: relative;
                width: 100%;
                height: auto;
                padding: 18px;
            }

            .brand {
                margin-bottom: 20px;
            }

            .logout {
                position: static;
                margin-top: 20px;
            }

            .main {
                margin-left: 0;
                padding: 25px 18px;
            }

            .topbar {
                align-items: flex-start;
                flex-direction: column;
            }

            .user-badge {
                margin-top: 15px;
            }

        }

    </style>

</head>

<body>

<!-- =========================
     SIDEBAR
     ========================= -->

<div class="sidebar">

    <div class="brand">

        <div class="brand-icon">
            🩸
        </div>

        BloodConnect

    </div>

    <div class="menu-title">
        Main Menu
    </div>

    <!-- DASHBOARD -->

    <div class="nav-item">

        <a href="Dashboard.jsp"
           class="nav-link-custom active">

            <span class="nav-icon">⌂</span>

            Dashboard

        </a>

    </div>

    <!-- PROFILE -->

    <div class="nav-item">

        <a href="Profile.jsp"
           class="nav-link-custom">

            <span class="nav-icon">👤</span>

            My Profile

        </a>

    </div>

    <!-- SEARCH DONOR -->

    <div class="nav-item">

        <a href="SearchDonor.jsp"
           class="nav-link-custom">

            <span class="nav-icon">🔍</span>

            Search Donor

        </a>

    </div>

    <!-- DONATE BLOOD -->

    <div class="nav-item">

        <a href="Donation.jsp"
           class="nav-link-custom">

            <span class="nav-icon">🩸</span>

            Donate Blood

        </a>

    </div>

    <!-- MY REQUESTS - DONOR -->

    <div class="nav-item">

        <a href="MyRequestsServe"
           class="nav-link-custom">

            <span class="nav-icon">🩸</span>

            My Requests

        </a>

    </div>

    <!-- MY BLOOD REQUESTS - REQUESTOR -->

    <div class="nav-item">

        <a href="MyBloodRequestsServe"
           class="nav-link-custom">

            <span class="nav-icon">📋</span>

            My Blood Requests

        </a>

    </div>

    <!-- LOGOUT -->

    <div class="logout">

        <a href="LogoutServe">

            <span class="nav-icon">↪</span>

            Logout

        </a>

    </div>

</div>


<!-- =========================
     MAIN CONTENT
     ========================= -->

<div class="main">

    <!-- TOP BAR -->

    <div class="topbar">

        <div>

            <h1 class="page-title">
                Dashboard
            </h1>

            <div class="page-subtitle">
                Manage your BloodConnect account
            </div>

        </div>

        <div class="user-badge">

            <div class="user-avatar">
                👤
            </div>

            <%= userId %>

        </div>

    </div>


    <!-- HERO -->

    <div class="hero">

        <h2>
            Welcome to BloodConnect! 👋
        </h2>

        <p>

            Your contribution can make a real difference.

            Manage your donor profile, find eligible donors,

            and help connect patients with the blood they need.

        </p>

        <div class="hero-badge">

            ❤️ Every donation can help save lives

        </div>

    </div>


    <!-- FEATURE SECTION -->

    <div class="section-heading">

        What would you like to do?

    </div>


    <div class="row">

        <!-- PROFILE -->

        <div class="col-lg-4 col-md-6 mb-4">

            <div class="feature-card">

                <div class="feature-icon">
                    👤
                </div>

                <h4>
                    My Profile
                </h4>

                <p>

                    View and update your personal information

                    and donor details.

                </p>

                <a href="Profile.jsp"
                   class="card-link">

                    Manage Profile →

                </a>

            </div>

        </div>


        <!-- SEARCH DONOR -->

        <div class="col-lg-4 col-md-6 mb-4">

            <div class="feature-card">

                <div class="feature-icon">
                    🔍
                </div>

                <h4>
                    Search Donor
                </h4>

                <p>

                    Find eligible blood donors based on

                    blood group and city.

                </p>

                <a href="SearchDonor.jsp"
                   class="card-link">

                    Find a Donor →

                </a>

            </div>

        </div>


        <!-- DONATE -->

        <div class="col-lg-4 col-md-6 mb-4">

            <div class="feature-card">

                <div class="feature-icon">
                    🩸
                </div>

                <h4>
                    Donate Blood
                </h4>

                <p>

                    Record your latest blood donation and

                    update your availability.

                </p>

                <a href="Donation.jsp"
                   class="card-link">

                    Record Donation →

                </a>

            </div>

        </div>


        <!-- MY BLOOD REQUESTS -->

        <div class="col-lg-4 col-md-6 mb-4">

            <div class="feature-card">

                <div class="feature-icon">
                    📋
                </div>

                <h4>
                    My Blood Requests
                </h4>

                <p>

                    View the blood requests you have created

                    and check their current status.

                </p>

                <a href="MyBloodRequestsServe"
                   class="card-link">

                    View My Requests →

                </a>

            </div>

        </div>


        <!-- MY REQUESTS -->

        <div class="col-lg-4 col-md-6 mb-4">

            <div class="feature-card">

                <div class="feature-icon">
                    🩸
                </div>

                <h4>
                    My Requests
                </h4>

                <p>

                    View blood requests received from people

                    who selected you as their donor.

                </p>

                <a href="MyRequestsServe"
                   class="card-link">

                    View Requests →

                </a>

            </div>

        </div>


        <!-- EMERGENCY SEARCH -->

        <div class="col-lg-4 col-md-6 mb-4">

            <div class="feature-card">

                <div class="feature-icon">
                    🚨
                </div>

                <h4>
                    Find Blood
                </h4>

                <p>

                    Quickly search for available donors

                    when blood is urgently needed.

                </p>

                <a href="SearchDonor.jsp"
                   class="card-link">

                    Search Now →

                </a>

            </div>

        </div>


        <!-- HELP -->

        <div class="col-lg-4 col-md-6 mb-4">

            <div class="feature-card">

                <div class="feature-icon">
                    💙
                </div>

                <h4>
                    Make a Difference
                </h4>

                <p>

                    Keep your donor information updated so

                    people can reach you when needed.

                </p>

                <a href="Profile.jsp"
                   class="card-link">

                    Update Details →

                </a>

            </div>

        </div>

    </div>


    <!-- QUICK ACTIONS -->

    <div class="quick-section">

        <div class="section-heading">

            Quick Actions

        </div>


        <div class="row">

            <!-- SEARCH -->

            <div class="col-md-6 mb-3">

                <a href="SearchDonor.jsp"
                   class="quick-card">

                    <div class="quick-icon">
                        🔎
                    </div>

                    <div>

                        <strong>
                            Search for a Donor
                        </strong>

                        <span>
                            Find donors by blood group and city
                        </span>

                    </div>

                </a>

            </div>


            <!-- DONATION -->

            <div class="col-md-6 mb-3">

                <a href="Donation.jsp"
                   class="quick-card">

                    <div class="quick-icon">
                        ❤️
                    </div>

                    <div>

                        <strong>
                            Record Blood Donation
                        </strong>

                        <span>
                            Keep your donor availability updated
                        </span>

                    </div>

                </a>

            </div>


            <!-- MY BLOOD REQUESTS -->

            <div class="col-md-6 mb-3">

                <a href="MyBloodRequestsServe"
                   class="quick-card">

                    <div class="quick-icon">
                        📋
                    </div>

                    <div>

                        <strong>
                            My Blood Requests
                        </strong>

                        <span>
                            Check your blood request status
                        </span>

                    </div>

                </a>

            </div>


            <!-- MY REQUESTS -->

            <div class="col-md-6 mb-3">

                <a href="MyRequestsServe"
                   class="quick-card">

                    <div class="quick-icon">
                        🩸
                    </div>

                    <div>

                        <strong>
                            My Requests
                        </strong>

                        <span>
                            View requests sent to you as a donor
                        </span>

                    </div>

                </a>

            </div>

        </div>

    </div>


    <!-- FOOTER -->

    <div class="footer">

        BloodConnect © 2026

        &nbsp;•&nbsp;

        Connecting donors with those in need

    </div>

</div>

</body>

</html>

