<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "bmmgr" class = "admin.BuyManagementMgr" />
<%@page import = "admin.BuyManagementBean"%>
<!DOCTYPE html>
<html>
<head>
<%@include file = "/base/icon.jsp" %>
<meta charset="UTF-8">
<title></title>
<%

	int brKey = Integer.parseInt(request.getParameter("brKey"));
	String nowPage = request.getParameter("nowPage");

	BuyManagementBean bean = (BuyManagementBean) session.getAttribute("bean");
	int brKey1 = bean.getBrKey();
	String rYn = bean.getrYn();
	System.out.println(rYn + " = rYn완료 ");
	//BuyManagementBean bbean = new BuyManagementBean();
	//bbean.setBrKey(Integer.parseInt(request.getParameter("brKey")));
	//bbean.setrYn(request.getParameter("rYn"));
	//bmmgr.ryn(bean); 

%>

</head>
<body>

			<br /><form name="uFrm" method="post" action = "././rupdate" >
					<input type = "hidden"name = "brKey" value = <%=brKey1 %>>
					<input  type = "hidden" name="rYn" value="N">
					<!-- <input type="submit" value="전송"> -->
				<%System.out.println("환불" + rYn); %>
					 <input type="hidden" name="nowPage" value="<%=nowPage %>">
					 <input type='hidden' name="brKey" value="<%=brKey%>">
			</form>
</body>
</html>
<script>

	document.uFrm.submit();
	//window.open("about:blank","_self").close();
	//location.href = "buyManagement.jsp";

</script>