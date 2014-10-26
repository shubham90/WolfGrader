<%-- 
    Document   : select_course
    Created on : Oct 13, 2014, 8:10:35 PM
    Author 1   : adam
    Author 2   : Shubham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <!-- perhaps have an add homework success page.. -->
        <form role="form" action="select_questions.jsp" method="POST">
                <div class="form-group col-xs-4">
                Start Date: <input type="text" class="form-control" placeholder="Enter Start Date" required><br>
                End Date: <input type="text" class="form-control" placeholder="Enter End Date" required><br>.
                Number of Attempts: <input type="text" class="form-control" placeholder="Enter Number of Attempts" required><br>
                Select Topics:
                <%
        //String token2 = request.getParameter("token");
        String token= session.getAttribute("token").toString();
        String query= "SELECT * FROM TOPICS WHERE cid= '"+token+"'";
	boolean flag=true;
	ResultSet rs;
    try{    
            Statement st=con.createStatement();
            rs=st.executeQuery(query);
            System.out.print(token);
        }
	catch(Exception e){
		System.out.println(e);
		flag=false;
		throw new Exception();
	}
                %>    <table border='1'>
            <th>Topics</th> 
            <th>Select</th>
            <%
                while (rs.next()) {
            %> <tr>
            <td><%=rs.getString("name")%></td>
            <td><input type="checkbox" name="checkbox"
                value="<%=rs.getString("tid")%>"></td>
            </tr>>
            <%
                }
            %>
        </table>
                
              <br>  Difficulty Range (1 to 6): <input type="text" class="form-control" placeholder="From" required> to <input type="text" class="form-control" placeholder="To" required><br>
                Score Selection Scheme: <select name="source" onchange="">
                                        <option value=1>Latest Attempt</option>
                                        <option value=2>Maximum Score</option>
                                        <option value=3>Average Score</option>
                                        </select> <br><br>
                Number of Questions: <input type="text" class="form-control" placeholder="Enter Number of Questions" required><br>
                <!-- TODO: Randomize seed implementation -->
                Number of Questions: <input type="text" class="form-control" placeholder="Enter Number of Questions" required><br>
                Correct Answer Points: <input type="text" class="form-control" placeholder="Enter Correct Answer Points" required><br>
                Incorrect Answer Points: <input type="text" class="form-control" placeholder="Enter Incorrect Answer Points" required><br>
                <input type="submit" value="Select Questions" class="btn btn-default"> &nbsp; &nbsp;
 <!--               <input type="submit" value="Submit" class="btn btn-default"> &nbsp; &nbsp;    -->
                <a href="professor.jsp">Back</a>
            </div>
        </form>
        <br />
    </body>
</html>
