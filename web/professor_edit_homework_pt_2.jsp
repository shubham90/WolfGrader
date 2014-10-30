<%-- 
    Document   : Edit_Hmework
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
    
    
     <script>
             $(function() {
                $("#datepicker1").datepicker({ dateFormat: "dd MM yy" });
                $("#datepicker2").datepicker({ dateFormat: "dd MM yy" });
            });
        </script>
        
        </head>
        
        <body>
        <!-- perhaps have an add homework success page.. -->
        <form role="form" action="professor_edit_homework_pt_2_1.jsp" method="POST">
                <div class="form-group col-xs-4">
               
                <%

        int exid=Integer.parseInt(request.getParameter("hw"));
        session.setAttribute("exid", exid);
        String query= "SELECT * FROM EXERCISES WHERE EXID= "+exid+"";
	boolean flag=true;
	ResultSet rs;
    try{    
            Statement st=con.createStatement();
            rs=st.executeQuery(query);

        }
	catch(Exception e){
		System.out.println(e);
		 
		throw new Exception();
	}
               
                while (rs.next()) {
                String start_date = rs.getString("start_date");
                String end_date = rs.getString("end_date");
                int retries= rs.getInt("retries");
                int diff_range= rs.getInt("diff_range");
                int diff_range_to= rs.getInt("diff_range_to");
                int score_selection= rs.getInt("score_selection");
                int points= rs.getInt("points");
                int penalty= rs.getInt("penalty");
                
                %>      
                
                <br><br><p>Start Date: <input type="text" id="datepicker1" required name='start_date' value='<%=start_date%>'></p>
                End Date : <input type="text" id="datepicker2" required name='end_date' value='<%=end_date%>'><br><br>
                Number of Attempts: <input type="text" class="form-control" required name= 'retries' value='<%=retries%>'><br>
 
                Score Selection Scheme: <select name="score_selection" onchange="">
                                        <option value=1>Latest Attempt</option>
                                        <option value=2>Maximum Score</option>
                                        <option value=3>Average Score</option>
                                        </select> <br><br>
                <!-- TODO: Randomize seed implementation -->
                Correct Answer Points: <input type="text" class="form-control" required name='points' value='<%=points%>'><br>
                Incorrect Answer Points: <input type="text" class="form-control" required name='penalty' value='<%=penalty%>'><br>
                <input type="submit" value="Submit" class="btn btn-default"> &nbsp; &nbsp;
                
                
                <%
                }
            %>
       
                 
 <!--               <input type="submit" value="Submit" class="btn btn-default"> &nbsp; &nbsp;    -->
        <!--        <a href="professor.jsp">Back</a>                                       -->
                <a href="javascript:history.back()">Back</a>
            </div>
        </form>
        <br />
</body>
</html>