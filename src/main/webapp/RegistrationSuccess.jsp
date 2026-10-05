<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <title>Registration Successful | BloodConnect</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
          rel="stylesheet">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #fff5f5, #ffe5e5);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 30px;
        }

        .success-card {
            width: 100%;
            max-width: 650px;
            background: #ffffff;
            border-radius: 22px;
            padding: 50px 45px;
            text-align: center;
            box-shadow: 0 15px 45px rgba(150, 20, 20, 0.15);
        }

        .success-icon {
            width: 85px;
            height: 85px;
            margin: 0 auto 25px;
            border-radius: 50%;
            background: #ffe3e3;
            color: #d62828;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 42px;
            font-weight: 700;
        }

        h1 {
            color: #b71c1c;
            font-size: 30px;
            font-weight: 800;
            margin-bottom: 12px;
        }

        .message {
            color: #555;
            font-size: 16px;
            margin-bottom: 30px;
        }

        .user-id-box {
            background: #fff5f5;
            border: 2px dashed #d62828;
            border-radius: 14px;
            padding: 22px;
            margin: 25px 0;
        }

        .user-id-label {
            display: block;
            color: #777;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .user-id {
            color: #b71c1c;
            font-size: 28px;
            font-weight: 800;
            letter-spacing: 2px;
        }

        .warning {
            color: #555;
            font-size: 14px;
            margin-bottom: 30px;
        }

        .btn-login {
            display: inline-block;
            background: #d62828;
            color: white;
            padding: 13px 32px;
            border-radius: 10px;
            font-weight: 700;
            text-decoration: none;
            transition: 0.3s;
        }

        .btn-login:hover {
            background: #b71c1c;
            color: white;
            text-decoration: none;
            transform: translateY(-2px);
        }

        .brand {
            margin-top: 28px;
            color: #999;
            font-size: 13px;
        }

        .brand strong {
            color: #d62828;
        }

        @media (max-width: 576px) {

            .success-card {
                padding: 35px 25px;
            }

            h1 {
                font-size: 25px;
            }

            .user-id {
                font-size: 23px;
            }
        }

    </style>

</head>

<body>

    <div class="success-card">

        <div class="success-icon">
            ✓
        </div>

        <h1>Registration Successful!</h1>

        <p class="message">
            Your BloodConnect account has been created successfully.
        </p>

        <div class="user-id-box">

            <span class="user-id-label">
                YOUR USER ID
            </span>

            <div class="user-id">
                <%= request.getParameter("userId") %>
            </div>

        </div>

        <p class="warning">
            Please save your User ID safely.
            You will need this User ID and your password to login.
        </p>

        <a href="Login.jsp" class="btn-login">
            Continue to Login →
        </a>

        <div class="brand">
            <strong>BloodConnect</strong>
            &nbsp; | &nbsp;
            Connecting donors with those in need
        </div>

    </div>

</body>

</html>