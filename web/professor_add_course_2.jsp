<%--
    Document : add_course
    Created on : Oct 13, 2014, 8:34:08 PM
    Author : adam
--%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"
         import="java.util.Date"%>
<%!
Connection con;
public void jspInit()
{
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
String conString="jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl";
con=DriverManager.getConnection(conString,"agillfi","200024707");
}
catch(Exception e){}
}
public void jspDestroy()
{
try{
con.close();
}
catch(Exception e){
e.printStackTrace();
}
}
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <title>Add Course</title>
    </head>
    <body>
        <%
        String cid = request.getParameter("cid");
        String name = request.getParameter("name");
        String start_date = request.getParameter("start_date");
        String end_date = request.getParameter("end_date");
        
        int enrolled_students = Integer.parseInt(request.getParameter("enrolled_students"));
        int max_enrolled_students = Integer.parseInt(request.getParameter("max_enrolled_students"));
        int grad_status = Integer.parseInt(request.getParameter("grad_status"));
        String token = request.getParameter("token");
        
        String unityid = session.getAttribute("name").toString();
        
        String query="INSERT INTO COURSES (CID, NAME, START_DATE, "
                + "END_DATE, UNITYID, ENROLLED_STUDENTS, MAX_ENROLLED_STUDENTS, "
                + "GRAD_STATUS, TOKEN) VALUES('"+cid+"','"+name+"','"+start_date
                +"','"+end_date+"','"+unityid+"',"+enrolled_students+","+max_enrolled_students
                +","+grad_status+",'"+token+"')";

ResultSet rs;
try{
            Statement st=con.createStatement();
            rs=st.executeQuery(query);
            %><h2>Course <%= name %> created successfully!</h2><%
}
catch(Exception e){
            %><h2>The token value, <%= token %>, already exists!</h2><%
}%>
        
        <a href="javascript:history.back()">Back</a>
        
    </body>
</html>