<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "admin.ProductManagementBean" %>
    <% 
	  //session에 저장된 bean객체를 이용해서 게시물 정보를 각 각 변수에 저장 
	  ProductManagementBean pmbean = (ProductManagementBean)session.getAttribute("vlist");
	  String productName = pmbean.getProductName();
	  String productComment = pmbean.getProductComment(); 
	  String productInfo = pmbean.getProductInfo();
	  String productDetail = pmbean.getProductDetail();
	  String productCaution = pmbean.getProductCaution();
	  int productPrice = pmbean.getProductPrice();
	  int productSalePrice = pmbean.getProductSalePrice();
	  int productCount = pmbean.getProductCount();
	  String productKind = pmbean.getProductKind();
	  String productImg = pmbean.getProductImg();
	  int categoryKey = pmbean.getCategoryKey();
	  //수정 사항 있음 session말고 db연결해서 가져왔던 리스트로 수정하는거 필요 
	  //위에 내용 product_file db 내용으로 바꿔야함
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 내용 수정 페이지</title>
</head>
<body>
	<div align="center">
		<br/><br/>
		<table width="600" cellpadding="3">
			<tr>
				<td  align="center">상품 추가</td>
			</tr>
		</table>
		<!-- form 태그의 action 이 BoardPostSevlet 클래스의 url 맵핑 을 찾아서 이동한다. -->
		<form name="postFrm" method="post" action="productFileupload" enctype="multipart/form-data">
		<table width="800" cellpadding="3" align="center">
			<tr>
				<td align=center>
				<table align="center" bgcolor = "skyblue">
					<tr>
						<td>상품 이름</td>
						<td>
						<input name="productName" value = "<%=productName%>"size="30" maxlength="30">
						</td>
					</tr>
					<tr>
						<td>상품 내용</td>
				     	<td><input name="productComment"  value = "<%=productComment%>"size="30" maxlength="30" >
				     	</td>				     	
					</tr>	
					
					<tr>
						<td>상품 가격</td>
						<td><input name="productPrice" value = "<%=productPrice%>" size="30" maxlength="30"></td>
					</tr>
					<tr>
						<td>상품 할인 가격</td>
						<td><input name="productSalePrice" value = "<%=productSalePrice%>" size="30" maxlength="30"></td>
					</tr>
					<tr>
					<tr>
				     	<td>상품 개수</td> 
				     	<td><input name="productCount" value = "<%=productCount%>" size="30" maxlength="30"></td>
				    </tr>
				 	<tr>
				     	<td>애완동물 종 선택</td> 
				     	<td><input name="productKind" value = "<%=productKind%>" size="30" maxlength="50"></td>
				    </tr>	
				    <tr>
				     	<td>상품 카테고리</td> 
				     	<td><input name="categoryKey" valu = "<%=categoryKey%>" size="30" maxlength="30"></td>
				    </tr>
				 	<tr>
				     	<td>상품 대표 이미지</td> 
				     	<td id = "pti"><input type="file" name="productImg" value = "<%=productImg%>" size="30" maxlength="30">
				     	<input type="button" onclick = "additem5()" value="추가">js파일 수정용으로 따로 만들기</td>
				    </tr>
				    <tr>
						<td>상품 사이즈 사진</td>
						<td id = "pd"><input type="file" name="productDetail" value = "<%=productDetail%>" size="30" maxlength="30">
				     	<input type="button" onclick = "additem3()" value="추가"></td>
					</tr>
				    
				    <tr>
						<td>상품 설명 사진</td>
						<td id = "pi"><input type="file" name="productInfo" value = "<%=productInfo %>" size="30" maxlength="30">
				     	<input type="button" onclick = "additem2()" value="추가"></td>
					</tr>
					<tr>
						<td>상품 주의사항 사진</td>
						<td id = "pca"><input type="file" name="productCaution" value = "<%=productCaution %>" size="30" maxlength="30">
				     	<input type="button" onclick = "additem4()" value="추가"></td>
					</tr>
					<tr>
						<td colspan="2"><hr/></td>
						</tr>
					<tr>
						<td colspan="2">
						<td><input type="submit" value="등록">
						<input type="button" value="뒤로" onClick = "history.go(-1)">
						</td>
					</tr>
					<tr>
						<td>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>