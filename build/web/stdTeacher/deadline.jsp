<%-- 
    Document   : deadline
    Created on : Jun 4, 2018, 12:38:36 PM
    Author     : Sarita Karki
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
        <%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gurusisya",
            "root", null);
    Statement st = con.createStatement();
    ResultSet rs;
    rs=st.executeQuery("select * from newassignment");
    %>
  <% 
  List event=new ArrayList();
 // Map obj= new HashMap<String, String>();
   
  while(rs.next()){
      JSONObject eventdata=new JSONObject();
      //obj.put("date", rs.getString("deadline"));
      //obj.put("subject", rs.getString("subject_id"));
       eventdata.put("date", rs.getString("deadline"));
       eventdata.put("title",rs.getString("subject_id"));
       eventdata.put("url", "uploadForm.jsp?subjects="+rs.getString("subject_id"));
      event.add(eventdata);
      //event.put(obj);
      
  }  
  rs.close();
out.print(event);%>
    
