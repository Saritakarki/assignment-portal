<%-- 
    Document   : viewFile
    Created on : May 4, 2018, 5:01:43 PM
    Author     : Sarita Karki
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
        <title></title>
    </head>
    <br>
    <div class="container">
    <body>
   <% 
  String subid=request.getParameter("subjects");
   String filePath = "http://localhost:8080/gurusisyas/uploads/";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gurusisya",
            "root", null);
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select file,DATE(uploaded_date) as date, deadline from newassignment a inner join teacher u on a.teacher_id=u.id where a.subject_id='" + subid + "'");
   %>
    <table class="table table-striped table-hover ">
    <tr class="active">
       <th >Filename</th>
       <th>Uploaded Date</th>
        <th>Deadline</th>
    </tr>
  <%  
    while( rs.next()){
    String filename=rs.getString("file");
    String date=rs.getString("date");
  String deadline=rs.getString("deadline");%>
    <tr >
      <td><a href="<%out.print(filePath+filename); %>" download>
    <%
    out.print(filename);
    %></a></td>
      <td><%     out.print(date); %></td>
      <td><%     out.print(deadline); %></td>
    </tr>
   <% } %>
</table> 
       
     
    </body>
    </div>
</html>
