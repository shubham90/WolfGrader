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
               
                String query = "SELECT * FROM DISCUSS WHERE CID= '"+token+"' AND RESOLVE='1' ";
                ResultSet rs=null; 
                try{
                Statement st=con.createStatement();
                rs=st.executeQuery(query);
                System.out.print("In try");
                }catch(Exception e){
                   %> <h2>No discussion for this Class</h2>  <%
                    e.printStackTrace();
                }
                
               
%>
                <table border='1' class="table table-hover">
                <th class="active">Topic</th> 
                <th class="active">Question</th>
                <th class="active">Answer</th>
            <%
                while (rs.next()) {
                int tid= rs.getInt("tid");
                String question=rs.getString("question");
                String answer = rs.getString("answer");
                String query1 = "SELECT DISTINCT NAME FROM TOPICS WHERE TID= "+tid+"";
                ResultSet rs1=null; 
                try{
                Statement st1=con.createStatement();
                rs1=st1.executeQuery(query1);
              
                }catch(Exception e){
                    e.printStackTrace();
                }
                while (rs1.next()) {    
            %> <tr>
            <td class="info"><%=rs1.getString("name")%></td>
            <td class="success"><%=question%></td>
            <td class="success"><%=answer%></td>
                </tr>
            <%}}%>
        </table>
  
          <!--      <input type="submit" value="Submit" class="btn btn-primary"> &nbsp; &nbsp;        -->
 <!--               <input type="submit" value="Submit" class="btn btn-default"> &nbsp; &nbsp;    -->
     <!--           <a href="professor_add_homework.jsp">Back</a>                 -->
                <a href="javascript:history.back()">Back</a>
        </form>
        <br/>
    </body>
</html>
