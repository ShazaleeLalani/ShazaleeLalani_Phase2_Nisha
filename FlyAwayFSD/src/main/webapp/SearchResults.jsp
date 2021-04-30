<%@page import="java.sql.*"%>
<%@ page import="model.Search" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Search Results - FlyAway Airlines</title>
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
        body{
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
<div class="container">
    <h2 align="center"><span><strong>Search Results</strong></span></h2>
    <p align="center"><span><strong>
        Showing available flights from <%=Search.Source%> to  <%=Search.Destination%> <br>
        Date of travel : <%=Search.Date%> (<%=Search.Day%>)  <br>
        No of travellers :  <%=Search.Persons%>  <br>
    </p>
    <table class="table table-hover table-striped">
        <thead>
        <tr>
            <th scope="col">Flight</th>
            <th scope="col">Source</th>
            <th scope="col">Destination</th>
            <th scope="col">Date</th>
            <th scope="col">Ticket Price</th>
            <th scope="col">Select</th>
        </tr>
        </thead>
        <tbody>
        <br><p align="center"><span><strong>Select a flight</strong></span></p><br>
        <%
        try{
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/fly_away", "root", "2252");
           Statement st = con.createStatement();
           String query = Search.getQuery();
           ResultSet rs = st.executeQuery(query);
           while(rs.next()){
        %>
		<tr bgcolor="#F5F5F5">
            <td><%=rs.getString("Name") %></td>
            <td><%=rs.getString("Source") %></td>
            <td><%=rs.getString("Destination") %></td>
            <td><%=Search.Date%></td>
            <td><%=rs.getString("TicketPrice") %></td>
            <td>                <form action="BookFlight.jsp" method="post">
                    <input type="hidden" id="Name" name="Name" value="<%=rs.getString("Name")%>">
                    <input type="hidden" id="TicketPrice" name="TicketPrice" value="<%=rs.getString("TicketPrice")%>">
                    <input type="hidden" id="FlightID" name="FLightID" value="<%=rs.getString("FlightID")%>">
                    <input type="submit" class="btn btn-success" value="Book This Flight">
                </form>
            </td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        </tbody>
    </table>
</div>
<div class="footer" align="center">
    FlyAway by Shazalee Lalani
</div>
</body>
</html>
