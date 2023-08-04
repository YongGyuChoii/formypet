<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "bmmgr" class = "admin.BuyManagementMgr" />
<%@page import = "admin.BuyManagementBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%
	request.setCharacterEncoding("UTF-8");	
	String nowPage = request.getParameter("nowPage"); 
	int brKey = Integer.parseInt(request.getParameter("brKey"));
	
	bmmgr.ryn(brKey); //
	String url = "../admin/buyManagement.jsp?nowPage=" + nowPage ;
	response.sendRedirect(url);

%>
<script type = "text/javascript">
	function check() {
		document.uFrm.submit();
	}
	
	function ch() {
		document.uFrm.self.close();
	}
</script>
</head>
<body>
	<div align="center">
			<br />
			<form name="uFrm" method="post" action = "../admin/buyudate.jsp">

				<input type = "hidden" name = "nowPage" value = "<%=nowPage%>">
				<input type = "hidden" name = "brKey" value = "<%=brKey%>">
				<input type = "hidden" name = "rYn" value = "N">
			</form>
		</div>
</body>
</html>