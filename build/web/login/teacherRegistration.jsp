<%-- 
    Document   : registration
    Created on : Aug 27, 2017, 8:11:25 AM
    Author     : Sarita
--%>

<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("uname");
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String subject_id= request.getParameter("subjects");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gurusisya",
            "root", null);
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into teacher(first_name, last_name, email_id, uname, passwd,subject_id) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "','" + subject_id + "')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("../index.jsp");
    } else {
        response.sendRedirect("../index.jsp");
    }
%>