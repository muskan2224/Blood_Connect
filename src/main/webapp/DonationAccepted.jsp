<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>
Donation Accepted
</title>

<meta name="viewport"
      content="width=device-width, initial-scale=1">


<style>

body {

    margin: 0;

    min-height: 100vh;

    display: flex;

    justify-content: center;

    align-items: center;

    background:
        linear-gradient(
            135deg,
            #fff5f5,
            #ffe0e0
        );

    font-family: Arial, sans-serif;
}


.card {

    width: 90%;

    max-width: 600px;

    background: white;

    padding: 45px;

    border-radius: 20px;

    text-align: center;

    box-shadow:
        0 15px 40px
        rgba(0,0,0,.12);
}


.success-icon {

    width: 80px;

    height: 80px;

    margin: auto;

    border-radius: 50%;

    background: #e8f7ee;

    color: #198754;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 45px;

    font-weight: bold;
}


h1 {

    color: #9b111e;

    margin-top: 20px;

    font-weight: 800;
}


p {

    color: #666;

    line-height: 1.7;
}


.info {

    margin-top: 25px;

    padding: 18px;

    border-radius: 12px;

    background: #fff5f5;

    color: #8f101b;
}


.btn {

    display: inline-block;

    margin-top: 20px;

    background: #d62828;

    color: white;

    padding: 12px 25px;

    border-radius: 10px;

    text-decoration: none;

    font-weight: bold;
}


.btn:hover {

    background: #b71c1c;

    color: white;

    text-decoration: none;
}

</style>

</head>


<body>


<div class="card">


    <div class="success-icon">

        ✓

    </div>


    <h1>

        Thank You, Donor!

    </h1>


    <p>

        You have successfully accepted
        the blood request.

        Your support can help save a life.

    </p>


    <div class="info">

        <strong>
            Your donor account has been
            temporarily removed from the
            available donor list.
        </strong>

        <br><br>

        You will be eligible to register
        again after <strong>3 months</strong>.

    </div>


    <a href="Login.jsp"
       class="btn">

        Continue to Login

    </a>


</div>


</body>

</html>