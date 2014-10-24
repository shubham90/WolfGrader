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
		Class.forName("oracle.jdbc.OracleDriver");
		String conString="jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl";
		con=DriverManager.getConnection(conString,"agillfi","200024707");
		}
		catch(Exception e){
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
<html>
	<body>
<%
	String uname=request.getParameter("uname");
	String pwd=request.getParameter("pwd");
	String query="SELECT * FROM USERS WHERE UNITYID='"+uname+"' AND PASSWORD='"+pwd+"'";
	boolean flag=true;
	ResultSet rs;
	try{
            Statement st=con.createStatement();
            rs=st.executeQuery(query);
           /* if(!rs.next()){
                System.out.println("<script>alert('Login fail.')</script>");
                System.out.println("<script>window.location='login.html'</script>");
            }*/
            while(rs.next()){
                int role = rs.getInt("ROLE");
                if(role==1){
                    %>
                    <right><h3>Welcome <%= uname %></h3><right><br>
                    <%@ include file="student.jsp" %>
                    <%
                }
                else if(role==2){
                    %>
                    <right><h3>Welcome <%= uname %></h3><right><br>
                    <%@ include file="ta.jsp" %>
                    <%
                }
                else if(role==3){
                    %>
                    <right><h3>Welcome <%= uname %></h3><right><br>
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