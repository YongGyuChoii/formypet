<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "admin.ProductManagementBean" %>
<jsp:useBean id="pmmgr" class="admin.ProductManagementMgr" />
<%
		 
		//productmanagement.jsp페이지에서 이동한 ocKey,nowPage 파라미터를 받아 각 각 변수에 저장

		int ocKey = Integer.parseInt(request.getParameter("ocKey"));

		String nowPage = request.getParameter("nowPage");
		
		 //session에 저장된 pmbean객체를 이용해서 게시물 정보를 각 각 변수에 저장 
		ProductManagementBean bean3 = (ProductManagementBean) session.getAttribute("bean3");
		 
		String oc1 = bean3.getOc1();
		String oc2 = bean3.getOc2();
		String oc3 = bean3.getOc3();
		String oc4 = bean3.getOc4();
		String oc5 = bean3.getOc5();
		int ocKey1 = bean3.getOcKey();
		int productKey = bean3.getProductKey();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 수정 페이지</title>
	<link href="../css/admin2.css" rel="stylesheet" type="text/css">
	<%@include file = "/base/icon.jsp" %>
	<script>
	function check() {
		document.updateFrm.submit();
	}
	</script>
</head>
<body>
	<div align="center"><br/><br/>
	<table width="600" cellpadding="3">
	  <tr>
	   <td bgcolor= "#002266" align="center"><font color = "#ffc303"><%=ocKey %></font></td>
	  </tr>
	</table>
	<!-- boardUpdate 로 url맵핑된 서블릿으로 이동한다. -->
	<form name="updateFrm" method="post" action="oupdate">
	<table width="1200" cellpadding="7">
	 <tr>
	  <td>
	   <table>
	   	<tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">상품옵션 번호</font></td>
	     <td>
		  <input name="ocKey" value="<%=ocKey1%>" size="70" maxlength="100">
		 </td>
		</tr>
	    <tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">상품 번호</font></td>
	     <td>
		  <input name="productKey" value="<%=productKey%>" size="70" maxlength="100">
		 </td>
		</tr>
		<tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">옵션 1</font></td>
	     <td>
		  <input name="oc1" size="70" value="<%=oc1%>" maxlength="100">
		 </td>
	    </tr>
		<tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">옵션 2</font></td>
	     <td>
		  <input name="oc2" size="70" value="<%=oc2%>" maxlength="100">
		 </td>
	    </tr>
		<tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">옵션 3</font></td>
	     <td>
		  <input name="oc3" size="70" value="<%=oc3%>" maxlength="100">
		 </td>
	    </tr>
		<tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">옵션 4</font></td>
	     <td>
		  <input name="oc4" size="70" value="<%=oc4%>" maxlength="100">
		 </td>
		</tr>
		<tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">옵션 5</font></td>
	     <td>
		  <input name="oc5" size="70" value="<%=oc5%>" maxlength="100">
		 </td>
	    </tr>	    	    
		<tr>
	     <td colspan="2" height="5"><hr/></td>
	    </tr>
		<tr>
	     <td colspan="2" height = "6">
		  <input type="button" value="수정완료" onclick="check()">
	      <input type="reset" value="다시수정"> 
	      <input type="button" value="뒤로" onclick="history.go(-1)">
		 </td>
	    </tr> 
	   </table>
	  </td>
	 </tr>
	</table>
	 <input type="hidden" name="nowPage" value="<%=nowPage %>">
	 <input type='hidden' name="ocKey" value="<%=ocKey%>">
	</form> 
	</div>
</body>
</html>
