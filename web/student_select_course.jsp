<%-- 
    Document   : select_course
    Created on : Oct 13, 2014, 8:10:35 PM
    Author     : adam
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
        <title>Select Course</title>
    </head>
    <body>
        <form role="form" action="student_course.jsp" method="POST">
            <div class="form-group col-xs-4">
                <select class="form-control" name="course">
        <%
        String test = session.getAttribute("name").toString();
        
	String query="SELECT C1.CID, C1.NAME FROM COURSES C1, COURSE_ROSTER C2 "
                + "WHERE C1.TOKEN = C2.CID AND C2.UNITYID='"+test+"'";
	ResultSet rs;
	try{
            Statement st=con.createStatement();
            rs=st.executeQuery(query);
            while(rs.next()){
                String name = rs.getString("NAME");
                String cid = rs.getString("CID");
                %>
                    <!-- populate from courses table -->
                    <option value="<%= cid + "-" + name %>"><%= cid + "-" + name %></option>
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
        <br />
        <a href="student.jsp">Back</a>
    </body>
</html>
