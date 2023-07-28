<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="admin.ProductManagementBean"%>
<jsp:useBean id="pmmgr" class="admin.ProductManagementMgr" />
<%
	  request.setCharacterEncoding("UTF-8");

	  int ocKey = Integer.parseInt(request.getParameter("ocKey"));
	  
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  
	  ProductManagementBean bean3 = pmmgr.getpm3(ocKey);//db 가져오기
	  int ocKey1 = bean3.getOcKey();//option_code
	  String oc1 = bean3.getOc1();//option_code
	  String oc2 = bean3.getOc2();//option_code
	  String oc3 = bean3.getOc3();//option_code
	  String oc4 = bean3.getOc4();//option_code
	  String oc5 = bean3.getOc5();//option_code
	  int productKey = bean3.getProductKey();//option_code 용 

	  session.setAttribute("bean3",bean3);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><%=ocKey %></title>
	<link href="../css/admin2.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function list(){
		   	
			document.listFrm.submit();
 
	</script>
</head>
<body>
	<br/><br/>
	<table align="center" width="1500" cellspacing="3">
	 <tr>
	  <td bgcolor= "#002266" align="center"><font color = "#ffc303"font-weight= "800"><%=ocKey %></font></td>
	 </tr>
	 <tr>
	  <td colspan="2">
	   <table cellpadding="3" cellspacing="0" width="100%">
	  <tr> 
	  	<td align="center"  bgcolor= "#002266" ><font color = "#ffc303"> 상품 번호</font></td>
	  	<td colspan="3"><%=ocKey%></td>
	 </tr> 
	 <tr> 
	  	<td align="center"  bgcolor= "#002266" ><font color = "#ffc303"> 상품 옵션번호</font></td>
	  	<td colspan="3"><%=productKey%></td>
	 </tr>
	 <tr> 
	  	<td align="center"  bgcolor= "#002266" ><font color = "#ffc303">옵션 1</font></td>
	  	<td colspan="3"><%=oc1 %></td>
	 </tr>
	 <tr>
	  	<td align="center" bgcolor= "#002266" ><font color = "#ffc303">옵션 2</font></td>
	  	<td colspan="3"><%=oc2 %></td>
	 </tr>
	 <tr> 
	    <td align="center"bgcolor= "#002266" ><font color = "#ffc303">옵션 3</font></td>
	    <td  colspan="3"><%=oc3 %></td>
	 </tr>
	 <tr>
	    <td align="center" bgcolor= "#002266" ><font color = "#ffc303">옵션 4</font></td>
	    <td colspan="3"><%=oc4%></td>
	 </tr>
	 <tr> 
	    <td align="center"bgcolor= "#002266" ><font color = "#ffc303">옵션 5</font></td>
	    <td colspan="3"><%=oc5 %></td>
	 </tr> 
	   </table>
	  </td>
	 </tr>
	 <tr>
	  <td align="center" colspan="2"> 
	 <hr/>
	 [ <a href="../admin/productManagement3.jsp" >상품옵션 리스트</a> | 
	 <a href="../admin/productOupdate.jsp?nowPage=<%=nowPage%>&ocKey=<%=ocKey%>" >수 정</a> ]
	  </td>
	 </tr>
	</table>
	</form>
	
	<form name="listFrm" method="post" action="../admin/productManagement3.jsp">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<%if(!(keyWord==null || keyWord.equals(""))){ %>
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
		<%}%>
	</form>
</body>
</html>