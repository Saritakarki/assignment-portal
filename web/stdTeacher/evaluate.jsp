<%-- 
    Document   : remarks
    Created on : May 29, 2018, 12:23:47 PM
    Author     : Sarita Karki
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../shared/teacherHeader.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../js/main.js"></script>
        <link rel="icon" type="image/png" href="../images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../css/util.css">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
        <title>Remarks</title>
    </head>
    <body>
        <br>
        <div style="background-color: #cccccc">
            <div class="col-sm-6" style="width:100%">
            
            </div>
       <div class="col-sm-4" style="margin-left: 500px; text-align: center" >
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">Send Remarks here!</h3>
        </div>
            <div class="panel-body">
                <h5 style="color:#18bc9c "> Choose Student ID</h5>
                
<form action="insertMarks.jsp" method="post">  
    <div class="form-group">
                    <%
             try{
           String user = (String)session.getAttribute("user_id");
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gurusisya",
                       "root", null);
           Statement st=con.createStatement();
               ResultSet rs;
               rs = st.executeQuery("select subject_id from teacher where id='" + user + "'");
               %>
    
<select name="subjects" id="subjects" required="required">
    
            <%
        while( rs.next()){
            String subjects=rs.getString("subject_id");
          %>


        <option value="<%=subjects%>"><%=subjects%></option>
              <% 
                }
               %>


        <%
        }
        catch(SQLException sqe)
        { 
        out.println(sqe);
        }
        %>
</select>
                <br>
                      <h5 style="color:#18bc9c "> Choose Student ID</h5>

                         <%
                  try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/gurusisya",
                            "root", null);
                Statement st1=con1.createStatement();
                    ResultSet rs1;
                    rs1 = st1.executeQuery("select id from users");
                    %>

<select name="student" id="student" required="required">

                    <%
                while( rs1.next()){
                    String student=rs1.getString("id");
                  %>


                <option value="<%=student%>"><%=student%></option>
                      <% 
                        }
                       %>


                <%
                }
                catch(SQLException sqe)
                { 
                out.println(sqe);
                }
                %>
</select>
                    <br>
                    <br>
                    
                    
<input class="input100" type="text" name="assign" id="assign" placeholder="Assignment Name" style="height:50px; width: 250px; margin-left:100px">
<span class="focus-input100"></span>  
                <br>
                    
 <input class="input100" type="number" name="marks" id="marks" placeholder="Marks" style="height:50px; width: 250px; margin-left:100px">
 <span class="focus-input100"></span>        
 <br>                           
 <button type="submit" class="btn btn-success">Submit</button>
                
                    <%if(request.getParameter("success")!=null)
                {%>
                <p style="color: #f39c12"> <% out.print("Remarks submitted successfully"); %> </p>
                 
                <%} 
                
                %>
                <%if(request.getParameter("notsuccess")!=null)
                {%>
                <p style="color: #f39c12"> <% out.print("Sorry remarks could not be submitted!"); %> </p>
                 
                <%} 
                
                %>
    </div>
                </form>
                
            </div>
        
    </div>
</div>
        </div>
       
        <script src="../vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/bootstrap/js/popper.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/tilt/tilt.jquery.min.js"></script>
         
    </body>
    
</html>
