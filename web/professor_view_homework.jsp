<%-- 
    Document   : view_homework
    Created on : Oct 27, 2014, 8:10:35 PM
    Author 1   : adam
    Author 2   : Shubham
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
        <title>View Homework</title>
    </head>
    <body>
        <form role="form" action="professor_view_homework_pt_2.jsp" method="POST">
            <div class="form-group col-xs-4">
                <h2>Please Select a Homework to View</h2>
                <select class="form-control" name="hw">
                     
        <%
        String token = session.getAttribute("token").toString();
        
	String query="SELECT E1.NAME, E1.EXID FROM EXERCISES E1 "
                + "WHERE E1.CID='"+token+"'";
	ResultSet rs;
	try{
            Statement st=con.createStatement();
            rs=st.executeQuery(query);
           
            while(rs.next()){
                String name = rs.getString("NAME");
                String exid = rs.getString("EXID");
                %>
                    <!-- populate from courses table -->
                    <option value="<%= exid %>" name='exid'> <%= name+ "-" + token %>
                    </option>
<%
                    
                }
            
            %>
            </select>
            
            <br>
            <button type="submit" class="btn btn-default">Submit</button>
            <a href="javascript:history.back()">Back</a>
            </div>
        </form>
            <%
            }
	catch(Exception e){
		System.out.println("in catch view1");
		throw new Exception();
	}
%>
        <br />
        
    </body>
</html>