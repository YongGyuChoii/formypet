<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*,admin.*" %>
<jsp:useBean id = "pMMgr" class = "admin.ProductManagementMgr" scope = "page" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 추가</title>
	<script src="../js/productFileupload.js"></script>
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
						<input name="productName" size="30" maxlength="30"></td>
					</tr>
					<tr>
						<td>상품 내용</td>
				     	<td id = "pct"><input name="productComment" size="30" maxlength="30" >
				     	</td>				     	
					</tr>	
					
					<tr>
						<td>상품 가격</td>
						<td><input name="productPrice" size="30" maxlength="30"></td>
					</tr>
					<tr>
						<td>상품 할인 가격</td>
						<td><input name="productSalePrice" size="30" maxlength="30"></td>
					</tr>
					<tr>
					<tr>
				     	<td>상품 개수</td> 
				     	<td><input name="productCount" size="30" maxlength="30"></td>
				    </tr>
				 	<tr>
				     	<td>애완동물 종 선택</td> 
				     	<td><input name="productKind" size="30" maxlength="50"></td>
				    </tr>	
				    <tr>
				     	<td>상품 카테고리</td> 
				     	<td><input name="categoryKey" size="30" maxlength="30"></td>
				    </tr>
				 	<tr>
				     	<td>상품 대표 이미지</td> 
				     	<td id = "pti"><input type="file" name="productImg" size="30" maxlength="30">
				     	<input type="button" onclick = "additem5()" value="추가"></td>
				    </tr>
				    <tr>
						<td>상품 사이즈 사진</td>
						<td id = "pd"><input type="file" name="productDetail" size="30" maxlength="30">
				     	<input type="button" onclick = "additem3()" value="추가"></td>
					</tr>
				    
				    <tr>
						<td>상품 설명 사진</td>
						<td id = "pi"><input type="file" name="productInfo" size="30" maxlength="30">
				     	<input type="button" onclick = "additem2()" value="추가"></td>
					</tr>
					<tr>
						<td>상품 주의사항 사진</td>
						<td id = "pca"><input type="file" name="productCaution" size="30" maxlength="30">
				     	<input type="button" onclick = "additem4()" value="추가"></td>
					</tr>
					<tr>
						<td colspan="2"><hr/></td>
						</tr>
					<tr>
						<td colspan="2">
						<td><input type="submit" value="등록" id = click>
						<input type="reset" value="취소">
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

		
