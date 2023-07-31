<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "rvmmgr" class = "admin.ReviewManagementMgr" />
<%@page import = "admin.ReviewManagementBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%
	request.setCharacterEncoding("UTF-8");	
	String nowPage = request.getParameter("nowPage"); //read4 nowPage 호출
	int rvKey = Integer.parseInt(request.getParameter("rvKey")); //read4 rvKey 호출
	
	ReviewManagementBean bean = (ReviewManagementBean) session.getAttribute("bean"); //read4에 저장한 세션 불러오기
	rvmmgr.delrv(rvKey); //ReviewManagementMgr delrv(rvKey)리뷰 삭제 메서드 호출
	String url = "../admin/reviewManagement.jsp?nowPage=" + nowPage ;
	response.sendRedirect(url);//삭제후 상품 목록 페이지 호출

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