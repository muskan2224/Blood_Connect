
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.sql.ResultSet" %>

<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    ResultSet donors =
        (ResultSet) request.getAttribute("donors");

    String errorMessage =
        (String) request.getAttribute("errorMessage");
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Search Donor | BloodConnect</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <style>

        body {
            background: #f5f7fb;
            font-family: Arial, sans-serif;
        }

        .navbar {
            background: linear-gradient(
                90deg,
                #b71c1c,
                #e53935
            );
        }

        .navbar-brand {
            color: white !important;
            font-weight: bold;
            font-size: 23px;
        }

        .nav-link {
            color: white !important;
        }

        .page-title {
            font-weight: bold;
            color: #b71c1c;
        }

        .card {
            border: none;
            border-radius: 14px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .filter-card {
            background: white;
        }

        .request-card {
            margin-top: 20px;
        }

        .section-title {
            color: #b71c1c;
            font-weight: bold;
        }

        .btn-danger {
            border-radius: 8px;
        }

        .donor-card {
            border-left: 5px solid #e53935;
            margin-bottom: 15px;
        }

        .blood-badge {
            background: #e53935;
            color: white;
            padding: 5px 12px;
            border-radius: 20px;
            font-weight: bold;
        }

        .available {
            color: #198754;
            font-weight: bold;
        }

        label {
            font-weight: 600;
        }

        .required {
            color: red;
        }

    </style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg">

    <a class="navbar-brand"
       href="dashboard.jsp">
        BloodConnect
    </a>

    <div class="ml-auto">

        <a class="nav-link d-inline"
           href="dashboard.jsp">
            Dashboard
        </a>

        <a class="nav-link d-inline"
           href="LogoutServe">
            Logout
        </a>

    </div>

</nav>


<div class="container mt-4 mb-5">

    <h2 class="page-title text-center mb-4">
        Search Blood Donor
    </h2>


    <!-- ERROR MESSAGE -->

    <% if (errorMessage != null) { %>

        <div class="alert alert-danger">
            <%= errorMessage %>
        </div>

    <% } %>


    <!-- SEARCH FILTER -->

    <div class="card filter-card p-4">

        <h5 class="section-title mb-3">
            Find a Suitable Donor
        </h5>

        <form action="SearchDonorServe"
              method="post">

            <div class="form-row">

                <!-- BLOOD GROUP -->

                <div class="form-group col-md-3">

                    <label>
                        Blood Group
                    </label>

                    <select name="bloodGroup"
                            class="form-control">

                        <option value="">
                            Any Blood Group
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


                <!-- CITY -->

                <div class="form-group col-md-3">

                    <label>
                        Location
                    </label>

                    <input type="text"
                           name="city"
                           class="form-control"
                           placeholder="Enter city">

                </div>


                <!-- MIN AGE -->

                <div class="form-group col-md-3">

                    <label>
                        Minimum Donor Age
                    </label>

                    <input type="number"
                           name="minAge"
                           class="form-control"
                           min="18"
                           placeholder="e.g. 18">

                </div>


                <!-- MAX AGE -->

                <div class="form-group col-md-3">

                    <label>
                        Maximum Donor Age
                    </label>

                    <input type="number"
                           name="maxAge"
                           class="form-control"
                           min="18"
                           placeholder="e.g. 40">

                </div>

            </div>


            <button type="submit"
                    class="btn btn-danger btn-block">

                Search Donors

            </button>

        </form>

    </div>


    <!-- DONOR RESULTS -->

    <%
        if (donors != null) {

            boolean found = false;

            while (donors.next()) {

                found = true;

                String donorUserId =
                    donors.getString("user_id");

                String donorBloodGroup =
                    donors.getString("blood_group");

                String donorName =
                    donors.getString("name");

                int donorAge =
                    donors.getInt("age");

                String donorGender =
                    donors.getString("gender");

                String donorCity =
                    donors.getString("city");

                String donorStatus =
                    donors.getString("status");
    %>


    <div class="card donor-card p-4">

        <div class="row">

            <div class="col-md-8">

                <h5 class="font-weight-bold">
                    <%= donorName %>
                </h5>

                <p class="mb-1">
                    <strong>Age:</strong>
                    <%= donorAge %>
                </p>

                <p class="mb-1">
                    <strong>Gender:</strong>
                    <%= donorGender %>
                </p>

                <p class="mb-1">
                    <strong>Location:</strong>
                    <%= donorCity %>
                </p>

                <p class="mb-0">
                    <strong>Blood Group:</strong>
                    <span class="blood-badge">
                        <%= donorBloodGroup %>
                    </span>
                </p>

            </div>


            <div class="col-md-4 text-md-right mt-3 mt-md-0">

                <p class="available">
                    ● <%= donorStatus %>
                </p>

                <button type="button"
                        class="btn btn-danger"
                        data-toggle="modal"
                        data-target="#requestModal<%= donorUserId %>">

                    Request Blood

                </button>

            </div>

        </div>

    </div>


    <!-- REQUEST MODAL -->

    <div class="modal fade"
         id="requestModal<%= donorUserId %>"
         tabindex="-1">

        <div class="modal-dialog modal-lg">

            <div class="modal-content">

                <div class="modal-header">

                    <h5 class="modal-title">
                        Blood Request
                    </h5>

                    <button type="button"
                            class="close"
                            data-dismiss="modal">

                        &times;

                    </button>

                </div>


                <form action="BloodRequestServe"
                      method="post">

                    <div class="modal-body">

                        <div class="alert alert-info">

                            <strong>
                                Requesting donor:
                            </strong>

                            <%= donorName %>
                            —
                            <%= donorBloodGroup %>

                        </div>


                        <!-- HIDDEN DONOR DATA -->

                        <input type="hidden"
                               name="donorId"
                               value="<%= donorUserId %>">

                        <input type="hidden"
                               name="bloodGroup"
                               value="<%= donorBloodGroup %>">


                        <div class="form-row">

                            <!-- NEEDED IN -->

                            <div class="form-group col-md-6">

                                <label>
                                    Blood Needed Within
                                    <span class="required">*</span>
                                </label>

                                <select name="neededInHours"
                                        class="form-control"
                                        required>

                                    <option value="">
                                        Select urgency
                                    </option>

                                    <option value="1">
                                        Within 1 hour
                                    </option>

                                    <option value="2">
                                        Within 2 hours
                                    </option>

                                    <option value="6">
                                        Within 6 hours
                                    </option>

                                    <option value="12">
                                        Within 12 hours
                                    </option>

                                    <option value="24">
                                        Within 1 day
                                    </option>

                                    <option value="48">
                                        Within 2 days
                                    </option>

                                    <option value="72">
                                        Within 3 days
                                    </option>

                                    <option value="168">
                                        Within 7 days
                                    </option>

                                </select>

                                <small class="text-muted">
                                    More urgent requests are prioritized first.
                                </small>

                            </div>


                            <!-- REQUESTER LOCATION -->

                            <div class="form-group col-md-6">

                                <label>
                                    Your Location
                                    <span class="required">*</span>
                                </label>

                                <input type="text"
                                       name="requesterCity"
                                       class="form-control"
                                       placeholder="Enter your city"
                                       required>

                                <small class="text-muted">
                                    Used to prioritize nearby requests.
                                </small>

                            </div>

                        </div>


                        <h6 class="section-title mt-3">
                            Required Donor Age
                        </h6>

                        <div class="form-row">

                            <!-- MINIMUM AGE -->

                            <div class="form-group col-md-6">

                                <label>
                                    Minimum Age
                                </label>

                                <input type="number"
                                       name="minAge"
                                       class="form-control"
                                       min="18"
                                       max="100"
                                       placeholder="e.g. 18">

                            </div>


                            <!-- MAXIMUM AGE -->

                            <div class="form-group col-md-6">

                                <label>
                                    Maximum Age
                                </label>

                                <input type="number"
                                       name="maxAge"
                                       class="form-control"
                                       min="18"
                                       max="100"
                                       placeholder="e.g. 40">

                            </div>

                        </div>


                        <div class="alert alert-warning">

                            <strong>How priority works:</strong>

                            <ol class="mb-0 mt-2">

                                <li>
                                    More urgent requests are handled first.
                                </li>

                                <li>
                                    Nearby requests are preferred.
                                </li>

                                <li>
                                    The donor's age is matched with the
                                    requested age range.
                                </li>

                            </ol>

                        </div>

                    </div>


                    <div class="modal-footer">

                        <button type="button"
                                class="btn btn-secondary"
                                data-dismiss="modal">

                            Cancel

                        </button>

                        <button type="submit"
                                class="btn btn-danger">

                            Send Blood Request

                        </button>

                    </div>

                </form>

            </div>

        </div>

    </div>


    <%
            }

            if (!found) {
    %>

        <div class="alert alert-warning mt-4">

            No available donors found
            matching your search.

        </div>

    <%
            }
        }
    %>

</div>


<!-- BOOTSTRAP JS -->

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js">
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js">
</script>

</body>
</html>
