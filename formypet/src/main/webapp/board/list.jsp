<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*"%>
    <%@ page import="java.io.PrintWriter" %>
	<%@ page import="bbs.BbsDAO" %>
	<%@ page import="bbs.bbs" %>
	<%@ page import="java.util.ArrayList" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/base.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <style type="text/css">
	a, a:hover{
		color: #000000;
		text-decoration:none;
	}
	</style>
</head>
<body>


    <div id="wrap">
    <!-- header 시작-->
    <header>
        <%@include file="/base/header.jsp"%>
    </header>
    <!--header 끝-->

    <!--main 시작-->

 <%
 String userID = null;
      if (session.getAttribute("idKey") != null){
          userID = (String) session.getAttribute("idKey");
      }
      int pageNumber = 1;
      if (request.getParameter("pageNumber") != null){
      	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
      }
 %>
 	</br>
    <div class= "container">
        <img id="back" src="../images/board/cs_center.jpg" alt="" width="100%">
    	<div= "row">
    	    <table class= "table table-stripped" style= "text-align: center; boarder: 1px solid #dddddd">
    	    	<thead>
    	    	<tr>
    	    		<th style= "background-color: #eeeeee; text-align: center;">번호</th>
    	    		<th style= "background-color: #eeeeee; text-align: center;">제목</th>
    	    		<th style= "background-color: #eeeeee; text-align: center;">작성자</th>
    	    		<th style= "background-color: #eeeeee; text-align: center;">작성일</th>
    	    	</tr>
    	    	</thead>
    	    	<tbody>
    	    		<tr>
    	    			<%
    	    			BbsDAO bbsDAO = new BbsDAO();
 	    			   ArrayList<bbs> list = bbsDAO.getList(pageNumber);
    	    			   for (int i =0; i<list.size(); i++){
    	    			%>
    	    			<tr>
    	    				<td><%= list.get(i).getBbsID() %></td>
    	    				<td><a href ="view.jsp?bbsID= <%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
    	    				<td><%= list.get(i).getUserID() %></td>
    	    				<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분" %></td>
    	    			</tr>	
    	    			<%
    	    				}
    	    			%>
    	    		</tr>
    	    	</tbody>
    	    </table>
    	    <%
    	    	if(pageNumber != 1){
    	    %>		
    	    		<a href= "list.jsp?pageNumber=<%=pageNumber -1%>" class="btn btn-success btn-arraw-left">이전</a>
    	    <% 
    	    	}if(bbsDAO.nextPage(pageNumber + 1)){
    	    %>		
    	    	<a href= "list.jsp?pageNumber=<%=pageNumber +1%>" class="btn btn-success btn-arraw-left">다음</a>
    	    <% 
    	    	}
    	    %>
    	    
    	    <a href= "write.jsp" class= "btn btn-primary pull-right">글쓰기</a>
    	</div>
    </div>

    <!-- footer 시작-->
    <footer id="footer">
      	<%@include file="/base/footer.jsp"%>
    </footer>
    <!-- footer 끝.-->
    </div>
</body>
</html>
    