<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*,admin.*" %>
<jsp:useBean id = "ctMMgr" class = "admin.CategoryManagementMgr" scope = "page" />
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
    <div id="wrap">
    <!-- header 시작-->
    <header>
        <%@include file="../admin/adminHeader.jsp"%>
      </header>
    <!--header 끝-->
       <!-- table 시작 -->

    <!-- table 시작 -->
    <div class="container">
        <table class="table-body">
            <h2>게시물 관리</h2>
            <thead>
            <tr>
                <th>게시물 이름</th>
                <th>게시물 삭제 여부</th>
        
            </tr>
            </thead>
            <tbody>
            <%
            Vector<CategoryManagementBean> vlist = ctMMgr.getcategoryManagementList();
                        int counter = vlist.size();
                        for(int i = 0; i <vlist.size(); i++) {
                        	CategoryManagementBean ctBean = vlist.get(i);
            %>
            <tr>
                <td><%= ctBean.getCategorySection()  %></td>
                <td><%= ctBean.getDelYn()  %></td>   
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