<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FlyAway</title>
    <link rel = "shortcut icon" type = "image/png" href = "Images/Logo.jpg" >
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
        body, html {
            height: 100%;
            line-height: 1.8;
        }
        body {
            background-position: center;
            background-size: cover;
            background-image: url("Images/backdrop.jpg");
            min-height: 100%;
        }
        .w3-bar .w3-button {
            padding: 16px;
        }
        .footer {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            background-color: #f5f5f5;
            color: #3b3b3b;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="w3-bar w3-white w3-card" id="myNavbar">
    <a href="AdminPage.jsp" class="w3-bar-item w3-button w3-wide"><img src="Images/Logo.jpg" class="img-fluid" alt="image" width="18%">  FlyAway</a>
    <div class="w3-right w3-hide-small">
        <a href="LoginPage.jsp" class="w3-bar-item w3-button"><i class="fa fa-gear"></i> Admin Login</a>
    </div>
</div>
<section class="container-fluid bg">
    <section class="row justify-content-center">
        <div class="row">
            <div class="col">
                <h2 align="center" style="color:whitesmoke;"><b>FlyAway <br> Ticket Booking</b></h2>
                <br>
            </div>
        </div>
        <section class="col-sm-6 col-md-3">
            <form action="SearchServlet" class="form-container">
                <div class="form-group">
                    <label for="Date">Date</label>
                    <input type="date"  class="form-control" id="Date" name="Date" placeholder="Travel Date..">
                </div>
                <div class="form-group">
                    <label for="Source">Source</label>
                    <select  class="form-control" id="Source" name="Source">
                        <option value="India">India</option>
                        <option value="USA">USA</option>
                        <option value="UK">UK</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="Destination">Destination</label>
                    <select  class="form-control" id="Destination" name="Destination">
                        <option value="USA">USA</option>
                        <option value="UK">UK</option>
                        <option value="India">India</option>
                    </select>
                </div>
                <div>
                    <label for="Persons">No of Persons</label>
                    <select class="form-control" id="Persons" name="Persons">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <br>
                <button type="submit" class="btn btn-success btn-block" value="Submit">Search Flights</button>
            </form>
        </section>
    </section>
</section>
<div class="footer" align="center">
    FlyAway by Shazalee Lalani
</div>
</body>
</html>