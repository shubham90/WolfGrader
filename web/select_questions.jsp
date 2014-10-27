<%-- 
    Document   : select_questions
    Created on : Oct 13, 2014, 8:10:35 PM
    Author 1   : Shubham
--%>


<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"
         import="java.util.Date"
         import="java.util.Random"%>
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
        <title>Select Questions</title>
    </head>
    <body>

        <form role="form" action="professor_add_homework_success.jsp" method="POST">
            <%  String[] qid;
                String token= session.getAttribute("token").toString();
                session.setAttribute("token", token);
                int diff_range= Integer.parseInt((session.getAttribute("diff_range")).toString());
                int diff_range_to= Integer.parseInt((session.getAttribute("diff_range_to")).toString());
                int[] tid= (int[])(session.getAttribute("tid"));
                int exid= Integer.parseInt((session.getAttribute("exid")).toString());
                session.setAttribute("exid", exid);
                String blah = "";
                for (int i = 1; i < tid.length; i++) {
                 System.out.print(tid[i]);
                 
                 blah += " OR TID=" + tid[i];
                 
                }
                System.out.print(blah);
                String query = "SELECT * FROM QUESTION WHERE DIFF_LEVEL >= "+diff_range+""
                + " AND DIFF_LEVEL <= "+diff_range_to+" AND CID= '"+token+"' AND "
                + " (TID= "+ tid[0]+ blah +")" ;
                ResultSet rs=null; 
                try{
                Statement st=con.createStatement();
                rs=st.executeQuery(query);
                }catch(Exception e){
                    e.printStackTrace();
                }
%>
                <table border='1' class="table table-hover">
                <th class="active">Select</th> 
                <th class="active">Questions</th>
            <%
                while (rs.next()) {
            %> <tr>
              <td class="info"><input type="checkbox" name="question"
                value="<%=rs.getString("qid")%>"></td>
            <td class="success"><%=rs.getString("qtext")%></td>
            
            </tr>
            <%}%>
        </table>
              
                <input type="submit" value="Submit" class="btn btn-primary"> &nbsp; &nbsp;
 <!--               <input type="submit" value="Submit" class="btn btn-default"> &nbsp; &nbsp;    -->
                <a href="professor_add_homework.jsp">Back</a>
            
        </form>
        <br/>
    </body>
</html>

