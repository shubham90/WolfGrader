<%-- 
    Document   : select_course
    Created on : Oct 13, 2014, 8:10:35 PM
    Author     : adam
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
        <title>Edit Homework</title>
    </head>
    <body>
        
       <% 
           System.out.print("I have reached Edit 2");
           String start_date=request.getParameter("start_date");
           String end_date=request.getParameter("end_date");
           int retries=(Integer.parseInt((request.getParameter("retries"))));
           int score_selection=(Integer.parseInt((request.getParameter("score_selection"))));
           int points=(Integer.parseInt((request.getParameter("points"))));
           int penalty=(Integer.parseInt((request.getParameter("penalty"))));
           int exid= Integer.parseInt(session.getAttribute("exid").toString());
          
        Date date = new Date( );
        long time = date.getTime();
        String current_time = Long.toString(time);
        SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String formatted = sdf.format(date.getTime());
        
        %><script>console.log("<%= formatted %>");
                    </script> <%
           System.out.print(start_date);
           System.out.print(end_date);
           System.out.print(retries);
           System.out.print(score_selection);
           System.out.print(points);
           System.out.print(penalty);
           System.out.print(exid);
       
        String query="UPDATE EXERCISES SET RETRIES="+retries+", "
                + "START_DATE='"+start_date+"', "
                + "END_DATE='"+end_date+"',"
                + "POINTS="+points+", PENALTY="+penalty+","
                + " SCORE_SELECTION="+score_selection+" "
                + "WHERE EXID="+exid+" ";
int rs;
    

System.out.print(query);
try{
            Statement st=con.createStatement();
             rs = st.executeUpdate(query);
           // rs=st.executeUpdate(query);
            if(rs==1){
            %><h2>Exercise Updated Successfully!</h2><%
           }
            else{
          %><h2>Edit Unsuccessful!</h2><%  
            }
}
catch(Exception e){
            e.printStackTrace();
}%>

        <a href="javascript:history.back()">Back</a>
       
       

    </body>
</html>
