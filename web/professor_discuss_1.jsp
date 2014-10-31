<%-- 
    Document   : Professor_discuss
    Created on : Oct 30, 2014, 8:10:35 PM
    Author     : Shubham
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
        <title>Doubt Forum</title>
    </head>
    <body>
        
       <% 
           String question=request.getParameter("question");
           String answer=request.getParameter("answer");
           String token= (session.getAttribute("token")).toString();
           int resolve=(Integer.parseInt((request.getParameter("resolve"))));
           int trivial=(Integer.parseInt((request.getParameter("trivial"))));

   
        String query="UPDATE DISCUSS SET ANSWER='"+answer+"', "
                + "RESOLVE= "+resolve+", "
                + "trivial="+trivial+" "
                + "WHERE question='"+question+"' ";
int rs;
    

System.out.print(query);
try{
            Statement st=con.createStatement();
             rs = st.executeUpdate(query);
           // rs=st.executeUpdate(query);
            if(rs==1){
            %><h2>Doubt Updated Successfully!</h2><%
           }
            else{
          %><h2>Update Unsuccessful!</h2><%  
            }
}
catch(Exception e){
            e.printStackTrace();
}%>

        <a href="javascript:history.back()">Back</a>
       
       

    </body>
</html>
