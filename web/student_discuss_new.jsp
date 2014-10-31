<%-- 
    Document   : student_discuss_new
    Created on : Oct 30, 2014, 5:53:47 PM
    Author     : Shubham
--%>

<%@page import="java.sql.*"%>
<!DOCTYPE html>

<%!

	Connection con;
	public void jspInit()
	{
		try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String conString="jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl";
		con=DriverManager.getConnection(conString,"agillfi","200024707");
		}
		catch(Exception e){
                    e.printStackTrace();
                }
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
        <div>
            <div class="container">
                <form class="form-signin" role="form" action="student_discuss_new_1.jsp" method="post">
                    <h2 class="form-signin-heading">Ask a new doubt</h2>
                    <div class="form-group col-xs-4">  Select Topic:
                <select class="form-control" name="topic">
        <%
        String token = session.getAttribute("token").toString();
        String unityid = session.getAttribute("unityid").toString();
        session.setAttribute("unityid", unityid);
        session.setAttribute("token", token);
        System.out.print(token);
        System.out.print(unityid);
	String query="SELECT C1.TID, C1.NAME FROM TOPICS C1 "
                + "WHERE C1.CID='"+token+"'";
	System.out.print(query);
        ResultSet rs;
	try{
            Statement st=con.createStatement();
            rs=st.executeQuery(query);
            
            while(rs.next()){
                String tid = rs.getString("TID");
                String name = rs.getString("NAME");
              
                %>
                    <!-- populate from courses table -->
                   
                    <option value="<%= tid %>" name='topic'> <%= name %>
                    </option>
<%
                    
                }
               }
	catch(Exception e){
		e.printStackTrace();
	}
            %>
            </select>
            </div>
                    <input type="text" class="form-control" placeholder="Enter Question" required autofocus name="question">

                    <input type="hidden" name="resolve" value="0">
                    
                    <input type="hidden" name="trivial" value="0">
                   
                  
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
            </div>
        </div>
    </body>
</html>
