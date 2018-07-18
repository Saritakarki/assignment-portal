<%-- 
    Document   : viewMarks
    Created on : Jun 21, 2018, 4:43:14 PM
    Author     : Sarita Karki
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../shared/header.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://bootswatch.com/3/flatly/bootstrap.min.css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  
        <title>Marks</title>
    </head>
    <br>
    <div class="container">
    <body>
        <% 
  String subid=request.getParameter("subjects");
  String user = (String)session.getAttribute("user_id");
  Class.forName("com.mysql.jdbc.Driver");
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gurusisya",
            "root", null);
  Statement st = con.createStatement();
  ResultSet rs;
    rs = st.executeQuery("select assignment, marks from remarks where subject='" + subid + "' and student_id='" + user + "'");
   %>
    <table class="table table-striped table-hover ">
    <tr class="active">
       <th >Assignment Name</th>
      <th >Marks</th>
    </tr>
  <%  
    while( rs.next()){
    String assignment=rs.getString("assignment");
    String marks=rs.getString("marks");
  %>
    <tr >
      <td><% out.print(assignment); %></td>
      <td><%     out.print(marks); %></td>
    </tr>
   <% } %>
</table> 
    </body>
    
    </div>
</html>
