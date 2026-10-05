<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>BloodConnect | Blood Donor Management System</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: #fff;
            color: #242424;
        }

        /* ================= NAVBAR ================= */

        .navbar {
            padding: 18px 6%;
            background: rgba(255, 255, 255, 0.97);
            box-shadow: 0 3px 20px rgba(0, 0, 0, 0.06);
        }

        .navbar-brand {
            font-size: 25px;
            font-weight: 800;
            color: #c62828 !important;
            letter-spacing: -0.5px;
        }

        .brand-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            background: #c62828;
            color: white;
            border-radius: 12px;
            margin-right: 10px;
            font-size: 20px;
        }

        .nav-link {
            color: #444 !important;
            font-weight: 500;
            margin-left: 25px;
        }

        .nav-link:hover {
            color: #c62828 !important;
        }

        .nav-login {
            border: 1px solid #c62828;
            color: #c62828 !important;
            padding: 9px 22px !important;
            border-radius: 8px;
        }

        .nav-login:hover {
            background: #c62828;
            color: white !important;
        }

        /* ================= HERO ================= */

        .hero {
            min-height: 620px;
            background:
                radial-gradient(circle at 85% 30%, rgba(239,83,80,0.18), transparent 28%),
                radial-gradient(circle at 10% 80%, rgba(198,40,40,0.08), transparent 30%),
                linear-gradient(135deg, #fffafa 0%, #fff 55%, #fff3f3 100%);
            padding: 75px 7%;
            display: flex;
            align-items: center;
        }

        .hero-content {
            max-width: 650px;
        }

        .tag {
            display: inline-block;
            background: #ffebee;
            color: #c62828;
            padding: 9px 18px;
            border-radius: 30px;
            font-size: 13px;
            font-weight: 700;
            margin-bottom: 22px;
        }

        .hero h1 {
            font-size: 58px;
            line-height: 1.1;
            font-weight: 800;
            letter-spacing: -2px;
            margin-bottom: 22px;
            color: #222;
        }

        .hero h1 span {
            color: #c62828;
        }

        .hero-description {
            font-size: 18px;
            line-height: 1.8;
            color: #666;
            max-width: 580px;
            margin-bottom: 32px;
        }

        .hero-buttons {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }

        .btn-primary-custom {
            background: #c62828;
            color: white;
            padding: 14px 30px;
            border-radius: 9px;
            font-weight: 600;
            text-decoration: none;
            box-shadow: 0 8px 20px rgba(198,40,40,0.25);
            transition: 0.3s;
        }

        .btn-primary-custom:hover {
            background: #a61c1c;
            color: white;
            text-decoration: none;
            transform: translateY(-2px);
        }

        .btn-secondary-custom {
            background: white;
            color: #333;
            padding: 13px 30px;
            border-radius: 9px;
            font-weight: 600;
            text-decoration: none;
            border: 1px solid #ddd;
            transition: 0.3s;
        }

        .btn-secondary-custom:hover {
            border-color: #c62828;
            color: #c62828;
            text-decoration: none;
        }

        /* ================= HERO VISUAL ================= */

        .hero-visual {
            position: relative;
            width: 420px;
            height: 420px;
            margin: auto;
        }

        .circle-main {
            width: 350px;
            height: 350px;
            border-radius: 50%;
            background: linear-gradient(145deg, #c62828, #ef5350);
            position: absolute;
            top: 35px;
            left: 35px;
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 25px 60px rgba(198,40,40,0.25);
        }

        .blood-drop {
            color: white;
            font-size: 130px;
            filter: drop-shadow(0 10px 10px rgba(0,0,0,0.12));
        }

        .floating-card {
            position: absolute;
            background: white;
            padding: 16px 20px;
            border-radius: 13px;
            box-shadow: 0 12px 35px rgba(0,0,0,0.12);
            font-size: 14px;
            font-weight: 600;
        }

        .card-one {
            top: 25px;
            right: -5px;
        }

        .card-two {
            bottom: 35px;
            left: -20px;
        }

        .card-icon {
            color: #c62828;
            margin-right: 7px;
        }

        /* ================= STATS ================= */

        .stats {
            background: #fff;
            padding: 0 7% 55px;
        }

        .stats-container {
            margin-top: -45px;
            position: relative;
            background: white;
            border-radius: 16px;
            box-shadow: 0 10px 35px rgba(0,0,0,0.08);
            padding: 28px;
        }

        .stat-box {
            text-align: center;
            padding: 10px;
            border-right: 1px solid #eee;
        }

        .stat-box:last-child {
            border-right: none;
        }

        .stat-number {
            font-size: 28px;
            font-weight: 800;
            color: #c62828;
        }

        .stat-text {
            color: #777;
            font-size: 13px;
            margin-top: 5px;
        }

        /* ================= FEATURES ================= */

        .features {
            padding: 80px 7%;
            background: #fafafa;
        }

        .section-heading {
            text-align: center;
            margin-bottom: 50px;
        }

        .section-heading small {
            color: #c62828;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1.5px;
        }

        .section-heading h2 {
            font-size: 36px;
            font-weight: 800;
            margin-top: 10px;
        }

        .section-heading p {
            color: #777;
            margin-top: 12px;
        }

        .feature-card {
            background: white;
            padding: 32px;
            border-radius: 15px;
            height: 100%;
            border: 1px solid #eee;
            transition: 0.3s;
        }

        .feature-card:hover {
            transform: translateY(-7px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.08);
            border-color: #ffcdd2;
        }

        .feature-icon {
            width: 55px;
            height: 55px;
            border-radius: 13px;
            background: #ffebee;
            color: #c62828;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .feature-card h4 {
            font-size: 19px;
            font-weight: 700;
            margin-bottom: 12px;
        }

        .feature-card p {
            color: #777;
            font-size: 14px;
            line-height: 1.7;
            margin: 0;
        }

        /* ================= CTA ================= */

        .cta {
            padding: 75px 7%;
            background: linear-gradient(135deg, #b71c1c, #d32f2f);
            color: white;
            text-align: center;
        }

        .cta h2 {
            font-size: 35px;
            font-weight: 800;
            margin-bottom: 15px;
        }

        .cta p {
            opacity: 0.9;
            margin-bottom: 28px;
        }

        .cta-btn {
            display: inline-block;
            background: white;
            color: #b71c1c;
            padding: 13px 30px;
            border-radius: 8px;
            font-weight: 700;
            text-decoration: none;
        }

        .cta-btn:hover {
            color: #b71c1c;
            text-decoration: none;
            transform: translateY(-2px);
        }

        /* ================= FOOTER ================= */

        footer {
            background: #1d1d1d;
            color: #aaa;
            text-align: center;
            padding: 22px;
            font-size: 13px;
        }

        footer strong {
            color: white;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 991px) {

            .hero {
                text-align: center;
            }

            .hero-content {
                margin: auto;
            }

            .hero-buttons {
                justify-content: center;
            }

            .hero-visual {
                margin-top: 50px;
            }

            .hero h1 {
                font-size: 45px;
            }

            .stat-box {
                border-right: none;
                border-bottom: 1px solid #eee;
                margin-bottom: 10px;
            }
        }

        @media (max-width: 600px) {

            .hero {
                padding: 50px 5%;
            }

            .hero h1 {
                font-size: 38px;
            }

            .hero-visual {
                width: 300px;
                height: 300px;
            }

            .circle-main {
                width: 250px;
                height: 250px;
            }

            .blood-drop {
                font-size: 90px;
            }

            .card-one {
                right: -10px;
            }

            .card-two {
                left: -10px;
            }
        }

    </style>
</head>

<body>

<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg">

    <a class="navbar-brand" href="index.jsp">
        <span class="brand-icon">♥</span>
        BloodConnect
    </a>

    <button class="navbar-toggler" type="button"
            data-toggle="collapse"
            data-target="#navbarNav">
        ☰
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">

        <ul class="navbar-nav ml-auto">

            <li class="nav-item">
                <a class="nav-link" href="#features">
                    Features
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="#about">
                    About
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link nav-login" href="Login.jsp">
                    Login
                </a>
            </li>

        </ul>

    </div>

</nav>


<!-- ================= HERO ================= -->

<section class="hero">

    <div class="container-fluid">

        <div class="row align-items-center">

            <div class="col-lg-7">

                <div class="hero-content">

                    <span class="tag">
                        🩸 BLOOD DONOR MANAGEMENT SYSTEM
                    </span>

                    <h1>
                        Every Drop Can
                        <span>Save a Life.</span>
                    </h1>

                    <p class="hero-description">
                        BloodConnect makes it easier to find eligible blood
                        donors, manage donor information and connect people
                        with the blood they need — quickly and efficiently.
                    </p>

                    <div class="hero-buttons">

                        <a href="Register.jsp"
                           class="btn-primary-custom">
                            Become a Donor →
                        </a>

                        <a href="Login.jsp"
                           class="btn-secondary-custom">
                            Existing User? Login
                        </a>

                    </div>

                </div>

            </div>


            <div class="col-lg-5">

                <div class="hero-visual">

                    <div class="circle-main">
                        <div class="blood-drop">♥</div>
                    </div>

                    <div class="floating-card card-one">
                        <span class="card-icon">✓</span>
                        Eligible Donors
                    </div>

                    <div class="floating-card card-two">
                        <span class="card-icon">♥</span>
                        Donate. Help. Save.
                    </div>

                </div>

            </div>

        </div>

    </div>

</section>


<!-- ================= STATS ================= -->

<section class="stats">

    <div class="stats-container">

        <div class="row">

            <div class="col-md-3 stat-box">
                <div class="stat-number">8</div>
                <div class="stat-text">Blood Groups</div>
            </div>

            <div class="col-md-3 stat-box">
                <div class="stat-number">24×7</div>
                <div class="stat-text">Access to Donor Information</div>
            </div>

            <div class="col-md-3 stat-box">
                <div class="stat-number">3 Months</div>
                <div class="stat-text">Donation Eligibility Tracking</div>
            </div>

            <div class="col-md-3 stat-box">
                <div class="stat-number">100%</div>
                <div class="stat-text">User-Based Access</div>
            </div>

        </div>

    </div>

</section>


<!-- ================= FEATURES ================= -->

<section class="features" id="features">

    <div class="section-heading">

        <small>Why BloodConnect?</small>

        <h2>Everything You Need in One Place</h2>

        <p>
            Designed to make blood donor management simple, secure and efficient.
        </p>

    </div>


    <div class="container-fluid">

        <div class="row">

            <div class="col-lg-4 mb-4">

                <div class="feature-card">

                    <div class="feature-icon">
                        🔎
                    </div>

                    <h4>Find Blood Donors</h4>

                    <p>
                        Search for eligible donors using blood group
                        and location to quickly find suitable matches.
                    </p>

                </div>

            </div>


            <div class="col-lg-4 mb-4">

                <div class="feature-card">

                    <div class="feature-icon">
                        👤
                    </div>

                    <h4>Manage Your Profile</h4>

                    <p>
                        Registered users can securely manage their
                        personal information and donor details.
                    </p>

                </div>

            </div>


            <div class="col-lg-4 mb-4">

                <div class="feature-card">

                    <div class="feature-icon">
                        📅
                    </div>

                    <h4>Smart Eligibility Tracking</h4>

                    <p>
                        Donation dates are tracked automatically and
                        donor availability is calculated after each donation.
                    </p>

                </div>

            </div>

        </div>

    </div>

</section>


<!-- ================= CTA ================= -->

<section class="cta" id="about">

    <h2>Be Someone's Reason to Hope.</h2>

    <p>
        Register today and become part of a community that helps save lives.
    </p>

    <a href="Register.jsp" class="cta-btn">
        Register as a Donor →
    </a>

</section>


<!-- ================= FOOTER ================= -->

<footer>

    © 2026 <strong>BloodConnect</strong> |
    Blood Donor Management System

</footer>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>