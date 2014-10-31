<%-- 
    Document   : view_doubt
    Created on : Oct 30, 2014, 8:10:35 PM
    AUTHOR    : Shubham
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
        <title>View Doubt</title>
    </head>
    <body>

        <form role="form" method="POST">
            <% 
                String token= (session.getAttribute("token")).toString();
                System.out.print(token);
                String query = "SELECT distinct unityid from DISCUSS where CID='"+token+"' and trivial=1 ";
                System.out.print(query);
                ResultSet rs=null; 
                try{
                Statement st=con.createStatement();
                rs=st.executeQuery(query);
                System.out.print("In try");
                }catch(Exception e){
                   %> <h2>No such students</h2>  <%
                    e.printStackTrace();
                }
                
               
%>              <div class="col-md-4">
                <table border='1' class="table table-hover">
                <th class="active">Unityid</th> 
                
            <%
              
                while (rs.next()) {
            
                String unityid=rs.getString("unityid");
                 
            %> <tr>
            <td class="info"><%=unityid%></td>
          
                </tr>
            <%}%>
        </table>
        <a href="javascript:history.back()">Back</a>
</div>
  
        
        </form>
        <br/>
    </body>
</html>
