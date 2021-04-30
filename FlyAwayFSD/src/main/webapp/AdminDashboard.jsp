<%@page import="java.sql.*"%>
<%@page import="servlets.Login"%>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FlyAway Airlines</title>
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
<%
    if (Login.isLoggedIn) {
%>
<div class="container">
    <h2 align="center"><b>Admin Dashboard</b></h2>
    <p align="center"><span><strong>You are LoggedIn as : <%=Login.email%>. Your Password is : <%=Login.password%></strong></span></p><br>
    <br>
    <div class="row">
        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
            <form method="post" action="PasswordChange.jsp">
                <button type="submit" class="btn btn-success mb-2 btn-block">Change Password</button>
            </form>&ensp;
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
            <form method="post" action="ShowBookings.jsp">
                <button type="submit" class="btn btn-success mb-2 btn-block">Previous bookings</button>
            </form>&ensp;
        </div>
         <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
            <form method="post" action="AddFlight.jsp">
                <button type="submit" class="btn btn-success mb-2 btn-block">Add new Flight</button>
            </form>&ensp;
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
            <form method="post" action="LoginPage.jsp">
                <button type="submit" class="btn mb-2 btn-danger btn-block">Logout</button>
            </form>
        </div>
        <br>
    </div>
</div>

<section class="container-fluid">
    <section class="row justify-content-center">
        <section>
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th scope="col">Flight ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Source</th>
                    <th scope="col">Destination</th>
                    <th scope="col">Day</th>
                    <th scope="col">Ticket Price</th>
                </tr>
                </thead>
                <tbody>
                <p style="text-align:center;">
                    <img src="Images/router.jpg" alt="route">
                </p>
                <p align="center"><span><strong> Flight Table </strong></span></p>
                <%
                    try{
                    	Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/fly_away","root","2252");
                        Statement st=con.createStatement();
                        String sql ="SELECT * FROM flight_table";
                        ResultSet rs= st.executeQuery(sql);
                        while(rs.next()){
                %>
                <tr>
                    <td><%=rs.getString("FlightID") %></td>
                    <td><%=rs.getString("Name") %></td>
                    <td><%=rs.getString("Source") %></td>
                    <td><%=rs.getString("Destination") %></td>
                    <td><%=rs.getString("Day") %></td>
                    <td><%=rs.getString("TicketPrice") %></td>
                </tr>
                <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    else {
                        out.print("You must Login first");
                    }
                %>
                </tbody>
            </table>
        </section>
    </section>
</section>
<div class="footer" align="center">
    FlyAway by Shazalee Lalani
</div>
</body>
</html>