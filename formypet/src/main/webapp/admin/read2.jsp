<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="admin.ProductManagementBean"%>
<jsp:useBean id="pmmgr" class="admin.ProductManagementMgr" />
<%
	  request.setCharacterEncoding("UTF-8");

	  int fileKey = Integer.parseInt(request.getParameter("fileKey"));
	  
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	 
	  ProductManagementBean bean = pmmgr.getpmbean(fileKey);//product_file db 게시물 가져오기
	
	  int productKey = bean.getProductKey();
	  
	  String fileOriginalName = bean.getFileOriginalName();
	  String fileSaveName = bean.getFileSaveName();
	  int size = bean.getSize();
	  int fileKey2 = bean.getFileKey();
	  String delYn = bean.getDelYn();
	  
	  session.setAttribute("bean", bean);//상품을 세션에 저장 
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><%=fileKey2%></title>
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
	  <td bgcolor= "#002266" align="center"><font color = "#ffc303"font-weight= "800"><%=fileKey2 %></font></td>
	 </tr>
	 <tr>
	  <td colspan="2">
	   <table cellpadding="3" cellspacing="0" width="100%"> 
	 <tr> 
	  	<td align="center"  bgcolor= "#002266" ><font color = "#ffc303"> 상품 번호</font></td>
	  	<td colspan="3"><%=productKey%></td>
	 </tr>
	 <tr>
	  	<td align="center" bgcolor= "#002266" ><font color = "#ffc303">상품사진 번호</font></td>
	  	<td colspan="3"><%=fileKey2%></td>
	 </tr>
	<tr> 
	     <td align="center"bgcolor= "#002266" ><font color = "#ffc303">상품 원본사진</font></td>
	     <td>
	     <% if(	fileOriginalName !=null && !fileOriginalName.equals("")) {%>
	  		<%=fileOriginalName%>
	  		 <%} else{%> 등록된 파일이 없습니다.<%}%>
	  </td>
	   <tr> 
	     <td align="center"bgcolor= "#002266" ><font color = "#ffc303">상품 사본사진</font></td>
	     <td colspan="3">
	     <% if(	fileSaveName !=null && !fileSaveName.equals("")) {%>
	  		<%=fileSaveName%>
	  		 <%} else{%> 등록된 파일이 없습니다.<%}%>
	     </td>
	   </tr>
	   	<tr>
	   		<td align="center"bgcolor= "#002266" ><font color = "#ffc303">상품 삭제</font></td>
	    	<td colspan="3">
		  	<input name="delYn" type="radio" value="Y"<%if("Y".equals(delYn)){%>checked<%}%>>Y</input>
		  	<input name="delYn" type="radio" value="N"<%if("N".equals(delYn)){%>checked<%}%>>N</input>
		 	</td>
	 	</tr>	
	 <tr> 
	    <td align="center"bgcolor= "#002266" ><font color = "#ffc303">상품 사진용량</font></td>
	    <td colspan="3"><%=size%></td>
	 </tr>
	   </table>
	  </td>
	 </tr>
	 <tr>
	  <td align="center" colspan="2"> 
	 <hr/>
	 [ <a href="../admin/productManagement2.jsp" >상품 리스트</a> | 
	 <a href="../admin/productPicupdate.jsp?nowPage=<%=nowPage%>&fileKey=<%=fileKey2%>" >상세 수 정</a> ]
	  </td>
	 </tr>
	</table>
	</form>
	
	<form name="listFrm" method="post" action="../admin/productManagement2.jsp">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<%if(!(keyWord==null || keyWord.equals(""))){ %>
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
		<%}%>
	</form>
</body>
</html>