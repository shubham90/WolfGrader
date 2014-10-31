<%--
Document : report
Created on : Oct 27, 2014, 8:10:35 PM
Author 1 : adam
aUTHOR 2 : Shubham
--%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"
import="java.util.Date"%>
<%!
    Connection con;
    public void jspInit()
    {
        try {
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
        try {
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
<title>Report</title>
</head>
<body>
<form role="form" method="POST">
<%
    //need to restrict this for TA
    int num=0;
    String query2=(request.getParameter("query"));
    String query = query2;
    System.out.print(query);
    ResultSet rs1=null;
    try {
        Statement st=con.createStatement();
        rs1=st.executeQuery(query);
        ResultSetMetaData rsmd = rs1.getMetaData();
        num = rsmd.getColumnCount();
        System.out.print("In try");
    } catch(Exception e){
        System.out.print("In catch");
        e.printStackTrace();
%>  <h2> Query Invalid! </h2><%
    }
%>
    <table border='1' class="table table-hover">
<%
    ResultSetMetaData rsmd = rs1.getMetaData();
    for (int i = 1; i < num + 1; i++ ) {
        String name = rsmd.getColumnName(i);
%>      <td class="info"><%=name%></td> <%
        // Do stuff with name
    }
    while (rs1.next()) {
        %><tr><%
        for(int i=1;i<=num;i++){
        %>
        <td class="success"><%=rs1.getString(i)%></td>
        <%}%></tr><%}%>
    </table>
<a href="javascript:history.back()">Back</a>
</form>
<br/>
</body>
</html>