<%-- 
    Document   : attempt_homework
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
        <title>Attempt Homework</title>
    </head>
    <body>
        <% 
            String token = session.getAttribute("token").toString(); 
            String unityid = session.getAttribute("name").toString();
        %>
        <!-- follow rules on page -->
        <h1>Homework for <%= token %>!</h1>
                        
        <%
        Date date = new Date( );
        long time = date.getTime();
        String current_time = Long.toString(time);
        SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String formatted = sdf.format(date.getTime());
        
        %><script>console.log("<%= formatted %>");
                    </script>
        <%
        String query="SELECT E1.*, S1.* FROM EXERCISES E1, STUD_EX S1 "
                + "WHERE E1.CID='"+token+"' "
                + "AND TO_CHAR(E1.START_DATE, 'yyyy-MM-dd hh:mm:ss') <='"+formatted+"'"
                + "AND TO_CHAR(E1.END_DATE, 'yyyy-MM-dd hh:mm:ss') >'"+formatted+"'AND S1.UNITYID = '"+unityid+"'";
	ResultSet rs;
        %>
        <form role="form" action="student_attempt_homework_pt_2.jsp" method="POST">
            <div class="form-group col-xs-4">
                <select class="form-control" name="homework">
                    <option value="">Select an Option...</option>
        <%
	try{
            Statement st=con.createStatement();
            rs=st.executeQuery(query);
            while(rs.next()){
                int exid = rs.getInt("EXID");
                String cid = rs.getString("CID");
                int retries = rs.getInt("RETRIES");
                int attm_id = rs.getInt("ATTM_ID");
                String name = rs.getString("NAME");
                
                if(attm_id >= retries){
                    %>
                    <option value="<%= exid %>" disabled><%= name %> (No more retries)</option>
                    <%
                }
                else if (retries > 5000){
                    %>
                    <option value="<%= exid %>"><%= name %> (Unlimited retries)</option>
                    <%
                }
                else if (attm_id < retries){
                    %>
                    <option value="<%= exid %>"><%= name %> (<%= retries %> retries)</option>
                    <%
                }
                %>
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
		//System.out.println(e);
		//throw new Exception();
            
	}
%>
                    <a href="javascript:history.back()">Back</a>
                </div>
        </div>
    </body>
</html>