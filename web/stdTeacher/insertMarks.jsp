<%@ page import ="java.sql.*" %>
<%     
                int marks=0;
                String subid="";
                String assign="";
                String student="";
                
                marks = Integer. parseInt(request.getParameter("marks"));
                subid=request.getParameter("subjects");
                assign=request.getParameter("assign");
                student= request.getParameter("student");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gurusisya",
                        "root", null);
                Statement st = con.createStatement();
                //ResultSet rs;
                int i = st.executeUpdate("insert into remarks(subject,student_id,assignment,marks) values ('" + subid + "','" + student + "','" + assign + "'," + marks + ")");
                if (i > 0) {
                    //session.setAttribute("userid", user);
                     response.sendRedirect("evaluate.jsp?success=success"); 
                } else {
                    response.sendRedirect("evaluate.jsp?notsuccess=fail");
                }
                con.close();   
    
                    
                
                
           
    
    
    
    
    
    
%>