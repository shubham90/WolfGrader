<%-- 
    Document   : view_submissions
    Created on : Oct 16, 2014, 11:36:48 PM
    Author     : Maria
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
        <title>View Scores</title>
    </head>
    <body>
        <%
            String token = session.getAttribute("token").toString();
            String unityid = session.getAttribute("name").toString();
        %>
        <!-- follow rules on page -->
        <div class="panel panel-default">
            <div class="panel-heading">View Homeworks Past Due Date</div>
                <div class="panel-body">
                    <form role="form" action="student_view_past_submissions_2.jsp" method="POST">
                        <div class="form-group col-xs-4">
                            <select class="form-control" name="homework">
                                <option value="">Select an Option...</option>

                    <%
                    Date date = new Date( );
                    long time = date.getTime();
                    String current_time = Long.toString(time);
                    SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                    String formatted = sdf.format(date.getTime());    
                                 
                    String query="SELECT S1.ATTM_ID, S1.SCORE, E1.NAME FROM STUD_EX S1, EXERCISES E1 "
                            + "WHERE S1.EX_ID = E1.EXID AND S1.UNITYID='"+unityid+"' AND E1.CID='"+token+"' "
                            + "AND TO_CHAR(E1.END_DATE, 'yyyy-MM-dd hh:mm:ss') < '" + formatted + "'";
                    ResultSet rs;
                    try {
                        Statement st=con.createStatement();
                        rs=st.executeQuery(query);
                        while(rs.next()){
                            String name = rs.getString("NAME");
                            int attm_id1 = rs.getInt("ATTM_ID");
                            int score = rs.getInt("SCORE");
      
                    %>    
                            <option value="attm_id1">Homework: <%= name %>, Attempt #: <%= attm_id1 %>, Score: <%= score %></option>
                        <%
                        }
                        %>
                        </select>
                        </div>

                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>
                    <%
                    }
                    catch (Exception e) {
                        System.out.println(e);
                        throw new Exception();
                    }
                    %>
                </div>
        </div>
                
                
        <div class="panel panel-default">
            <div class="panel-heading">View Homeworks still open</div>
                <div class="panel-body">
                    <form role="form" action="student_view_past_submissions_2.jsp" method="POST">
                        <div class="form-group col-xs-4">
                            <select class="form-control" name="homework">
                                <option value="">Select an Option...</option>

                    <%
                    Date date1 = new Date( );
                    long time1 = date1.getTime();
                    String current_time1 = Long.toString(time1);
                    SimpleDateFormat sdf1  = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                    String formatted1 = sdf1.format(date1.getTime());    
                                 
                    String query2="SELECT S1.ATTM_ID, S1.SCORE, E1.NAME FROM STUD_EX S1, EXERCISES E1 "
                            + "WHERE S1.EX_ID = E1.EXID AND S1.UNITYID='"+unityid+"' AND E1.CID='"+token+"' "
                            + "AND TO_CHAR(E1.END_DATE, 'yyyy-MM-dd hh:mm:ss') >= '" + formatted1 + "'";
                    ResultSet rs2;
                    try{
                        Statement st=con.createStatement();
                        rs2=st.executeQuery(query2);
                        while(rs2.next()){
                            String name = rs2.getString("NAME");
                            int attm_id2 = rs2.getInt("ATTM_ID");
                            System.out.print(attm_id2);
                            int score = rs2.getInt("SCORE");

                            %>
                            <option value="attm_id2">Homework: <%= name %>, Attempt #: <%= attm_id2 %>, Score: <%= score %></option>
                        <%
                            }
                        %>
                        </select>
                        </div>

                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>
                        <%
                        }
                    catch(Exception e){
                            System.out.println(e);
                            throw new Exception();
                    }
%>
                </div>
        </div>
    <a href="javascript:history.back()">Back</a>
    </body>
</html>
