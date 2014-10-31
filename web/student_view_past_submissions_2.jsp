<%-- 
    Document   : view_past_submission
    Created on : Oct 16, 2014, 11:30:44 PM
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
        <title>View Scores</title>
    </head>
    <body>
        
        <%
            int q = Integer.parseInt(request.getParameter("homework"));
            String unityid =  (session.getAttribute("name")).toString();
            if (q != 0){
                
        %>
        <h1>View Past Submission</h1>
        <div class="panel panel-default">
            <div class="panel-heading">View Homework past due date</div>
                <div class="panel-body">
                    <ul class="nav nav-pills nav-stacked">
                        <%
                            /* This query needs changed */
                            String query="SELECT AQ.*, Q.QTEXT, A.EXPLANATION, A.ANSWER_TEXT FROM ATTEMPTED_QUESTIONS AQ, QUESTION Q, ANSWER A, STUD_EX S WHERE AQ.EX_ID = S.EX_ID AND Q.QID = AQ.QID AND A.AID = AQ.AID AND AQ.UNITYID='"+unityid+"'AND S.ATTM_ID="+q+"";
                            ResultSet rs;
                            try{
                                Statement st=con.createStatement();
                                rs=st.executeQuery(query);
                                while(rs.next()){
                                    String explanation = rs.getString("EXPLANATION");
                                    String answer_text = rs.getString("ANSWER_TEXT");
                                    String question = rs.getString("QTEXT");
                                    %>
                                    <li><a href="#">Question: <%= question %></a></li>
                                    <%
                                }
                            }
                            catch(Exception e){
                            System.out.println(e);
                            throw new Exception();
                            }
                            
                        %>
                        
                    </ul>
                    <br />
                    
                </div>
            
            
            <% }
            else{
                int attm_id = Integer.parseInt(request.getParameter("homework"));
            
            %>
            <div class="panel-heading">View Homeworks within due date</div>
                <div class="panel-body">
                    <ul class="nav nav-pills nav-stacked">
                        <%
                            /* This query needs adjusted */
                            String query="SELECT AQ.*, Q.QTEXT, A.EXPLANATION, A.ANSWER_TEXT FROM ATTEMPTED_QUESTIONS AQ, QUESTION Q, ANSWER A, STUD_EX S WHERE AQ.EX_ID = S.EX_ID AND Q.QID = AQ.QID AND A.AID = AQ.AID AND AQ.UNITYID='"+unityid+"'AND S.ATTM_ID="+q+"";
                            ResultSet rs;
                            try{
                                Statement st=con.createStatement();
                                rs=st.executeQuery(query);
                                while(rs.next()){
                                    String explanation = rs.getString("EXPLANATION");
                                    String answer_text = rs.getString("ANSWER_TEXT");
                                    String question = rs.getString("QTEXT");
                                    %>
                                    <li><a href="#">Question: <%= question %></a></li>
                                    <%
                                }
                            }
                            catch(Exception e){
                            System.out.println(e);
                            throw new Exception();
                            }
                            
                        %>
                        
                    </ul>
                    <br />
                    
                    
                </div>
            
            <%}%>
        </div>
        <a href="javascript:history.back()">Back</a>
    </body>
</html>