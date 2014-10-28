<%-- 
    Document   : select_course
    Created on : Oct 13, 2014, 8:10:35 PM
    Author 1   : adam
    Author 2   : Shubham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
        <title>Add Exercise</title>
    </head>
    
    
    <body>
        
        <script>
             $(function() {
                $("#datepicker1").datepicker({ dateFormat: "dd MM yy" });
                $("#datepicker2").datepicker({ dateFormat: "dd MM yy" });
            });
        </script>
        <!-- perhaps have an add homework success page.. -->
        <form role="form" action="professor_add_homework_2.jsp" method="POST">
                <div class="form-group col-xs-4">
                <br><br><p>Start Date: <input type="text" id="datepicker1" required name='start_date'></p>
                End Date : <input type="text" id="datepicker2" required name='end_date'><br><br>
                Name of the Homework : <input type="text" class="form-control" placeholder="Name of Homework" required name='name'><br><br>
                Number of Attempts: <input type="text" class="form-control" placeholder="Enter Number of Attempts" required name= 'retries'><br>
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
       //     System.out.print(token);
        }
	catch(Exception e){
		System.out.println(e);
		flag=false;
		throw new Exception();
	}
                %>    <table border='1' class="table table-hover">
            <th class="active">Topics</th> 
            <th class="active">Select</th>
            <%
                while (rs.next()) {
            %> <tr>
            <td class="info"><%=rs.getString("name")%></td>
            <td class="success"><input type="checkbox" name="checkbox"
                value="<%=rs.getString("tid")%>"></td>
            </tr>
            <%
                }
            %>
        </table>
                
              <br>  Difficulty Range (1 to 6): <input type="text" class="form-control" placeholder="From" required name='diff_range_from'> to <input type="text" class="form-control" placeholder="To" required name='diff_range_to'><br>
                Score Selection Scheme: <select name="score_selection" onchange="">
                                        <option value=1>Latest Attempt</option>
                                        <option value=2>Maximum Score</option>
                                        <option value=3>Average Score</option>
                                        </select> <br><br>
                <!-- TODO: Randomize seed implementation -->
                Correct Answer Points: <input type="text" class="form-control" placeholder="Enter Correct Answer Points" required name='points'><br>
                Incorrect Answer Points: <input type="text" class="form-control" placeholder="Enter Incorrect Answer Points" required name='penalty'><br>
                <input type="submit" value="Submit" class="btn btn-default"> &nbsp; &nbsp;
 <!--               <input type="submit" value="Submit" class="btn btn-default"> &nbsp; &nbsp;    -->
        <!--        <a href="professor.jsp">Back</a>                                       -->
                <a href="javascript:history.back()">Back</a>
            </div>
        </form>
        <br />
    </body>
</html>