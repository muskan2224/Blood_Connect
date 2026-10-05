<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Register | BloodConnect</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
          rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            min-height: 100vh;

            background:
                radial-gradient(circle at 90% 10%, rgba(239,83,80,0.14), transparent 28%),
                radial-gradient(circle at 5% 90%, rgba(198,40,40,0.08), transparent 30%),
                linear-gradient(135deg, #fff8f8, #ffffff);
        }

        /* NAVBAR */

        .navbar {
            background: rgba(255,255,255,0.97);
            padding: 17px 7%;
            box-shadow: 0 3px 20px rgba(0,0,0,0.06);
        }

        .navbar-brand {
            font-size: 24px;
            font-weight: 800;
            color: #c62828 !important;
        }

        .brand-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;

            width: 39px;
            height: 39px;

            background: #c62828;
            color: white;

            border-radius: 11px;
            margin-right: 9px;
        }

        .back-home {
            color: #555;
            font-weight: 600;
            text-decoration: none;
        }

        .back-home:hover {
            color: #c62828;
            text-decoration: none;
        }

        /* MAIN */

        .register-section {
            min-height: calc(100vh - 75px);
            padding: 50px 7%;
        }

        .register-container {
            max-width: 1050px;
            margin: auto;

            background: white;
            border-radius: 20px;

            box-shadow: 0 20px 55px rgba(0,0,0,0.09);

            overflow: hidden;
        }

        /* LEFT SIDE */

        .register-info {
            height: 100%;
            padding: 55px 42px;

            background:
                linear-gradient(145deg, #b71c1c, #d32f2f);

            color: white;

            position: relative;
            overflow: hidden;
        }

        .register-info::before {
            content: "";
            position: absolute;

            width: 260px;
            height: 260px;

            border-radius: 50%;

            background: rgba(255,255,255,0.07);

            top: -80px;
            right: -90px;
        }

        .register-info::after {
            content: "";
            position: absolute;

            width: 200px;
            height: 200px;

            border-radius: 50%;

            background: rgba(255,255,255,0.06);

            bottom: -70px;
            left: -70px;
        }

        .blood-symbol {
            font-size: 65px;
            margin-bottom: 20px;
        }

        .register-info h1 {
            font-size: 34px;
            font-weight: 800;
            line-height: 1.2;

            position: relative;
        }

        .register-info p {
            margin-top: 18px;
            line-height: 1.7;
            opacity: 0.9;

            position: relative;
        }

        .benefit {
            display: flex;
            align-items: center;

            margin-top: 25px;

            position: relative;
        }

        .benefit-icon {
            width: 38px;
            height: 38px;

            border-radius: 50%;

            background: rgba(255,255,255,0.16);

            display: flex;
            align-items: center;
            justify-content: center;

            margin-right: 12px;
        }

        .benefit span {
            font-size: 14px;
        }

        /* FORM */

        .register-form {
            padding: 45px 48px;
        }

        .form-heading h2 {
            font-size: 30px;
            font-weight: 800;
            color: #222;
            margin-bottom: 8px;
        }

        .form-heading p {
            color: #777;
            font-size: 14px;
            margin-bottom: 30px;
        }

        .form-group label {
            font-size: 13px;
            font-weight: 600;
            color: #444;
            margin-bottom: 7px;
        }

        .form-control {
            height: 46px;

            border: 1px solid #e0e0e0;
            border-radius: 8px;

            font-size: 14px;

            transition: 0.2s;
        }

        .form-control:focus {
            border-color: #c62828;
            box-shadow: 0 0 0 3px rgba(198,40,40,0.08);
        }

        select.form-control {
            cursor: pointer;
        }

        .register-btn {
            width: 100%;
            height: 48px;

            border: none;
            border-radius: 8px;

            background: #c62828;
            color: white;

            font-weight: 700;
            font-size: 15px;

            margin-top: 8px;

            box-shadow: 0 8px 20px rgba(198,40,40,0.22);

            transition: 0.3s;
        }

        .register-btn:hover {
            background: #a61c1c;
            transform: translateY(-2px);
        }

        .login-text {
            text-align: center;
            margin-top: 22px;

            color: #777;
            font-size: 14px;
        }

        .login-text a {
            color: #c62828;
            font-weight: 700;
            text-decoration: none;
        }

        .login-text a:hover {
            text-decoration: underline;
        }

        .security-note {
            margin-top: 18px;
            padding: 12px 15px;

            background: #fff8f8;
            border-left: 3px solid #c62828;

            border-radius: 5px;

            font-size: 12px;
            color: #666;
        }

        /* RESPONSIVE */

        @media(max-width: 991px) {

            .register-info {
                padding: 40px;
            }

            .register-form {
                padding: 40px;
            }

        }

        @media(max-width: 767px) {

            .register-section {
                padding: 25px 15px;
            }

            .register-info {
                padding: 35px 28px;
            }

            .register-form {
                padding: 35px 25px;
            }

            .register-info h1 {
                font-size: 28px;
            }

        }

    </style>

</head>

<body>

<!-- ================= NAVBAR ================= -->

<nav class="navbar">

    <a class="navbar-brand" href="index.jsp">
        <span class="brand-icon">♥</span>
        BloodConnect
    </a>

    <a href="Index.jsp" class="back-home">
        ← Back to Home
    </a>

</nav>


<!-- ================= REGISTER SECTION ================= -->

<section class="register-section">

    <div class="register-container">

        <div class="row no-gutters">


            <!-- LEFT INFORMATION PANEL -->

            <div class="col-lg-5">

                <div class="register-info">

                    <div class="blood-symbol">♥</div>

                    <h1>
                        Become a Blood Donor
                    </h1>

                    <p>
                        Join BloodConnect and become part of a community
                        that helps connect eligible blood donors with
                        people who need them.
                    </p>


                    <div class="benefit">

                        <div class="benefit-icon">✓</div>

                        <span>
                            Find blood donors easily
                        </span>

                    </div>


                    <div class="benefit">

                        <div class="benefit-icon">✓</div>

                        <span>
                            Manage your donor profile
                        </span>

                    </div>


                    <div class="benefit">

                        <div class="benefit-icon">✓</div>

                        <span>
                            Automatic donation eligibility tracking
                        </span>

                    </div>


                    <div class="benefit">

                        <div class="benefit-icon">✓</div>

                        <span>
                            Secure account-based access
                        </span>

                    </div>

                </div>

            </div>


            <!-- REGISTRATION FORM -->

            <div class="col-lg-7">

                <div class="register-form">

                    <div class="form-heading">

                        <h2>Create Account</h2>

                        <p>
                            Enter your details to create your BloodConnect account.
                        </p>

                    </div>


                    <form action="RegisterServe" method="post">


                        <!-- NAME -->

                        <div class="form-group">

                            <label for="name">
                                Full Name
                            </label>

                            <input type="text"
                                   class="form-control"
                                   id="name"
                                   name="name"
                                   placeholder="Enter your full name"
                                   required>

                        </div>


                        <div class="row">

                            <!-- AGE -->

                            <div class="col-md-6">

                                <div class="form-group">

                                    <label for="age">
                                        Age
                                    </label>

                                    <input type="number"
                                           class="form-control"
                                           id="age"
                                           name="age"
                                           min="18"
                                           max="65"
                                           placeholder="Enter your age"
                                           required>

                                </div>

                            </div>


                            <!-- GENDER -->

                            <div class="col-md-6">

                                <div class="form-group">

                                    <label for="gender">
                                        Gender
                                    </label>

                                    <select class="form-control"
                                            id="gender"
                                            name="gender"
                                            required>

                                        <option value="">
                                            Select Gender
                                        </option>

                                        <option value="Male">
                                            Male
                                        </option>

                                        <option value="Female">
                                            Female
                                        </option>

                                        <option value="Other">
                                            Other
                                        </option>

                                    </select>

                                </div>

                            </div>

                        </div>


                        <div class="row">

                            <!-- PHONE -->

                            <div class="col-md-6">

                                <div class="form-group">

                                    <label for="phone">
                                        Phone Number
                                    </label>

                                    <input type="tel"
                                           class="form-control"
                                           id="phone"
                                           name="phone"
                                           placeholder="Enter phone number"
                                           pattern="[0-9]{10}"
                                           required>

                                </div>

                            </div>


                            <!-- CITY -->

                            <div class="col-md-6">

                                <div class="form-group">

                                    <label for="city">
                                        City
                                    </label>

                                    <input type="text"
                                           class="form-control"
                                           id="city"
                                           name="city"
                                           placeholder="Enter your city"
                                           required>

                                </div>

                            </div>

                        </div>


                        <!-- BLOOD GROUP -->

                        <div class="form-group">

                            <label for="bloodGroup">
                                Blood Group
                            </label>

                            <select class="form-control"
                                    id="bloodGroup"
                                    name="bloodGroup"
                                    required>

                                <option value="">
                                    Select Blood Group
                                </option>

                                <option value="A+">A+</option>
                                <option value="A-">A-</option>
                                <option value="B+">B+</option>
                                <option value="B-">B-</option>
                                <option value="AB+">AB+</option>
                                <option value="AB-">AB-</option>
                                <option value="O+">O+</option>
                                <option value="O-">O-</option>

                            </select>

                        </div>


                        <div class="row">

                            <!-- PASSWORD -->

                            <div class="col-md-6">

                                <div class="form-group">

                                    <label for="password">
                                        Password
                                    </label>

                                    <input type="password"
                                           class="form-control"
                                           id="password"
                                           name="password"
                                           placeholder="Create a password"
                                           required>

                                </div>

                            </div>


                            <!-- CONFIRM PASSWORD -->

                            <div class="col-md-6">

                                <div class="form-group">

                                    <label for="confirmPassword">
                                        Confirm Password
                                    </label>

                                    <input type="password"
                                           class="form-control"
                                           id="confirmPassword"
                                           name="confirmPassword"
                                           placeholder="Confirm password"
                                           required>

                                </div>

                            </div>

                        </div>


                        <div class="security-note">

                            🔒 Your User ID will be generated automatically
                            after registration. Keep it safe because it will
                            be required along with your password for login.

                        </div>


                        <button type="submit"
                                class="register-btn">

                            Create My Account →

                        </button>


                    </form>


                    <div class="login-text">

                        Already have an account?

                        <a href="Login.jsp">
                            Login here
                        </a>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>


</body>
</html>