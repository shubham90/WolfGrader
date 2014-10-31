<%-- 
File- login.jsp
Author-Shubham Bhawsinka
Date-10/20/2014
--%>

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
	<body>
<%
	String uname=request.getParameter("uname");
	String pwd=request.getParameter("pwd");
        String pfname=null;
        String plname=null;
        String name= null;
        String sfname=null;
        String slname=null;
        String sname= null;
        String query1= "SELECT fname, lname from prof where unityid='"+uname+"'";
                ResultSet rs1=null;
                try{
            
            Statement st1=con.createStatement();
            rs1=st1.executeQuery(query1);
            while(rs1.next()){
                   pfname= rs1.getString("fname");
                   plname= rs1.getString("lname");
                   name= pfname + " " + plname;
                }
                }catch(Exception e){
                    e.printStackTrace();
                }
                
        String query2= "SELECT fname, lname from students where unityid='"+uname+"'";
                ResultSet rs2=null;
                try{
            
            Statement st2=con.createStatement();
            rs2=st2.executeQuery(query2);
            while(rs2.next()){
                   sfname= rs2.getString("fname");
                   slname= rs2.getString("lname");
                   sname= slname + " " + sfname;
                }
                }catch(Exception e){
                    e.printStackTrace();
                }
    //        while(rs.next()){
                
        
        session.setAttribute( "name", uname );
	String query="SELECT * FROM USERS WHERE UNITYID='"+uname+"' AND PASSWORD='"+pwd+"'";
	boolean flag=true;
	ResultSet rs;
	try{
            
            Statement st=con.createStatement();
            rs=st.executeQuery(query);
            if (!rs.next()) {
            do {
                %><h2>Invalid UnityID or Password!</h2><br>
            <a href="login.html">Back</a>
            <%
             } while(rs.next());
            } else {  
             
                int role = rs.getInt("ROLE");
                if(role==1){
                    %>
                    <right><h3>Welcome <%= sname %></h3><right><br>
                    <%@ include file="student.jsp" %>
        
                    <%
                }
                else if(role==2){
                    %>
                    <right><h3>Welcome <%= sname %></h3><right><br>
                    <%@ include file="ta.jsp" %>
                    <%
                }
                else if(role==3){
                    %>
                    <right><h3>Welcome <%= name %></h3><right><br>
                    <%@ include file="professor.jsp" %>
                    <%
                }
            }
	}
	catch(Exception e){
		System.out.println(e);
		flag=false;
		throw new Exception();
	}%>
        
	</body>
</html>