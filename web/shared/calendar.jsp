<%-- 
    Document   : calendar
    Created on : May 31, 2018, 5:02:31 PM
    Author     : Sarita Karki
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link  rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js"> </script>
<style>
    .fc-scroller,.fc-day-grid-container{
        height: 100% !important;
    }
</style>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <h4 style="margin-left: 250px; color: red">Deadlines Are Marked in Calendar </h4>
        <% String url=(String)request.getRequestURI();
        String nurl=url.substring(url.lastIndexOf('/')+1);
        String student="assignment.jsp";
                
        if(nurl.equals(student)) {%>
        <script type="text/javascript">
            $(function() {
        today = new Date();
        y = today.getFullYear();
        m = today.getMonth();
        d = today.getDate();

  // page is now ready, initialize the calendar...

  $('#calendar').fullCalendar({
    
            
            selectable: true,
            selectHelper: true,
            
            events: {
   url: "http://localhost:8080/gurusisyas/stdTeacher/deadline.jsp",
   color: 'red',
   textColor: 'white'
 },
            
                        
  eventClick: function(event) {
   if (event.url) {
     window.open(event.url);
     return false;
   }
 }
  
  })

});
        </script> 
        <%}
        else {%>
            
            <script type="text/javascript">
            $(function() {
        today = new Date();
        y = today.getFullYear();
        m = today.getMonth();
        d = today.getDate();

  // page is now ready, initialize the calendar...

  $('#calendar').fullCalendar({
    
            
            selectable: true,
            selectHelper: true,
            
            events: {
   url: "http://localhost:8080/gurusisyas/stdTeacher/deadline.jsp",
   color: 'red',
   textColor: 'white'
 },
     eventClick: function(event) {
   if (event.url) {
     //window.open(event.url);
     return false;
   }
 }        
  })

});
        </script> 
                
            <%}
        %>
    </body>
</html>
