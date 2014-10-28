<%-- 
    Document   : homework
    Created on : Oct 16, 2014, 11:46:54 PM
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
        <title>Homework</title>
    </head>
    <body>
        <!-- follow rules on page -->
        <!-- Loop through result query set and post questions in format below-->
        <!-- <h1>[INSERT COURSE NAME]</h1> -->
        
        <!-- have a while loop, put it all in 1 big form. 
        <option> -->
        
        <% 
            String exid = request.getParameter("homework");
            int exid_int = Integer.parseInt(exid);
            String unityid = session.getAttribute("name").toString();
            // determine number of questions in exercise.
            String query="SELECT COUNT(*) FROM EX_QUES WHERE EXID= "+exid_int;
            ResultSet rs;
            int num_of_questions = 0;
            try{
                Statement st=con.createStatement();
                rs=st.executeQuery(query);
                while(rs.next()){
                    num_of_questions = rs.getInt("COUNT(*)"); 
                }
            }catch(Exception e){
                System.out.println(e);
		throw new Exception();
            }
            session.setAttribute("num_of_questions", num_of_questions);
            
        %>
        <!-- If selection is "":
        <script>
            alert("Please select an exercise");
            history.back();
        </script>-->
        
        <!-- could add query to get homework name based on exid to put in <h1> -->
        <h1>Homework for <%= session.getAttribute("token") %>!</h1>
        
        
        <div class="panel panel-default">
            <div class="panel-heading">Homework Questions</div>
            <div class="container">
                <form role="form" name="exercise" method="POST" action="student_attempt_homework_pt_3.jsp">
                    <%
                    //Select questions, answers, information
                    String query_2="SELECT E.*, Q.* FROM EX_QUES E, QUESTION Q"
                            + " WHERE E.QID=Q.QID AND E.EXID="+exid_int;
                    ResultSet rs_2;
                    int i = 1;
                    int j = -1;
                    int flag_correct_answer = 0;
                    int total_answers = 0;
                    try{
                        Statement st_2=con.createStatement();
                        rs_2=st_2.executeQuery(query_2);
                        while(rs_2.next()){
                            int qid = rs_2.getInt("QID");
                            int pid = rs_2.getInt("PID");
                            int aid = rs_2.getInt("AID");
                            String q_text = rs_2.getString("QTEXT");
                            String cid = rs_2.getString("CID");
                            int diff_level = rs_2.getInt("DIFF_LEVEL");
                            int tid = rs_2.getInt("TID");
                            String hint = rs_2.getString("HINT");
                            String long_hint = rs_2.getString("LONG_HINT");
                            j += 1;
                            %>
                            <label class="control-label">Q<%= i %>. <%= q_text %></label>
                            <%
                            total_answers = 0;
                            flag_correct_answer = 0;
                            
                            i += 1;
                            
                            String query_3="SELECT * FROM ANSWER WHERE QID="+qid;
                            try{
                                ResultSet rs_3;
                                Statement st_3=con.createStatement();
                                rs_3=st_3.executeQuery(query_3);
                                while(rs_3.next()){
                                    String explanation = rs_3.getString("EXPLANATION"); 
                                    String answer_text = rs_3.getString("ANSWER_TEXT");
                                    int answer_id = rs_3.getInt("AID");
                                    int correct = rs_3.getInt("CORRECT");
                                    if (correct > 0 && flag_correct_answer == 0){
                                    %>
                                    <label class="radio">
                                        <input value="<%= answer_id %>" name="<%= j %>" type="radio"><%= answer_text %>
                                    </label>
                                    <%
                                        flag_correct_answer = 1;
                                    }
                                    else if (correct == 0 && total_answers < 3){
                                        total_answers += 1;
                                        %>
                                        <label class="radio">
                                            <input value="<%= answer_id %>" name="<%= j %>" type="radio"><%= answer_text %>
                                        </label>
                                        <%
                                    }
                                    else{
                                        continue;
                                    }
                                        %>
                                    
                                    <%
                                    }
                                
                            }catch(Exception e){
                                System.out.println(e);
                                throw new Exception();
                            }
                        }
                    }catch(Exception e){
                        System.out.println(e);
                        throw new Exception();
                    }
                    %>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
                <br />
                <a href="javascript:history.back()">Back</a>
            </div>
        </div>
    </body>
</html>