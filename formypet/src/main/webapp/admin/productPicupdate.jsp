<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "admin.ProductManagementBean" %>
    <% 
	   	int fileKey = Integer.parseInt(request.getParameter("fileKey"));
       	
    	String nowPage = request.getParameter("nowPage");
       	
       	ProductManagementBean bean = (ProductManagementBean)session.getAttribute("bean");
    
    	//session에 저장된 bean객체를 이용해서 게시물 정보를 각 각 변수에 저장 
	  	
	  	String fileSaveName = bean.getFileSaveName();
	  	String fileOriginalName = bean.getFileOriginalName();
	  	int size = bean.getSize();
	  	int productKey = bean.getProductKey();
	  	int fileKey2 = bean.getFileKey();

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 수정 페이지</title>
	<link href="../css/admin2.css" rel="stylesheet" type="text/css">
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
	   <td bgcolor= "#002266" align="center"><font color = "#ffc303"><%=fileKey2 %> 수정하기</font></td>
	  </tr>
	</table>
	<!-- boardUpdate 로 url맵핑된 서블릿으로 이동한다. -->
	<form name="updateFrm" method="post" action="ptpupdate">
	<table width="1200" cellpadding="7">
	 <tr>
	  <td>
	   <table>
	   	<tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">상품 번호</font></td>
	     <td>
		  <input name="productKey" value="<%=productKey%>" size="70" maxlength="100">
		 </td>
		</tr>
	    <tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">상품사진 번호</font></td>
	     <td>
		  <input name="fileKey" value="<%=fileKey2%>" size="70" maxlength="100">
		 </td>
		</tr>
		<tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">상품 원본사진</font></td>
	     <td>
		  <input name="fileOriginalName" size="70" value="<%=fileOriginalName%>" maxlength="100">
		 </td>
	    <tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">상품 사본사진</font></td>
	     <td>
		  <input name="fileSaveName" size="70" value="<%=fileSaveName%>" maxlength="100">
		 </td>
	    </tr>
	    <tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">상품 사진 용량</font></td>
	     <td>
		  <input name="size" size="70" value="<%=size%>" maxlength="100">
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
	 <input type='hidden' name="fileKey" value="<%=fileKey%>">
	</form> 
	</div>
</body>
</html>
