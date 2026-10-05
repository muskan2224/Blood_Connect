<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Donation Successful</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #061a2b, #0d4668, #16809b);
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.success-container {
    width: 450px;
    background: white;
    border-radius: 18px;
    padding: 45px 35px;
    text-align: center;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
}

.success-icon {
    width: 80px;
    height: 80px;
    margin: 0 auto 20px;
    border-radius: 50%;
    background: #e8f8ee;
    color: #1e9e52;
    font-size: 45px;
    display: flex;
    justify-content: center;
    align-items: center;
}

h1 {
    color: #123b52;
    margin-bottom: 15px;
    font-size: 28px;
}

.message {
    color: #555;
    font-size: 16px;
    line-height: 1.6;
    margin-bottom: 25px;
}

.thank-you {
    color: #16809b;
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 25px;
}

.buttons {
    display: flex;
    justify-content: center;
    gap: 12px;
    flex-wrap: wrap;
}

.btn {
    text-decoration: none;
    padding: 12px 22px;
    border-radius: 8px;
    font-size: 15px;
    font-weight: bold;
    transition: 0.3s;
}

.dashboard-btn {
    background: #16809b;
    color: white;
}

.requests-btn {
    background: #e8f8ee;
    color: #16809b;
    border: 1px solid #16809b;
}

.btn:hover {
    transform: translateY(-2px);
    opacity: 0.9;
}
</style>

</head>

<body>

<div class="success-container">

```
<div class="success-icon">
    ✓
</div>

<h1>Request Accepted Successfully!</h1>

<p class="message">
    Thank you for accepting the blood request.
    Your willingness to donate blood can help save someone's life.
</p>

<p class="thank-you">
    ❤️ Your contribution can make a difference.
</p>

<div class="buttons">

    <a href="Dashboard.jsp" class="btn dashboard-btn">
        Back to Dashboard
    </a>

    <a href="MyRequestsServe" class="btn requests-btn">
        View My Requests
    </a>

</div>
```

</div>

</body>
</html>
