<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.HashMap.*,org.json.simple.JSONObject,org.json.simple.parser.ParseException,java.util.Map,org.json.simple.JSONValue,
    org.json.simple.JSONArray;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	

		<%
		
		
			//String s=request.getParameter("name");
			//String s1=request.getParameter("add");
			
			//if(s.length()!=0 && s1.length()!=0)
			//{
				try{
					
				
					JSONObject obj=new JSONObject();
					JSONObject obj1=new JSONObject();

					JSONArray arr=new JSONArray();
					
				//Map obj=new HashMap();
					
					Class.forName("com.mysql.jdbc.Driver");
					
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/admin_db","root","root");
					
					PreparedStatement ps=conn.prepareStatement("select * from user_details1 ");
					PreparedStatement ps1=conn.prepareStatement("select * from user_contact_details ");
					
					
					
					//ps.setString(2,s1);
					//ps.executeUpdate();
					
					ResultSet rs=ps.executeQuery();
					ResultSet rs1=ps1.executeQuery();

					
					if(rs.next()==true)
					{
						String nme=rs.getString("user_firstname");
						String age=rs.getString("user_age");
						String lnme=rs.getString("user_lastname");
						String email=rs.getString("user_email");
						String country=rs.getString("user_country");
						String id=rs.getString("user_id");

						
						
						obj.put("firstname",nme);
						
						//out.println();
						
						obj.put("age",age);
						
						//out.println();

						
						obj.put("last nmae",lnme);
						
						//out.println();
						
						obj.put("country",country);
						
						

						
						obj.put("email",email);
						
						obj.put("user_id",id);
						
						


						
						//String jt=JSONValue.toJSONString(obj);
						
					out.print(obj);
						
						
						
						
						//out.println("name ="+nme);
						//out.println("address is = "+add);
						
						
					}
					
					%>
					
					<br><br><hr>
					
					<h3>secound output</h3> 
					
					
					
					<%
					
					out.println(obj);

					
				while(rs1.next()==true)
					{
						String c_id=rs1.getString("contact_id");
						String p_nme=rs1.getString("phone_number");
						String comment=rs1.getString("comments");
						
						
						String id=rs1.getString("user_id");
						
						obj1.put("contact id",c_id);
						
						obj1.put("phone_number",p_nme);
						
						obj1.put("comments",comment);
						
					     
						out.print(obj1);
						
						arr.add(obj1.put("contact_id",c_id));

						arr.add(obj1.put("phone_number",p_nme));
						arr.add(obj1.put("comments",comment));
						arr.add(obj1.put("user_id",id));

						
						out.print(arr);
						
						
						//out.println("name ="+nme);
						//out.println("address is = "+add);
						
						
					}
					
					
					
					conn.close();
					
					//out.println("sucssfuly established");
				}
				catch(Exception e)
				{
					out.println(e);
				}
			
		
		
		%>


</body>
</html>