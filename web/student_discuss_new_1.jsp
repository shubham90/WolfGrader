<%-- 
    Document   : student_discuss_new_1
    Created on : Oct 30, 2014, 10:05:29 AM
    Author     : Shubham
--%>

<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
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
        <title>New Doubt</title>
    </head>
    <body>
        <form id="new_discuss" role="form" method="POST">
        <%
        String unityid =(session.getAttribute("unityid")).toString();
        String token =(session.getAttribute("token")).toString();
        String question =request.getParameter("question");
        int tid= Integer.parseInt(request.getParameter("topic"));
        int resolve= Integer.parseInt(request.getParameter("resolve"));
        int trivial= Integer.parseInt(request.getParameter("trivial"));
         


   String query1=" INSERT INTO Discuss (UNITYID, CID, TID, TRIVIAL, RESOLVE,"
           + " QUESTION)VALUES('"+unityid+"','"+token+"', "+tid+" ,"+trivial+","
           + " "+resolve+", '"+question+"' )";
   
   ResultSet rs1;
   try{
           Statement st1=con.createStatement();
            rs1=st1.executeQuery(query1);
            %> <h2>Doubt posted!</h2> <%

        }
catch(Exception e){
    %> <h2>Doubt already posted! Please see log!</h2> <%
            e.printStackTrace();
            }

%>
      <a href="javascript:history.back()">Back</a>

        
        </form>   
    </body>
</html>