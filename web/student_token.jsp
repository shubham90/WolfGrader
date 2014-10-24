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
    <<head>
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
        String token=request.getParameter("token");
        Date date = new Date( );
        long current_time = date.getTime();
        System.out.printf("%1$s %2$tB %2$td, %2$tY", 
                         "Due date:", date);
        
	String query="SELECT END_DATE, ENROLLED_STUDENTS, MAX_ENROLLED_STUDENTS"
                + " FROM COURSES WHERE TOKEN ='"+token+"'";
	ResultSet rs;
	try{
            Statement st=con.createStatement();
            rs=st.executeQuery(query);
            while(rs.next()){
                String end_date = rs.getString("END_DATE");
                int current_enrollment = rs.getInt("ENTROLLED_STUDENTS");
                int max_enrollment = rs.getInt("MAX_ENTROLLED_STUDENTS");
                SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd");
                Date date2 = sdf.parse(end_date);
                long timeInMillisSinceEpoch = date2.getTime(); 
                // turn end date in to date objet, then to epoch time, then to string?
                //int result = end_date.compareTo(current_time);
                if (timeInMillisSinceEpoch < current_time){
                    %><h2>Course Over, Cannot Register</h2><%
                }
                else if (current_enrollment == max_enrollment){
                    %><h2>Course Full, Cannot Register</h2><%
                }
                else{
                    int new_enrollment = current_enrollment + 1;
                    String update_query="UPDATE COURSES SET ENROLLED_STUDENTS= ='"+new_enrollment+"'"
                            + "WHERE TOKEN='"+token+"'";
                    Statement update_st=con.createStatement();
                    rs=update_st.executeQuery(update_query);
                }
                
                
            }
            %>
            </select>
            </div>
            
            <button type="submit" class="btn btn-default">Submit</button>
        </form>
            <%
            }
	catch(Exception e){
		System.out.println(e);
		throw new Exception();
	}
%>
        <!-- follow rules on page -->
        <h1>Hello World!</h1>
    </body>
</html>
