<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*,admin.*" %>
<jsp:useBean id = "pMMgr" class = "admin.productManagementMgr" scope = "page" />
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
    <div class="container"> 
    		<h2>상품 관리</h2>    
        <table class="table-body">
           
            <thead>
           
            <tr>
                <th>상품 이름</th>
                <th>상품 번호</th>
                <th>상품 가격</th>
                <th>상품 삭제 여부</th>
                <th>상품 수정</th>
        
            </tr>
            </thead>
            <tbody>
            <%
            Vector<productManagementBean> vlist = pMMgr.getpmList();
            int counter = vlist.size();
            for(int i = 0; i <vlist.size(); i++) {
            	productManagementBean pBean = vlist.get(i);
            %>
            <tr>
                <td><%= pBean.getProductName()  %></td>
                <td><%= pBean.getProductOrderCount()  %></td>
                <td><%= pBean.getProductPrice()  %></td>
                <td><%= pBean.getDelYn()  %></td>
                <td><input type = "button" value = "상품 수정"></td>   
                <%
            		}
                %>  
                <p>total records : <%=counter %></p>           
            <p><input type = "button" value = "상품 추가"></p>
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