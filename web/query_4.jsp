<%-- 
    Document   : query_4
    Created on : Oct 30, 2014, 5:53:47 AM
    Author     : Shubham
--%>

<%@page import="java.sql.*"%>
<!DOCTYPE html>

<%!

	Connection con;
	public void jspInit()
	{
		try{
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
        <title>New Doubt</title>
    </head>
    <body>
        <div>
            <div class="container">
                <form class="form-signin" role="form" method="post">
                    <h2 class="form-signin-heading">Query 4</h2>
                   
        <%
        String token = session.getAttribute("token").toString();
        session.setAttribute("token", token);
        System.out.print(token);
        
	String query="SELECT e.name, e.exid, e.score_selection FROM exercises e "
                + "WHERE e.CID='"+token+"'";
	System.out.print(query);
        ResultSet rs;
	try{
            Statement st=con.createStatement();
            rs=st.executeQuery(query);
            
            while(rs.next()){
                int exid= rs.getInt("exid");
                String name = rs.getString("NAME");
                int score_sel=rs.getInt("score_selection");
                
                
                if(score_sel==1){
                    
                String query1="SELECT MAX(time1) as time, unityid, ex_id ,score from stud_ex where ex_id="+exid+" group by unityid, ex_id,score";
                System.out.print(query);
                ResultSet rs1;
	try{
            Statement st1=con.createStatement();
            rs1=st1.executeQuery(query1);  
            while(rs1.next()){
                int score=rs1.getInt("score");
                String unityid1=rs1.getString("unityid");
                String query2="Insert into score_keeper values ('"+unityid1+"', "+exid+", "+score+", '"+token+"')";
                System.out.print(query2);
                ResultSet rs2;
	try{
            Statement st2=con.createStatement();
            rs2=st2.executeQuery(query2);                 
        }
        catch(Exception e){
            e.printStackTrace();
        }   
            }
                    
        }
        catch(Exception e){
            e.printStackTrace();
        }
                    
  
                } else if(score_sel==2){
                    
                String query1="SELECT MAX(score) as score, unityid, ex_id from stud_ex where ex_id="+exid+" group by unityid, ex_id";
                System.out.print(query1);
                ResultSet rs1;
	try{
            Statement st1=con.createStatement();
            rs1=st1.executeQuery(query1);  
            while(rs1.next()){
                int score=rs1.getInt("score");
                String unityid1=rs1.getString("unityid");
                String query2="Insert into score_keeper values ('"+unityid1+"', "+exid+", "+score+", '"+token+"')";
                System.out.print(query2);
                ResultSet rs2;
	try{
            Statement st2=con.createStatement();
            rs2=st2.executeQuery(query2);                 
        }
        catch(Exception e){
            e.printStackTrace();
        }   
            }
                    
        }
        catch(Exception e){
            e.printStackTrace();
        }
  
                } else{
                    
                  String query1="SELECT avg(score) as score, unityid, ex_id from stud_ex where ex_id="+exid+" group by unityid, ex_id";
                System.out.print(query);
                ResultSet rs1;
	try{
            Statement st1=con.createStatement();
            rs1=st1.executeQuery(query1);  
            while(rs1.next()){
                int score=rs1.getInt("score");
                String unityid1=rs1.getString("unityid");
                String query2="Insert into score_keeper values ('"+unityid1+"', "+exid+", "+score+", '"+token+"')";
                System.out.print(query2);
                ResultSet rs2;
	try{
            Statement st2=con.createStatement();
            rs2=st2.executeQuery(query2);                 
        }
        catch(Exception e){
            e.printStackTrace();
        }   
            }
                    
        }
        catch(Exception e){
            e.printStackTrace();
        }
                    
            
                }
                
                %>
                    <!-- populate from courses table -->
                   
                    
<%
                    
                }
               }
	catch(Exception e){
		e.printStackTrace();
	}
            %>
            

                </form>
            </div>
        </div>
    </body>
</html>
