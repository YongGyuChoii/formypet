<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*,admin.*" %>
<jsp:useBean id = "ccMMgr" class = "admin.CsCenterManagementMgr" scope = "page" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/base.css">
    <link rel="stylesheet"  href="../css/adminStyle.css">
   	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
    <!-- header 시작-->
    <header>
        <%@include file="../admin/adminHeader.jsp"%>
      </header>
    <!--header 끝-->
    <!-- table 시작 -->
<div id="wrap" align = "center">    
    <div class="container">
        <table class="table-body">
            <br/>
            <h2>고객 센터 관리</h2>
            <thead>
            <tr>
                <th>아이디</th>
                <th>게시글 제목</th>
                <th>게시글 내용</th>
                <th>답글</th>
                <th>삭제여부</th>
            </tr>
            </thead>
            <tbody>
                     <%
                     Vector<CsCenterManagementBean> vlist = ccMMgr.getcsCenterManagementList();
                     	            int counter = vlist.size();
                     	            for(int i = 0; i <vlist.size(); i++) {
                     	            	CsCenterManagementBean ccBean = vlist.get(i);
                     %>
                    <tr>
		                
		              
		                
		                <td><%=ccBean.getMemKey() %></td>
		                <td><%=ccBean.getCsTitle() %></td>
		                <td><%=ccBean.getCsContents() %></td>	                
		                <td><input type = "button" value = "쓰기">
		                <input type = "button" value = "수정">
		                </td>
		                <td><%=ccBean.getDelYn() %></td>
		                <%
			            }
		                %>		
		                <p>total records : <%=counter %></p>                	            
                    </tr>

            </tbody>
        </table>
    </div>
    <!--table 끝-->
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