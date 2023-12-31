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
		int productKey1 = bean.getProductKey();
		String delYn = bean.getDelYn();
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
	   <td bgcolor= "#002266" align="center"><font color = "#ffc303"><%=productName %></font></td>
	  </tr>
	</table>
	<!-- boardUpdate 로 url맵핑된 서블릿으로 이동한다. -->
	<form name="updateFrm" method="post" action="ptfupdate">
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
	     <td bgcolor= "#002266"><font color = "#ffc303">상품 이름</font></td>
	     <td>
		  <input name="productName" value="<%=productName%>" size="70" maxlength="100">
		 </td>
		</tr>
		<tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">상품 내용</font></td>
	     <td>
		  <input name="productComment" size="70" value="<%=productComment%>" maxlength="100">
		 </td>
	    <tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">상품 가격</font></td>
	     <td>
		  <input name="productPrice" size="70" value="<%=productPrice%>" maxlength="100">
		 </td>
	    </tr>
	    <tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">상품 할인가</font></td>
	     <td>
		  <input name="productSalePrice" size="70" value="<%=productSalePrice%>" maxlength="100">
		 </td>
	    </tr>
	   	<tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">상품 수량</font></td>
	     <td>
		  <input name="productCount" size="70" value="<%=productCount%>" maxlength="100">
		 </td>
	    </tr>
	   	<tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">애완동물 종류</font></td>
	     <td>
		  <input name="productKind" type="radio" value="dog"
		  <%if("dog".equals(productKind)){%>checked<%}%>>dog</input>
		  <input name="productKind" type="radio" value="cat"
		  <%if("cat".equals(productKind)){%>checked<%}%>>cat</input>
		  <input name="productKind" type="radio" value="both"
		  <%if("both".equals(productKind)){%>checked<%}%>>both</input>
		 </td>
	    </tr>
	   	<tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">상품 카테고리</font></td>
	     <td>
		  <input name="categoryKey" type="radio" value="1"
		  <%if(1 == categoryKey){%>checked<%}%>>목욕</input>
		  <input name="categoryKey" type="radio" value="2"
		  <%if(2 == categoryKey){%>checked<%}%>>배변/위생</input>
		  <input name="categoryKey" type="radio" value="3"
		  <%if(3 == categoryKey){%>checked<%}%>>미용/케어</input>
		  <input name="categoryKey" type="radio" value="4"
		  <%if(4 == categoryKey){%>checked<%}%>>홈/리빙</input>
		  <input name="categoryKey" type="radio" value="5"
		  <%if(5 == categoryKey){%>checked<%}%>>산책/놀이</input>
		  <input name="categoryKey" type="radio" value="6"
		  <%if(6 == categoryKey){%>checked<%}%>>간식/영양제</input>
		  <input name="categoryKey" type="radio" value="7"
		  <%if(7 == categoryKey){%>checked<%}%>>의류/악세사리</input>
		 </td>
	    </tr>
		<tr>
			<td bgcolor= "#002266"><font color = "#ffc303">상품 대표 이미지</font></td> 
			<td id = "pti"><input type="file" name="productImg" size="70" maxlength="100">
		</tr>
		<tr>
			<td bgcolor= "#002266"><font color = "#ffc303">상품 설명 사진</font></td>
			<td id = "pd"><input type="file" name="productInfo" size="70" maxlength="100">
		</tr>    
		<tr>
			<td bgcolor= "#002266"><font color = "#ffc303">상품 사이즈 사진</font></td>
			<td id = "pi"><input type="file" name="productDetail" size="70" maxlength="100">
		</tr>
		<tr>
			<td bgcolor= "#002266"><font color = "#ffc303">상품 주의사항 사진</font></td>
			<td id = "pca"><input type="file" name="productCaution" size="70" maxlength="100">
		</tr>
		<tr>
	   		<td align="center"bgcolor= "#002266" ><font color = "#ffc303">상품 삭제</font></td>
	    	<td colspan="3">
		  	<input name="delYn" type="radio" value="Y"<%if("Y".equals(delYn)){%>checked<%}%>>Y</input>
		  	<input name="delYn" type="radio" value="N"<%if("N".equals(delYn)){%>checked<%}%>>N</input>
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
	 <input type='hidden' name="productKey" value="<%=productKey%>">
	</form> 
	</div>
</body>
</html>
