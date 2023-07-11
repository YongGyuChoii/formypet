<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/base.css">
    <link rel="stylesheet"  href="../css/board.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
    <div id="wrap">
    <!-- header 시작-->
    <header>
        <%@include file="/base/header.jsp"%>
    </header>
    <!--header 끝-->

    <!--main 시작-->
    <div class="container">
      <section>
        <div id="container">
          <img id="back" src="../images/board/cs_center.jpg" alt="" width="100%">
          <div class="box1"><h1>Hello, Customer</h1>
          <br>
          <p>We are making every effort for the happiness of you and your companion animals.</p>
          <p>If you have any questions about our products, shipping, exchange/return etc., please make use of the</p> 
          <p>Customer Service Center.</p>
          <br>
          <p>반려인과 반려동물의 행복을 위해 최선을 다하고 있습니다.</p>
          <p>제품, 배송, 교환/반품 문의 등의 궁금한 점은 여기 고객센터를 이용해 주시기 바랍니다.</p>
  </div>  
  <div class="list_wrap">
      <div class="paging2">
          <a href="#" class="bt">FAQ</a>
          <a href="#" class="bt">문의게시판</a>          
      </div>
	  <br/>
	    <%
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/formypet";
	String id = "root";
	String pass = "0000";
	int total = 0;
	
	try {
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();

		String sqlCount = "SELECT * FROM cscenter";
		ResultSet rs = stmt.executeQuery(sqlCount);
		
		if(rs.next()){
			total = rs.getInt(1);
		}
		rs.close();
		out.print("총 게시물 : " + total + "개");
		
		String sqlList = "SELECT csIndex, csName, csTitle, csDate, csHit from cscenter order by csIndex DESC";
		rs = stmt.executeQuery(sqlList);	
%>
      <table class="board_list">
          <caption>게시판 목록</caption>
          <thead>
              <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>글쓴이</th>
                  <th>작성일</th>
                  <th>조회</th>
              </tr>
          </thead>
          <tbody>
<% 
	if(total == 0) {
%>		
		<tr align="center" bgcolor="#FFFFFF" height="30">
		 <td colspan="6">등록된 글이 없습니다.</td>
		</tr>
<% } else {

	while(rs.next()) {
		int idx = rs.getInt(1);
		String name = rs.getString(2);
		String title = rs.getString(3);
		String time = rs.getString(4);
		int hit = rs.getInt(5);
	
%>
              <tr>
                  <td><%=idx %></td>
                  <td class="tit"><%=title %></td>
                  <td><%=name %></td>
                  <td><%=time %></td>
                  <td><%=hit %></td>
              </tr>
          </tbody>
<% 
          						}
			}
			rs.close();
			stmt.close();
			conn.close();
	}catch(SQLException e) {
		out.println(e.toString());
	}
	
	
%>
      </table>
      <table width="100%" cellpadding="0" cellspacing="0" border="0">
  		<tr><td colspan="4" height="5"></td></tr>
  		<tr align="center">
   			<td><input type=button value="글쓰기" OnClick="window.location='write.jsp'"></td>
  		</tr>
		</table>
      <div class="paging">
          <a href="#" class="bt">이전 페이지</a>
          <a href="#" class="num on">1</a>
          <a href="#" class="num">2</a>
          <a href="#" class="num">3</a>
          <a href="#" class="bt">다음 페이지</a>
      </div>
  </div>
</div> 
      </section>
    </div>
    <!--main 끝-->

    <!-- 오른쪽 맨위 맨아래 화살표 -->
    	<%@include file="/base/rightAside.jsp"%>
    <!-- 오른쪽 맨위 맨아래 화살표 끝 -->
    
    <!-- footer 시작-->
    <footer id="footer">
      	<%@include file="/base/footer.jsp"%>
    </footer>
    <!-- footer 끝.-->
    </div>
</body>
</html>
    