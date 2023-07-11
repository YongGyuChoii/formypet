<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*"%> 
<%     
	request.setCharacterEncoding("UTF-8");
	
    Class.forName("com.mysql.cj.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/formypet";
	String id = "root";
	String pass = "0000";
	
	String name = request.getParameter("name"); 
	String password = request.getParameter("password");
	String title = request.getParameter("title"); 
	String memo = request.getParameter("memo"); 	
	
	
	
	try {	
		Connection conn = DriverManager.getConnection(url,id,pass);
		
		String sql = "Insert into cscenter(csName,csPass,csTitle,csContents)values(?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);
		
		pstmt.execute();
		pstmt.close();
		
		conn.close();
		
		} catch(SQLException e) {
			out.println( e.toString() );
		} 
%>

  <script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="list.jsp"; 
   </script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>