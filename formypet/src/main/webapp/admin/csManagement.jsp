<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*,admin.*" %>
<jsp:useBean id = "csMMgr" class = "admin.CsManagementMgr" scope = "page" />
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
        <table class="table-body">
            <h2>회원 관리</h2>
            <thead>
            <tr>
                <th>아이디</th>
                <th>비밀번호</th>
                <th>전화번호 중간</th>
                <th>전화번호 뒤</th>
                <th>이메일 주소 앞</th>
                <th>이메일 주소 뒤</th>
                <th>배송 주소</th>
                <th>회원 이름</th>
                <th>주민번호 앞자리</th>
                <th>주민번호 뒷자리</th>
                <th>회원 포인트</th>
                <th>회원 탈퇴 여부</th>
            </tr>
            </thead>
            <tbody>
            
            <%
                        Vector<CsManagementBean> vlist = csMMgr.getCsManagementList();
                                    int counter = vlist.size();
                                    for(int i = 0; i <vlist.size(); i++) {
                                    	CsManagementBean csmBean = vlist.get(i);
                        %>
            <tr>
                <td><%=csmBean.getMemId() %></td>
                <td><%=csmBean.getMemPw() %></td>
                <td><%=csmBean.getMemPhone1() %></td>
                <td><%=csmBean.getMemPhone2() %></td>
                <td><%=csmBean.getMemEmail1() %></td>
                <td><%=csmBean.getMemEmail2() %></td>
                <td><%=csmBean.getMemAddress() %></td>
                <td><%=csmBean.getMemName() %></td>
                <td><%=csmBean.getMemResident1() %></td>
                <td><%=csmBean.getMemResident2() %></td>                
                <td><%=csmBean.getMemPoint() %></td>
                <td><%=csmBean.getDelYn() %></td>
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