<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <title>Login | BloodConnect</title>

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
            background: linear-gradient(135deg, #fff5f5, #ffe4e4);

            display: flex;
            align-items: center;
            justify-content: center;

            padding: 30px;
        }

        .login-wrapper {
            width: 100%;
            max-width: 950px;

            display: flex;
            background: #ffffff;

            border-radius: 24px;
            overflow: hidden;

            box-shadow: 0 20px 55px rgba(150, 20, 20, 0.16);
        }

        /* LEFT SIDE */

        .login-info {
            width: 45%;

            padding: 55px 45px;

            background: linear-gradient(145deg, #b71c1c, #e53935);

            color: white;

            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .brand {
            font-size: 27px;
            font-weight: 800;
            margin-bottom: 35px;
        }

        .login-info h1 {
            font-size: 34px;
            font-weight: 800;
            line-height: 1.2;
            margin-bottom: 18px;
        }

        .login-info p {
            font-size: 15px;
            line-height: 1.7;
            opacity: 0.92;
        }

        .info-box {
            margin-top: 30px;
            padding: 18px;

            border: 1px solid rgba(255,255,255,0.25);
            background: rgba(255,255,255,0.10);

            border-radius: 12px;
            font-size: 14px;
        }

        /* RIGHT SIDE */

        .login-form {
            width: 55%;
            padding: 55px 50px;
        }

        .login-form h2 {
            color: #b71c1c;
            font-size: 29px;
            font-weight: 800;
            margin-bottom: 8px;
        }

        .subtitle {
            color: #777;
            font-size: 14px;
            margin-bottom: 32px;
        }

        .form-group {
            margin-bottom: 22px;
        }

        label {
            color: #333;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .form-control {
            height: 50px;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 0 15px;
            font-size: 14px;
        }

        .form-control:focus {
            border-color: #d62828;
            box-shadow: 0 0 0 3px rgba(214,40,40,0.10);
        }

        .login-btn {
            width: 100%;
            height: 50px;

            border: none;
            border-radius: 10px;

            background: #d62828;
            color: white;

            font-size: 15px;
            font-weight: 700;

            cursor: pointer;
            transition: 0.3s;
        }

        .login-btn:hover {
            background: #b71c1c;
            transform: translateY(-2px);
        }

        .error-message {
            background: #fff0f0;
            color: #c62828;
            border-left: 4px solid #d62828;

            padding: 12px 15px;
            border-radius: 7px;

            font-size: 14px;
            margin-bottom: 20px;
        }

        .register-link {
            text-align: center;
            margin-top: 25px;

            color: #777;
            font-size: 14px;
        }

        .register-link a {
            color: #d62828;
            font-weight: 700;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        .back-home {
            display: inline-block;
            margin-top: 18px;

            color: #888;
            font-size: 13px;
            text-decoration: none;
        }

        .back-home:hover {
            color: #d62828;
            text-decoration: none;
        }

        @media (max-width: 768px) {

            .login-wrapper {
                flex-direction: column;
            }

            .login-info,
            .login-form {
                width: 100%;
            }

            .login-info {
                padding: 35px;
            }

            .login-info h1 {
                font-size: 28px;
            }

            .login-form {
                padding: 40px 30px;
            }
        }

    </style>

</head>

<body>

    <div class="login-wrapper">

        <!-- LEFT INFORMATION PANEL -->

        <div class="login-info">

            <div class="brand">
                🩸 BloodConnect
            </div>

            <h1>
                Welcome Back
            </h1>

            <p>
                Login to manage your donor profile, search for
                eligible blood donors and help connect people
                with the blood they need.
            </p>

            <div class="info-box">
                <strong>🔐 Secure Login</strong>
                <br><br>
                Use the User ID generated during registration
                along with your password to access your account.
            </div>

        </div>


        <!-- LOGIN FORM -->

        <div class="login-form">

            <h2>Sign In</h2>

            <p class="subtitle">
                Enter your credentials to continue.
            </p>

            <% 
                String errorMessage =
                    (String) request.getAttribute("errorMessage");

                if (errorMessage != null) {
            %>

                <div class="error-message">
                    <%= errorMessage %>
                </div>

            <%
                }
            %>


            <form action="LoginServe" method="post">

                <div class="form-group">

                    <label for="userId">
                        User ID
                    </label>

                    <input
                        type="text"
                        id="userId"
                        name="userId"
                        class="form-control"
                        placeholder="Enter your User ID"
                        required
                        autocomplete="username">

                </div>


                <div class="form-group">

                    <label for="password">
                        Password
                    </label>

                    <input
                        type="password"
                        id="password"
                        name="password"
                        class="form-control"
                        placeholder="Enter your password"
                        required
                        autocomplete="current-password">

                </div>


                <button type="submit" class="login-btn">
                    Login →
                </button>

            </form>


            <div class="register-link">

                Don't have an account?

                <a href="Register.jsp">
                    Create an account
                </a>

            </div>


            <div style="text-align:center;">

                <a href="Index.jsp" class="back-home">
                    ← Back to Home
                </a>

            </div>

        </div>

    </div>

</body>

</html>