<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*,admin.*" %>
<jsp:useBean id = "buyMMgr" class = "admin.BuyManagementMgr" scope = "page" />

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
                    <br/>
                    <h2>구매 및 환불 관리</h2>
                    <br/>
                    <table align = "center" width = "600">
                    	<tr>
                    		<td>
                    		Total : #개
                    		</td>
                    	</tr>
                    </table>
                    
                    <!-- 게시판 본문 시작 -->
                    
                    <table height = "600">
                    	<tr>
                    		<td align="center" colspan="2">
                    	<table>
	                   		<tr>
		                        <td>회원 구분</td>
		                        <td>환불 제목</td>
		                        <td>환불 내용</td>
		                        <td>환불 날짜</td>                
	                    	</tr>
                    <%
              			Vector<BuyManagementBean> vlist = buyMMgr.getBuyManagementList();
                    	            int counter = vlist.size();
                    	            for(int i = 0; i <vlist.size(); i++) {
                    	            	BuyManagementBean buymBean = vlist.get(i);
                    %>
                    <tr>
		                
		              
		                
		                <td><%=buymBean.getBuyandrefundTitle() %></td>
		                <td><%=buymBean.getBuyandrefundTitle() %></td>
		                <td><%=buymBean.getBuyandrefundTitle() %></td>
		                <td><%=buymBean.getBuyandrefundTitle() %></td>
		                
		                <%
			            }
		                %>	
		                	                	            
                    </tr>
                    </table>
                </td>
               </tr>
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