<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="admin.BuyManagementBean"%>
<jsp:useBean id="brmmgr" class="admin.BuyManagementMgr"/>
<%
	  	request.setCharacterEncoding("UTF-8");

	  	int brKey = Integer.parseInt(request.getParameter("brKey"));

	  	System.out.println("read5.jsp 페이지 brKey = " + brKey);
	  
	  	String nowPage = request.getParameter("nowPage");
	  	String keyField = request.getParameter("keyField");
	  	String keyWord = request.getParameter("keyWord");
	  
	  	BuyManagementBean bean = brmmgr.getbbean(brKey);//게시물 가져오기
	
	  	//bean 객체 에서 getter 메서드를 이용하여 파라미터를 가져와서 화면에 출력하기 위해 각 변수에 대입한다.
		//BuyManagementBean brbean = (BuyManagementBean) session.getAttribute("bean");
		int brKey1 = bean.getBrKey();
		String rYn = bean.getrYn();

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><%=brKey %></title>
	<link href="../css/admin2.css" rel="stylesheet" type="text/css">
	<%@include file = "/base/icon.jsp" %>
</head>
<body > 
		
		<%System.out.println("rYn 값 = " + rYn); %>
		<div align = "center">
		<br/>
		<br/>
		<br/>
		<h2>환불을 승인합니다.</h2>
		<br/>
		<input type="hidden" name = "brKey" value = <%=brKey1 %>>
		<input type="hidden" id = "ryn" name ="rYn" value = "<%=rYn%>">
		<%System.out.println("rYn 값 = " + rYn); %>
		<td>
		<a href = "../admin/buyupdate.jsp?nowPage=<%=nowPage%>&brKey=<%=brKey%>"><input type= "submit"  value= "네"></a>
	 	<a href = "../admin/buyManagement.jsp" onclick="window.open(this.href, '_close'); return false;"><input type = "button" value = "아니오"></a>
	 	<td>
		</div>

		<form name="listFrm" method="post" action="../admin/buyManagemnet.jsp">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<%if(!(keyWord==null || keyWord.equals(""))){ %>
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
		<%}%>
	</form>

</body>
</html>
<script type="text/javascript">
		function list(){
		   	
			document.listFrm.submit();
		}
 
		var ryn = document.getElementById("ryn").value;
		console.log(ryn);
		//document.self.close();
		
	</script>