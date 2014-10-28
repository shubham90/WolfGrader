<%-- 
    Document   : select_course
    Created on : Oct 13, 2014, 8:10:35 PM
    Author     : adam
--%>

<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"
         import="java.util.Date"
         import="java.util.Random"%>
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
        <title>Edit Homework</title>
    </head>
    <body>
        
       <% 
           System.out.print("I have reached Edit 2");
           int val=Integer.parseInt((request.getParameter("question_column")).toString());  
       if(val==1){
           %><h2>You have selected Start Date</h2><%
       }
       else{
           %><h2>You have selected other input</h2><%
       }
       
       
       
       
       
       
       %>
       
       
       

    </body>
</html>
