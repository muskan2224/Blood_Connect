<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>Record Donation | BloodConnect</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #fff5f5, #ffe3e3);
            min-height: 100vh;
        }

        .navbar {
            background: #b71c1c;
            padding: 16px 35px;
        }

        .navbar-brand {
            color: white !important;
            font-size: 22px;
            font-weight: bold;
        }

        .back-link {
            color: white;
            text-decoration: none;
            font-weight: 600;
        }

        .back-link:hover {
            color: #ffe5e5;
            text-decoration: none;
        }

        .container-main {
            max-width: 650px;
            margin: 55px auto;
            padding: 0 20px;
        }

        .card-box {
            background: white;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 12px 35px rgba(150, 20, 20, 0.12);
        }

        h1 {
            color: #b71c1c;
            font-weight: 800;
            text-align: center;
            margin-bottom: 10px;
        }

        .subtitle {
            text-align: center;
            color: #777;
            margin-bottom: 30px;
        }

        .info-box {
            background: #fff5f5;
            border: 1px solid #ffd6d6;
            border-radius: 12px;
            padding: 18px;
            margin-bottom: 25px;
            color: #555;
            line-height: 1.7;
        }

        .info-box strong {
            color: #b71c1c;
        }

        .warning-box {
            background: #fff8e1;
            border: 1px solid #ffe082;
            border-radius: 12px;
            padding: 15px;
            margin-bottom: 25px;
            color: #795548;
            font-size: 14px;
        }

        .btn-donate {
            width: 100%;
            background: #d62828;
            color: white;
            border: none;
            padding: 14px;
            border-radius: 10px;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
        }

        .btn-donate:hover {
            background: #b71c1c;
        }

        .cancel-link {
            display: block;
            text-align: center;
            margin-top: 18px;
            color: #777;
            text-decoration: none;
            font-weight: 600;
        }

        .cancel-link:hover {
            color: #b71c1c;
            text-decoration: none;
        }

    </style>

</head>

<body>


<!-- Navbar -->

<nav class="navbar">

    <a class="navbar-brand" href="Dashboard.jsp">
        BloodConnect
    </a>

    <a class="back-link" href="Dashboard.jsp">
        ← Dashboard
    </a>

</nav>


<!-- Main -->

<div class="container-main">

    <div class="card-box">

        <h1>Record Blood Donation</h1>

        <p class="subtitle">
            Thank you for helping save lives.
        </p>


        <div class="info-box">

            <strong>Before confirming:</strong>

            <br>

            By recording your donation, your donor profile
            will be marked as <strong>UNAVAILABLE</strong>
            for the next three months.

            <br><br>

            Your next available date will be calculated
            automatically.

        </div>


        <div class="warning-box">

            Please confirm only if you have actually donated
            blood. This information will be used to maintain
            accurate donor availability.

        </div>


        <form action="DonationServe" method="post">

            <button type="submit"
                    class="btn-donate">

                Confirm Blood Donation

            </button>

        </form>


        <a href="Dashboard.jsp"
           class="cancel-link">

            Cancel

        </a>

    </div>

</div>


</body>

</html>