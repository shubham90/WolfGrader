<%-- 
    Document   : professor_add_homework_2
    Created on : Oct 26, 2014, 10:05:29 AM
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
<%
Random rand = new Random();
int exid = rand.nextInt(90000) + 10000;
session.setAttribute( "exid", exid );
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
        <title>Add Homework</title>
    </head>
    <body>
        <form id="add_homework_2" role="form" action="select_questions.jsp" method="POST">
        <%! String[] tid; %>
        <%
        String token= session.getAttribute("token").toString();
        session.setAttribute("token",token);
        int diff_range = Integer.parseInt(request.getParameter("diff_range_from"));
        session.setAttribute( "diff_range", diff_range);
        int diff_range_to = Integer.parseInt(request.getParameter("diff_range_to"));
        session.setAttribute( "diff_range_to", diff_range_to );
        String start_date = request.getParameter("start_date");
        String end_date = request.getParameter("end_date");
        String name = request.getParameter("name");
        int points = Integer.parseInt(request.getParameter("points"));
        int retries = Integer.parseInt(request.getParameter("retries"));
        int penalty = Integer.parseInt(request.getParameter("penalty"));
        int randomize = Integer.parseInt(request.getParameter("penalty"));
        int score_selection = Integer.parseInt(request.getParameter("score_selection")); 
        tid= (request.getParameterValues("checkbox"));
        
        int[] inttid = new int[tid.length];
        for (int i = 0; i < tid.length; i++) {
            inttid[i] = Integer.parseInt(tid[i]);
        }
        session.setAttribute( "tid", inttid );
         
        String query="INSERT INTO EXERCISES (EXID, DIFF_RANGE, CID, RETRIES, "
                + "START_DATE, END_DATE, POINTS, PENALTY, RANDOMIZE, "
                + "SCORE_SELECTION, DIFF_RANGE_TO,NAME)VALUES("+exid+","+diff_range+", "
                + " '"+token+"', "+retries+", '"+start_date+"', '"+end_date+"', "
                + " "+points+","+penalty+","+randomize+", "
                + " "+score_selection+","+diff_range_to+", '"+name+"')";

ResultSet rs;
try{
            Statement st=con.createStatement();
            rs=st.executeQuery(query);
            %><h2>Exercise for <%= token %> created successfully!</h2><%
}
catch(Exception e){
            %><h2>Unable to create exercise for, <%= token %></h2><%
}%>
        <input type="submit" value="Select Questions" class="btn btn-primary">
        <a href="professor_add_homework.jsp">Back</a>
        </form>   
    </body>
</html>