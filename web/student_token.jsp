<%-- 
    Document   : token
    Created on : Oct 13, 2014, 8:45:19 PM
    Author     : adam
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
        <title>Token</title>
    </head>
    <body>
    <%
        String token = request.getParameter("token");
        Date date = new Date( );
        long current_time = date.getTime();
        String unityid = session.getAttribute("name").toString();
        %>
        <script>
            console.log('<%= current_time %>');
            console.log('<%= token %>');
        </script>
        <%
	String query="SELECT END_DATE, ENROLLED_STUDENTS, MAX_ENROLLED_STUDENTS"
                + " FROM COURSES WHERE TOKEN ='"+token+"'";
	ResultSet rs;
	try{
            Statement st=con.createStatement();
            rs=st.executeQuery(query);
            if (!rs.next() ) {
                %><h2>Invalid ID!</h2><%
            }
            else 
            {
                do{
                    Date end_date = rs.getDate("END_DATE");
                    int current_enrollment = rs.getInt("ENROLLED_STUDENTS");
                    int max_enrollment = rs.getInt("MAX_ENROLLED_STUDENTS");

                    //SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd");
                    //Date date2 = sdf.parse(end_date);
                    long timeInMillisSinceEpoch = end_date.getTime(); 

                    if (timeInMillisSinceEpoch < current_time){
                        %><h2>Course Over, Cannot Register</h2><%
                    }
                    else if (current_enrollment == max_enrollment){
                        %><h2>Course Full, Cannot Register</h2><%
                    }
                    else{
                        try{
                            String update_query2="INSERT INTO COURSE_ROSTER (CID, UNITYID) VALUES('"+token+"','"+unityid+"')";
                            Statement update_st2=con.createStatement();
                            update_st2.executeQuery(update_query2);
                            %><h2>You have joined <%= token %>!</h2><%
                            
                            int new_enrollment = current_enrollment + 1;
                            String update_query="UPDATE COURSES SET ENROLLED_STUDENTS="+new_enrollment+"WHERE TOKEN='"+token+"'";
                            Statement update_st=con.createStatement();
                            update_st.executeQuery(update_query);
                        }
                        catch(Exception e){
                            %><h2>You are already in <%= token %>!</h2><%
                            //System.out.println(e);
                            //throw new Exception();
                        }
                    }


                }while(rs.next());
            }
            %>
            
            <%
            }
	catch(Exception e){
            System.out.println(e);
            throw new Exception();
	}
%><a href="student_add_course.jsp">Back</a>
    </body>
</html>
