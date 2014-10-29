<%-- 
    Document   : professor_add_homework_success
    Created on : Oct 26, 2014, 7:01:18 PM
    Author     : Shubham
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
        <title>Success!</title>
    </head>
    <body>
        <form id="add_homework_success" role="form" action="login.html" method="POST">
        <%! String[] qid;
            int[] aid;%>
        <%
        String token= session.getAttribute("token").toString();
                session.setAttribute("token", token);
       // int[] qid= (int[])(session.getAttribute("qid"));
        qid= (request.getParameterValues("question"));
      
            int[] qid1= new int[qid.length];
            for (int i = 0; i < qid.length; i++) {
            qid1[i] = Integer.parseInt(qid[i]);
        }
                
           
        int exid= Integer.parseInt((session.getAttribute("exid")).toString());
        //        String temp = "";
        //        for (int i = 1; i < qid1.length; i++) {
        //         System.out.print(qid1[i]);
        //         temp += "OR QID=" + qid1[i];
                 
        //        }
        //        System.out.print(qid1[0]);
        //        System.out.print(qid1[1]);
        //        String query = "SELECT * FROM ANSWER WHERE "
        //        + " QID= "+ qid1[0]+ temp +"" ;
       //        ResultSet rs=null; 
          
      //  String query="INSERT INTO EXERCISES (EXID, DIFF_RANGE, CID, RETRIES, "
        //        + "START_DATE, END_DATE, POINTS, PENALTY, RANDOMIZE, "
        //        + "SCORE_SELECTION, DIFF_RANGE_TO,NAME)VALUES("+exid+","+diff_range+", "
        //       + " '"+token+"', "+retries+", '"+start_date+"', '"+end_date+"', "
        //        + " "+points+","+penalty+","+randomize+", "
        //        + " "+score_selection+","+diff_range_to+", '"+name+"')";

//try{
//            Statement st=con.createStatement();
//            rs=st.executeQuery(query);
//            System.out.print("In try Block");
//            System.out.print(rs.next());
//}
// catch(Exception e){
 //              System.out.print("In Catch");
  //          }


// 
// System.out.print("Before While");
// while (rs.next()) {
//           int i=0; 
//           System.out.print("in While");
 //          aid[i]= Integer.parseInt(rs.getString("aid"));
//           i++;
//}
//System.out.print(aid[0]);
//System.out.print(aid[1]);
int j=0;
for(j=0;j<qid1.length;j++){
                    ResultSet rs1=null; 
         
               String query1="INSERT INTO EX_QUES (EXID, QID, PID, AID)"
                       + "VALUES("+exid+","+qid1[j]+", "
                       + " "+0+", "+0+")";

try{
            Statement st=con.createStatement();
            rs1=st.executeQuery(query1);
            
                 
}catch(Exception e1){
    
    System.out.print("Error in For loop");
    e1.printStackTrace();
}}
 %><h2>Homework Created Successfully!</h2><%  

%>

        <input type="submit" value="Back to HomePage" class="btn btn-primary">
   <!--     <a href="javascript:history.back()">Back</a>                 -->
        </form>   
    </body>
</html>