<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>My Profile | BloodConnect</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f5f7fb;
            color: #333;
        }

        .navbar {
            background: linear-gradient(135deg, #b71c1c, #e53935);
            color: white;
            padding: 18px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .user-id {
            font-size: 14px;
        }

        .logout {
            text-decoration: none;
            color: white;
            border: 1px solid rgba(255,255,255,0.7);
            padding: 8px 16px;
            border-radius: 6px;
        }

        .logout:hover {
            background: white;
            color: #c62828;
        }

        .container {
            max-width: 1000px;
            margin: 45px auto;
            padding: 0 20px;
        }

        .page-title {
            text-align: center;
            margin-bottom: 30px;
        }

        .page-title h1 {
            color: #b71c1c;
            margin-bottom: 8px;
        }

        .page-title p {
            color: #777;
        }

        .profile-card {
            background: white;
            border-radius: 14px;
            padding: 35px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
        }

        .section-title {
            color: #b71c1c;
            font-size: 19px;
            font-weight: bold;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #f1f1f1;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 18px;
            margin-bottom: 30px;
        }

        .info-item {
            background: #f8f9fc;
            padding: 16px;
            border-radius: 8px;
        }

        .label {
            display: block;
            font-size: 13px;
            color: #777;
            margin-bottom: 6px;
        }

        .value {
            font-size: 16px;
            font-weight: 600;
            color: #333;
        }

        .status-box {
            background: #fff8f8;
            border: 1px solid #ffcdd2;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 30px;
        }

        .status-label {
            color: #777;
            font-size: 13px;
            margin-bottom: 8px;
        }

        .status {
            font-size: 18px;
            font-weight: bold;
            color: #c62828;
        }

        .actions {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 10px;
        }

        .btn {
            text-decoration: none;
            padding: 12px 24px;
            border-radius: 7px;
            font-weight: bold;
            display: inline-block;
        }

        .btn-update {
            background: #c62828;
            color: white;
        }

        .btn-update:hover {
            background: #a91f1f;
        }

        .btn-back {
            background: #eeeeee;
            color: #333;
        }

        .btn-back:hover {
            background: #dddddd;
        }

        @media (max-width: 700px) {

            .navbar {
                padding: 15px 20px;
            }

            .info-grid {
                grid-template-columns: 1fr;
            }

            .profile-card {
                padding: 25px 20px;
            }

            .actions {
                flex-direction: column;
            }

            .btn {
                text-align: center;
            }
        }

    </style>

</head>

<body>

    <!-- Navbar -->
    <div class="navbar">

        <div class="logo">
            BloodConnect
        </div>

        <div class="nav-right">

            <span class="user-id">
                User ID: ${userId}
            </span>

            <a href="LogoutServe" class="logout">
                Logout
            </a>

        </div>

    </div>


    <div class="container">

        <div class="page-title">

            <h1>My Profile</h1>

            <p>
                View your personal and donor information
            </p>

        </div>


        <div class="profile-card">

            <!-- Personal Information -->
            <div class="section-title">
                Personal Information
            </div>

            <div class="info-grid">

                <div class="info-item">
                    <span class="label">User ID</span>
                    <span class="value">${userId}</span>
                </div>

                <div class="info-item">
                    <span class="label">Full Name</span>
                    <span class="value">${name}</span>
                </div>

                <div class="info-item">
                    <span class="label">Age</span>
                    <span class="value">${age}</span>
                </div>

                <div class="info-item">
                    <span class="label">Gender</span>
                    <span class="value">${gender}</span>
                </div>

                <div class="info-item">
                    <span class="label">Phone</span>
                    <span class="value">${phone}</span>
                </div>

                <div class="info-item">
                    <span class="label">City</span>
                    <span class="value">${city}</span>
                </div>

            </div>


            <!-- Donor Information -->
            <div class="section-title">
                Donor Information
            </div>

            <div class="info-grid">

                <div class="info-item">
                    <span class="label">Donor ID</span>
                    <span class="value">${donorId}</span>
                </div>

                <div class="info-item">
                    <span class="label">Blood Group</span>
                    <span class="value">${bloodGroup}</span>
                </div>

                <div class="info-item">
                    <span class="label">Last Donation Date</span>
                    <span class="value">
                        ${lastDonationDate}
                    </span>
                </div>

                <div class="info-item">
                    <span class="label">Available From</span>
                    <span class="value">
                        ${availableFrom}
                    </span>
                </div>

            </div>


            <!-- Donor Status -->
            <div class="status-box">

                <div class="status-label">
                    Current Donor Status
                </div>

                <div class="status">
                    ${status}
                </div>

            </div>


            <!-- Actions -->
            <div class="actions">

                <a href="UpdateProfileServe" class="btn btn-update">Update Profile</a>

                <a href="Dashboard.jsp"
                   class="btn btn-back">
                    Back to Dashboard
                </a>

            </div>

        </div>

    </div>

</body>

</html>