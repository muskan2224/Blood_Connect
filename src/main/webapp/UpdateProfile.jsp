<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">

<title>Update Profile</title>

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
    padding: 30px;
}

.profile-container {
    width: 520px;
    background: white;
    padding: 40px;
    border-radius: 18px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
}

h1 {
    text-align: center;
    color: #123b52;
    margin-bottom: 10px;
}

.subtitle {
    text-align: center;
    color: #666;
    margin-bottom: 30px;
    font-size: 14px;
}

.form-group {
    margin-bottom: 18px;
}

.form-group label {
    display: block;
    margin-bottom: 7px;
    color: #123b52;
    font-weight: bold;
    font-size: 14px;
}

.form-group input,
.form-group select {
    width: 100%;
    padding: 12px 14px;
    border: 1px solid #cbd5dc;
    border-radius: 8px;
    font-size: 15px;
    color: #333;
    background: white;
    outline: none;
}

.form-group input:focus,
.form-group select:focus {
    border-color: #16809b;
    box-shadow: 0 0 0 3px rgba(22, 128, 155, 0.12);
}

.user-id {
    background: #f1f5f7 !important;
    color: #777 !important;
    cursor: not-allowed;
}

.button-container {
    display: flex;
    justify-content: center;
    gap: 12px;
    margin-top: 25px;
}

.btn {
    padding: 12px 25px;
    border: none;
    border-radius: 8px;
    font-size: 15px;
    font-weight: bold;
    cursor: pointer;
    text-decoration: none;
    transition: 0.3s;
}

.update-btn {
    background: #16809b;
    color: white;
}

.update-btn:hover {
    background: #0d6d84;
}

.cancel-btn {
    background: #e9eef1;
    color: #123b52;
}

.cancel-btn:hover {
    background: #dce4e8;
}

.message {
    background: #fff3cd;
    color: #856404;
    border: 1px solid #ffeeba;
    padding: 12px;
    border-radius: 8px;
    margin-bottom: 20px;
    text-align: center;
}
</style>

</head>

<body>

<div class="profile-container">


<h1>Update Profile</h1>

<p class="subtitle">
    Update your personal information below
</p>

<%
    String errorMessage =
            (String) request.getAttribute("errorMessage");

    if (errorMessage != null) {
%>

    <div class="message">
        <%= errorMessage %>
    </div>

<%
    }
%>

<form action="UpdateProfileServe" method="post">

    <div class="form-group">

        <label for="userId">
            User ID
        </label>

        <input
            type="text"
            id="userId"
            name="userId"
            value="${userId}"
            class="user-id"
            readonly>
    </div>

    <div class="form-group">

        <label for="name">
            Full Name
        </label>

        <input
            type="text"
            id="name"
            name="name"
            value="${name}"
            placeholder="Enter your name"
            required>
    </div>

    <div class="form-group">

        <label for="age">
            Age
        </label>

        <input
            type="number"
            id="age"
            name="age"
            value="${age}"
            min="1"
            max="120"
            placeholder="Enter your age"
            required>
    </div>

    <div class="form-group">

        <label for="gender">
            Gender
        </label>

        <select
            id="gender"
            name="gender"
            required>

            <option value="">
                Select Gender
            </option>

            <option value="Male"
                ${gender == 'Male' ? 'selected' : ''}>
                Male
            </option>

            <option value="Female"
                ${gender == 'Female' ? 'selected' : ''}>
                Female
            </option>

            <option value="Other"
                ${gender == 'Other' ? 'selected' : ''}>
                Other
            </option>

        </select>

    </div>

    <div class="form-group">

        <label for="phone">
            Phone Number
        </label>

        <input
            type="tel"
            id="phone"
            name="phone"
            value="${phone}"
            placeholder="Enter your phone number"
            required>
    </div>

    <div class="form-group">

        <label for="city">
            City
        </label>

        <input
            type="text"
            id="city"
            name="city"
            value="${city}"
            placeholder="Enter your city"
            required>
    </div>

    <div class="button-container">

        <button
            type="submit"
            class="btn update-btn">
            Update Profile
        </button>

        <a
            href="ProfileServe"
            class="btn cancel-btn">
            Cancel
        </a>

    </div>

</form>


</div>

</body>
</html>
