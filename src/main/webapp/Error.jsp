<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Error | BloodConnect</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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

        .error-card {
            width: 100%;
            max-width: 620px;
            background: white;
            border-radius: 22px;
            padding: 50px 45px;
            text-align: center;
            box-shadow: 0 15px 45px rgba(150, 20, 20, 0.15);
        }

        .error-icon {
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
            font-weight: 800;
        }

        h1 {
            color: #b71c1c;
            font-size: 30px;
            font-weight: 800;
            margin-bottom: 12px;
        }

        .message {
            color: #666;
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .error-box {
            background: #fff5f5;
            border: 1px solid #ffd0d0;
            border-radius: 12px;
            padding: 15px;
            margin-bottom: 30px;
            color: #555;
            font-size: 14px;
        }

        .btn-home {
            display: inline-block;
            background: #d62828;
            color: white;
            padding: 13px 30px;
            border-radius: 10px;
            font-weight: 700;
            text-decoration: none;
            transition: 0.3s;
        }

        .btn-home:hover {
            background: #b71c1c;
            color: white;
            text-decoration: none;
            transform: translateY(-2px);
        }

        .btn-login {
            display: inline-block;
            margin-left: 10px;
            background: #f1f1f1;
            color: #444;
            padding: 13px 30px;
            border-radius: 10px;
            font-weight: 700;
            text-decoration: none;
            transition: 0.3s;
        }

        .btn-login:hover {
            background: #e2e2e2;
            color: #222;
            text-decoration: none;
        }

        .brand {
            margin-top: 30px;
            color: #999;
            font-size: 13px;
        }

        .brand strong {
            color: #d62828;
        }

        @media (max-width: 576px) {

            .error-card {
                padding: 35px 25px;
            }

            h1 {
                font-size: 25px;
            }

            .btn-home,
            .btn-login {
                display: block;
                margin: 10px 0;
            }
        }
    </style>
</head>

<body>

    <div class="error-card">

        <div class="error-icon">!</div>

        <h1>Something Went Wrong</h1>

        <p class="message">
            We couldn't complete your request at the moment.
            Please try again.
        </p>

        <div class="error-box">
            <%
                String errorMessage =
                        (String) request.getAttribute("errorMessage");

                if (errorMessage != null && !errorMessage.isEmpty()) {
                    out.print(errorMessage);
                } else {
                    out.print("An unexpected error occurred.");
                }
            %>
        </div>

        <a href="Index.jsp" class="btn-home">
            Back to Home
        </a>

        <a href="Login.jsp" class="btn-login">
            Login
        </a>

        <div class="brand">
            <strong>BloodConnect</strong>
            &nbsp; | &nbsp;
            Connecting donors with those in need
        </div>

    </div>

</body>
</html>