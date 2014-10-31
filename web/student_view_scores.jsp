<%-- 
    Document   : view_scores
    Created on : Oct 16, 2014, 11:30:44 PM
    Author     : Maria
--%>
<%@ page import="java.sql.*" %>
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
            System.out.print("hey");
            String token = session.getAttribute("token").toString();
            String unityid = session.getAttribute("name").toString();
        %>
        <!-- follow rules on page -->
        <div class="panel panel-default">
            <div class="panel-heading">View Scores</div>
                <div class="panel-body">
                    <ul class="nav nav-pills nav-stacked">
        
        <%
	String query="SELECT S1.ATTM_ID, S1.SCORE, E1.NAME FROM STUD_EX S1, EXERCISES E1 "
                + "WHERE S1.EX_ID = E1.EXID AND S1.UNITYID='"+unityid+"' AND E1.CID='"+token+"'";
	ResultSet rs;
	try{
            Statement st=con.createStatement();
            rs=st.executeQuery(query);
            while(rs.next()){
                String name = rs.getString("NAME");
                int attm_id = rs.getInt("ATTM_ID");
                int score = rs.getInt("SCORE");
                
                %>
                    <li>Homework: <%= name %>, Attempt #: <%= attm_id %>, Score: <%= score %></li>
            <%
                }
            %>
            </ul>
            </div>
        </div>
            
            <%
            }
	catch(Exception e){
		System.out.println(e);
		throw new Exception();
	}
%>
    <a href="javascript:history.back()">Back</a>
    </body>
</html>