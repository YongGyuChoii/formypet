<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "rvmmgr" class = "admin.ReviewManagementMgr" />
<%@page import = "admin.ReviewManagementBean"%>
<!DOCTYPE html>
<html>
<head>
<%@include file = "/base/icon.jsp" %>
<meta charset="UTF-8">
<title></title>
<%
	request.setCharacterEncoding("UTF-8");	
	String nowPage = request.getParameter("nowPage"); 
	int rvKey = Integer.parseInt(request.getParameter("rvKey"));
	
	ReviewManagementBean bean = (ReviewManagementBean) session.getAttribute("bean"); //read4에 저장한 세션 불러오기
	rvmmgr.delrv(rvKey); 
	String url = "../admin/reviewManagement.jsp?nowPage=" + nowPage ;
	response.sendRedirect(url);

%>
<script type = "text/javascript">
	function check() {
		document.delFrm.submit();
	}
	
	function ch() {
		document.delFrm.self.close();
	}
</script>
</head>
<body>
	<div align="center">
			<br />
			<form name="delFrm" method="post" action = "../admin/rvdelete.jsp">

				<input type = "hidden" name = "nowPage" value = "<%=nowPage%>">
				<input type = "hidden" name = "rvKey" value = "<%=rvKey%>">
			</form>
		</div>
</body>
</html>