<%-- 
    Document   : homework
    Created on : Oct 27, 2014, 3:56:54 PM
    Author     : adam
    Reports page!
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
        
        <% 
            System.out.print("hey899");
            int num_of_questions = (Integer) session.getAttribute("num_of_questions");
            String[] str = new String[num_of_questions];
            int session_exid = (Integer) session.getAttribute("exid");
            Date date = new Date( );
            long time = date.getTime();
            String current_time = Long.toString(time);
            SimpleDateFormat sdf  = new SimpleDateFormat("ddMM-yyyy hh:mm:ss");
            String formatted = sdf.format(date.getTime());
            
            String start_time = (String) session.getAttribute("current_time");
        %>
        
        
        <!-- could add query to get homework name based on exid to put in <h1> -->
        <h1>Homework for <%= session.getAttribute("token") %>!</h1>
        
        <div class="panel panel-default">
            <div class="panel-heading">Homework Completed</div>
            <div class="container">
                <%
                String query_2="SELECT * FROM EXERCISES WHERE EXID= "+session_exid;
                ResultSet rs_2;
                int score = 0;
                try{
                    System.out.print("hey1");
                    Statement st_2=con.createStatement();
                    rs_2=st_2.executeQuery(query_2);
                    while(rs_2.next()){
                        System.out.print("hey2");
                        int exid = rs_2.getInt("EXID");
                        int points = rs_2.getInt("POINTS");
                        int penalty = rs_2.getInt("PENALTY");
                        
                        for(int i=0; i<num_of_questions; i++){
                            str[i] = request.getParameter(""+i);
                            String query="SELECT * FROM ANSWER WHERE AID= "+Integer.parseInt(request.getParameter(""+i));
                            ResultSet rs;
                            try{
                                System.out.print("hey3 "+request.getParameter(""+i));
                                Statement st=con.createStatement();
                                rs=st.executeQuery(query);
                                while(rs.next()){
                                    String query_15 = "";
                                    System.out.print("hey4");
                                    int question_id = rs.getInt("QID");
                                    int answer_id = rs.getInt("AID");
                                    int correct = rs.getInt("CORRECT");
                                    String explanation = rs.getString("EXPLANATION");
                                    String answer_text = rs.getString("ANSWER_TEXT");
                                    if (correct == 0){
                                        score -= penalty;
                                    %>
                                        For Q<%= i+1 %>, you answered: <%= answer_text %>.
                                        <br />
                                        This answer is wrong, because: <br />
                                        <%= explanation %>
                                        <br />
                                    <%
                                    }
                                    else{
                                        score += points;
                                    }
                                    String query_14="SELECT MAX(ATTM_ID) FROM STUD_EX WHERE EX_ID="+session_exid+"AND UNITYID='"+session.getAttribute("name").toString()+"'";
                                    ResultSet rs_14;
                                    int max_attm_id_2 = 0;
                                    int new_attm_id_2 = 0;
                                    
                                    try{
                                        System.out.print("hey15");
                                        Statement st_14=con.createStatement();
                                        rs_14=st_14.executeQuery(query_14);
                                        while(rs_14.next()){
                                            System.out.print("hey16");
                                            max_attm_id_2 = rs_14.getInt("MAX(ATTM_ID)");
                                            new_attm_id_2 = 1 + max_attm_id_2;
                                        }
                                    }catch(Exception e){

                                        %><script>console.log("12");</script><%
                                        System.out.println(e);
                                        throw new Exception();
                                    }
                                    query_15="INSERT INTO ATTEMPTED_QUESTIONS VALUES('"+session.getAttribute("name").toString()+"',"+new_attm_id_2+","+question_id+","+answer_id+","+correct+","+exid+")";
                                    try{                                        
                                        System.out.print("hey3 ");
                                        Statement st_5=con.createStatement();
                                        st_5.executeQuery(query_15);
                                    }
                                    catch(Exception e){
                                        System.out.println(e);
                                        throw new Exception();
                                    }
                                }
                            }catch(Exception e){
                                %><script>console.log("1");</script><%
                                System.out.println(e);
                                throw new Exception();
                            }
                        }
                        %><script>console.log("<%= score %>");</script><%
                        // Need to add columns to stud_ex that includes detailed info about how student answered each question
                        String query_4="SELECT MAX(ATTM_ID) FROM STUD_EX WHERE EX_ID="+session_exid+"AND UNITYID='"+session.getAttribute("name").toString()+"'";
                        ResultSet rs_4;
                        int max_attm_id = 0;
                        try{
                            System.out.print("hey5");
                            Statement st_4=con.createStatement();
                            rs_4=st_4.executeQuery(query_4);
                            while(rs_4.next()){
                                System.out.print("hey6");
                                max_attm_id = rs_4.getInt("MAX(ATTM_ID)");
                            }
                        }catch(Exception e){
                            
                            %><script>console.log("2");</script><%
                            System.out.println(e);
                            throw new Exception();
                        }
                        int new_attm_id = 0;
                        new_attm_id = 1 + max_attm_id;
                        
                        String unityid = session.getAttribute("name").toString();
                        String query_3="INSERT INTO STUD_EX VALUES ("+new_attm_id+",'"+unityid+"',"+score+",SYSDATE,"+session_exid+",SYSDATE, SYSDATE)";
                        try{
                            Statement st_3=con.createStatement();
                            st_3.executeQuery(query_3);
                            System.out.print("hey7");
                            /*while(rs_3.next()){
                                System.out.print("hey7");
                                int attempt_id = rs_3.getInt("ATTM_ID");
                            }*/
                        }catch(Exception e){
                            
                            %><script>console.log("3");</script><%
                            System.out.println(e);
                            throw new Exception();
                        }
                    }
                }catch(Exception e){
                    %><script>console.log("4");</script><%
                    System.out.println(e);
                    throw new Exception();
                }
                
                %>
                <a href="javascript:history.back()">Back</a>
            </div>
        </div>
    </body>
</html>