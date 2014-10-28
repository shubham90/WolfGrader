<%-- 
    Document   : view_homework
    Created on : Oct 13, 2014, 8:10:35 PM
    Author 1   : adam
    aUTHOR 2   : Shubham
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
        <title>View Homework</title>
    </head>
    <body>

        <form role="form" method="POST">
            <% 
                
                int exid=Integer.parseInt(request.getParameter("hw"));
                System.out.print(exid);
                String val;               
                String query = "SELECT * FROM EXERCISES WHERE EXID= "+exid+"" ;
                ResultSet rs=null; 
                try{
                Statement st=con.createStatement();
                rs=st.executeQuery(query);
                System.out.print("In try");
                }catch(Exception e){
                    System.out.print("In catch");
                    e.printStackTrace();
                }
                
               
%>
                <table border='1' class="table table-hover">
                <th class="active">Attribute</th> 
                <th class="active">Value</th>
            <%
                while (rs.next()) {
                     if(rs.getInt("diff_range_to")=='1'){
                val="Latest Attempt";  
                
                }
                else if(rs.getInt("diff_range_to")=='2'){
                  val="Maximum Score";
                 
                }
                else{ 
                
                    val="Average Score";
    }
            %> <tr>
            <td class="info">Start Date</td>
            <td class="success"><%=rs.getString("start_date")%></td>
            </tr>
            <tr>
            <td class="info">End Date</td>
            <td class="success"><%=rs.getString("end_date")%></td>
            </tr>
            <tr>
            <td class="info">Retries</td>
            <td class="success"><%=rs.getInt("retries")%></td>
            </tr>
            <tr>
            <td class="info">Points per correct answer</td>
            <td class="success"><%=rs.getInt("points")%></td>
            </tr>
            <tr>
            <td class="info">Penalty Per Wrong Answer</td>
            <td class="success"><%=rs.getInt("penalty")%></td>
            </tr>
            <tr>
            <td class="info">Difficulty Range</td>
            <td class="success"><%=rs.getInt("diff_range")%> to <%=rs.getInt("diff_range_to")%></td>
            </tr>
            <tr>
            <td class="info">Score Selection</td>
            <td class="success"><%=val%></td>
            </tr>
            <%}%>
        </table>
  <%            
        String query1 = "SELECT Q.QTEXT, T.NAME FROM EX_QUES EQ JOIN QUESTION Q "
                + "ON EQ.QID = Q.QID JOIN TOPICS T ON Q.TID=T.TID WHERE EQ.EXID= "+exid+"" ;
                ResultSet rs1=null; 
                try{
                Statement st1=con.createStatement();
                rs1=st1.executeQuery(query1);
                System.out.print("In try1");
                }catch(Exception e){
                    System.out.print("In catch1");
                    e.printStackTrace();
                }
        %>
                 <table border='1' class="table table-hover">
                <th class="active">Topic</th> 
                <th class="active">Question</th>
            <%
                while (rs1.next()) {     
            %> <tr>
            <td class="success"><%=rs1.getString("NAME")%></td>
            <td class="info"><%=rs1.getString("QTEXT")%></td>
            
            </tr>
            
           
            <%}%>
        </table>
          <!--      <input type="submit" value="Submit" class="btn btn-primary"> &nbsp; &nbsp;        -->
 <!--               <input type="submit" value="Submit" class="btn btn-default"> &nbsp; &nbsp;    -->
     <!--           <a href="professor_add_homework.jsp">Back</a>                 -->
                <a href="javascript:history.back()">Back</a>
        </form>
        <br/>
    </body>
</html>
