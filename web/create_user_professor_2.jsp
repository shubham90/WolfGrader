<%-- 
    Document   : professor_add_homework_2
    Created on : Oct 26, 2014, 10:05:29 AM
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
        <title>Create User</title>
    </head>
    <body>
        <form id="create_user_professor" role="form" method="POST">
        <%
        String unityid =request.getParameter("unityid");
        String fname =request.getParameter("fname");
        String lname =request.getParameter("lname");
        String password =request.getParameter("password");
        int role= Integer.parseInt(request.getParameter("role"));
         
        String query=" SELECT UNITYID FROM USERS WHERE UNITYID= '"+unityid+"' ";

ResultSet rs= null;
try{
            Statement st=con.createStatement();
            rs=st.executeQuery(query);
}
catch(Exception e){
            %><h2>Unity id already exists!!</h2><%
}

    if (rs.next()) {
    do {
      %><h2>Unity Id already exists!</h2> <%
    } while(rs.next());
} else {  
   String query2=" INSERT INTO USERS (UNITYID, PASSWORD, ROLE "
                + ")VALUES('"+unityid+"', '"+password+"', "+role+")";

      System.out.print(query2);

ResultSet rs1= null;
ResultSet rs2= null;
try{
            Statement st2=con.createStatement();
            rs2=st2.executeQuery(query2);
}
catch(Exception e){
            %><h2>User cannot be Created!</h2><%
}

   String query1=" INSERT INTO PROF (UNITYID, FNAME, LNAME"
                + ")VALUES('"+unityid+"', '"+fname+"', '"+lname+"')";
   try{
           Statement st1=con.createStatement();
            rs1=st1.executeQuery(query1);
            %> <h2>User created Successfully!</h2> <%

}
catch(Exception e){
            e.printStackTrace();
}
}
%>
    <!--    <a href="professor_add_homework.jsp">Back</a>                  -->
        <a href="javascript:history.back()">Back</a>
        </form>   
    </body>
</html>