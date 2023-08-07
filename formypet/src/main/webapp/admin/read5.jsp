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
		int brKey1 = bean.getBrKey();
		int memKey = bean.getMemKey();
		String memOrderKey = bean.getMemOrderKey();
		String nonMemOrderKey = bean.getNonMemOrderKey();
		int productKey = bean.getProductKey();
		System.out.println(productKey);
		String rYn = bean.getrYn();
		int ordersKey = bean.getOrdersKey();
		session.setAttribute("bean", bean);
		System.out.println("bean 출력 확인 = " + bean);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><%=brKey %></title>
	<link href="../css/admin2.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
		function list(){
		   	
			document.readFrm.submit();
		}
 
	</script>
</head>
<body > 
		<input type="hidden" value = <%=brKey1 %>>
		<input type="hidden" value = <%=memKey %>>
		<input type="hidden" value = <%=memOrderKey %>>
		<input type="hidden" value = <%=nonMemOrderKey %>>
		<input type = "hidden" value = <%=productKey %>>
		<input type="hidden" value = <%=rYn%>>
		<input type="hidden" value = <%=ordersKey%>>
	 <a href="../admin/buyupdate.jsp?nowPage=<%=nowPage%>&brKey=<%=brKey%>"><input type= "button" value= "네"></a>
	 <a href = "../admin/buyManagement.jsp"><input type = "button" value = "아니오"></a>
		
	<form name="readFrm" method="post" action = "buyManagement.jsp">
			<input type="hidden" name="brKey"> 
			<input type="hidden" name="nowPage" value="<%=nowPage%>">
			<%if(!(keyWord==null || keyWord.equals(""))){ %>
			<input type="hidden" name="keyField" value="<%=keyField%>"> 
			<input type="hidden" name="keyWord" value="<%=keyWord%>">
			<%}%>
		</form>

</body>
</html>
