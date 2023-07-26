<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "admin.ProductManagementBean" %>
<jsp:useBean id="pmmgr" class="admin.ProductManagementMgr" />
<%
		 
		//productmanagement.jsp페이지에서 이동한 productName,productKey,nowPage 파라미터를 받아 각 각 변수에 저장

		int productKey = Integer.parseInt(request.getParameter("productKey"));
		
		//System.out.println("productFileupdate.jsp productKey = " + productKey);
		
		String nowPage = request.getParameter("nowPage");
		
		 //session에 저장된 pmbean객체를 이용해서 게시물 정보를 각 각 변수에 저장 
		ProductManagementBean bean = (ProductManagementBean) session.getAttribute("bean");
		 
		String productName = bean.getProductName();
		String productComment = bean.getProductComment();
		String productInfo = bean.getProductInfo();
		String productDetail = bean.getProductDetail();
		String productCaution = bean.getProductCaution();
		int productPrice = bean.getProductPrice();
		int productSalePrice = bean.getProductSalePrice();
		int productCount = bean.getProductCount();
		String productKind = bean.getProductKind();
		String productImg = bean.getProductImg();
		int categoryKey = bean.getCategoryKey();
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
	   <td bgcolor= "#002266" align="center"><font color = "#ffc303">상품 수정하기</font></td>
	  </tr>
	</table>
	<!-- boardUpdate 로 url맵핑된 서블릿으로 이동한다. -->
	<form name="updateFrm" method="post" action="ptfupdate">
	<table width="1200" cellpadding="7">
	 <tr>
	  <td>
	   <table>
	    <tr>
	     <td>상품 이름</td>
	     <td>
		  <input name="productName" value="<%=productName%>" size="70" maxlength="100">
		 </td>
		</tr>
		<tr>
	     <td>상품 내용</td>
	     <td>
		  <input name="productComment" size="70" value="<%=productComment%>" maxlength="100">
		 </td>
	    <tr>
	     <td>상품 가격</td>
	     <td>
		  <input name="productPrice" size="70" value="<%=productPrice%>" maxlength="100">
		 </td>
	    </tr>
	    <tr>
	     <td>상품 할인가</td>
	     <td>
		  <input name="productSalePrice" size="70" value="<%=productSalePrice%>" maxlength="100">
		 </td>
	    </tr>
	   	<tr>
	     <td>상품 수량</td>
	     <td>
		  <input name="productCount" size="70" value="<%=productCount%>" maxlength="100">
		 </td>
	    </tr>
	   	<tr>
	     <td>애완동물 종류</td>
	     <td>
		  <input name="productKind" type="radio"
		  value="dog" <%
		  if("dog".equals(productKind)){%>checked<%}%>>dog</input>
		  <input name="productKind" type="radio" value="cat"
		  <%if("cat".equals(productKind)){%>checked<%}%>>cat</input>
		  <input name="productKind" type="radio" value="both"
		  <%if("both".equals(productKind)){%>checked<%}%>>both</input>
		 </td>
	    </tr>
	   	<tr>
	     <td>상품 카테고리</td>
	     <td>
		  <input name="categoryKey" size="70" value="<%=categoryKey%>" maxlength="100">
		 </td>
	    </tr>
	    <tr>
			<td>상품 대표 이미지</td> 
			<td id = "pti"><input name="productImg" value = "<%=productImg %>" size="70" maxlength="100"></td>
		</tr>
		<tr>
			<td>상품 사이즈 사진</td>
			<td id = "pd"><input name="productDetail" value = "<%=productDetail%>" size="70" maxlength="100"></td>
		</tr>
				    
		<tr>
			<td>상품 설명 사진</td>
			<td id = "pi"><input name="productInfo" value = "<%=productInfo%>" size="70" maxlength="100"></td>
		</tr>
		<tr>
			<td>상품 주의사항 사진</td>
			<td id = "pca"><input name="productCaution" value = "<%=productCaution%>" size="70" maxlength="100"></td>
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
	 <input type='hidden' name="productKey" value="<%=productKey%>">
	</form> 
	</div>
</body>
</html>
