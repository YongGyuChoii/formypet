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

	BuyManagementBean bean = (BuyManagementBean) session.getAttribute("bean");
	int brKey1 = bean.getBrKey();
	int memKey = bean.getMemKey();
	String memOrderKey = bean.getMemOrderKey();
	String nonMemOrderKey = bean.getNonMemOrderKey();
	int productKey = bean.getProductKey();
	System.out.println("buyupdate.jsp - productKey = " + productKey);
	int ordersKey = bean.getOrdersKey();
	String rYn = bean.getrYn();
	System.out.println(rYn + " = rYn완료 ");
%>
<script type = "text/javascript">
	function check() {
		document.uFrm.submit();
	
	}
	function Y() {
		document.getElementById("Y").value=Y;

	}

</script>
</head>
<body>
	<div align="center">
			<br /><form name="uFrm" method="post" action = "rupdate">
					<input type="hidden" name = "brKey" value = <%=brKey1 %>>
					<input type="hidden" name = "memKey" value = <%=memKey %>>
					<input type="hidden" name = "memOrderKey" value = <%=memOrderKey %>>
					<input type="hidden" name = "nonMemOrderKey" value = <%=nonMemOrderKey %>>
					<input type="hidden" name = "ordersKey" value = <%=ordersKey %>>
					<input type="hidden" name="rYn" id = "Y" value="">
					<input type="hidden" name="productKey" value="<%=productKey%>">
					<input type = "hidden" type = "submit" function = "check()">
				<%System.out.println("환불" + rYn); %>
			</form>
		</div>
</body>
</html>