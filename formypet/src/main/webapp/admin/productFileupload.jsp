<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*,admin.*" %>
<jsp:useBean id = "pMMgr" class = "admin.ProductManagementMgr" scope = "page" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 추가</title>
	<link href = "../css/admin2.css" rel = "stylesheet" type = "text/css">
	<script src="../js/productFileupload.js"></script>
</head>
<body>
	<div align="center">
		<br/><br/>
		<table width="600" cellpadding="3">
			<tr>
				<td  align="center" bgcolor= "#002266"><font color = "#ffc303">상품 추가</font></td>
			</tr>
		</table>
		<!-- form 태그의 action 이 BoardPostSevlet 클래스의 url 맵핑 을 찾아서 이동한다. -->
		<form name="postFrm" method="post" action="productFileupload" enctype="multipart/form-data">
		<table width="1200" cellpadding="7">
			<tr>
				<td>
				<table>
					<tr>
						<td bgcolor= "#002266"><font color = "#ffc303">상품 번호</font></td>
						<td>
						<input name="productKey" size="70" maxlength="100"></td>
					</tr>
					<tr>
						<td bgcolor= "#002266"><font color = "#ffc303">상품 이름</font></td>
						<td>
						<input name="productName" size="70" maxlength="100"></td>
					</tr>
					<tr>
						<td bgcolor= "#002266"><font color = "#ffc303">상품 내용</font></td>
				     	<td id = "pct"><input name="productComment" size="70" maxlength="100" >
				     	</td>				     	
					</tr>	
					
					<tr>
						<td bgcolor= "#002266"><font color = "#ffc303">상품 가격</font></td>
						<td><input name="productPrice" size="70" maxlength="100"></td>
					</tr>
					<tr>
						<td bgcolor= "#002266"><font color = "#ffc303">상품 할인 가격</font></td>
						<td><input name="productSalePrice" size="70" maxlength="100"></td>
					</tr>
					<tr>
					<tr>
				     	<td bgcolor= "#002266"><font color = "#ffc303">상품 개수</font></td> 
				     	<td><input name="productCount" size="70" maxlength="100"></td>
				    </tr>
				 	<tr>
				     	<td bgcolor= "#002266"><font color = "#ffc303">애완동물 종 선택</font></td> 
				     	<td>
						  <input name="productKind" type="radio" value="dog">dog</input>
						  <input name="productKind" type="radio" value="cat">cat</input>
						  <input name="productKind" type="radio" value="both">both</input>
						 </td>
				    </tr>	
				    <tr>
				     	<td bgcolor= "#002266"><font color = "#ffc303">상품 카테고리</font></td> 
				     	<td><input name="categoryKey" size="70" maxlength="100"></td>
				    </tr>
				 	<tr>
				     	<td bgcolor= "#002266"><font color = "#ffc303">상품 대표 이미지</font></td> 
				     	<td id = "pti"><input type="file" name="productImg" size="70" maxlength="100">
				     	<input type="button" onclick = "additem5()" value="추가"></td>
				    </tr>
				    <tr>
						<td bgcolor= "#002266"><font color = "#ffc303">상품 설명 사진</font></td>
						<td id = "pd"><input type="file" name="productInfo" size="70" maxlength="100">
				     	<input type="button" onclick = "additem3()" value="추가"></td>
					</tr>
				    
				    <tr>
						<td bgcolor= "#002266"><font color = "#ffc303">상품 사이즈 사진</font></td>
						<td id = "pi"><input type="file" name="productDetail" size="70" maxlength="100">
				     	<input type="button" onclick = "additem2()" value="추가"></td>
					</tr>
					<tr>
						<td bgcolor= "#002266"><font color = "#ffc303">상품 주의사항 사진</font></td>
						<td id = "pca"><input type="file" name="productCaution" size="70" maxlength="100">
				     	<input type="button" onclick = "additem4()" value="추가"></td>
					</tr>
					<tr>
						<td colspan="2"align="center"><hr/></td>
						
						</tr>
					<tr align = center>
						<td colspan="2">
						<td><input type="submit" value="등록" id = click>
						<input type="reset" value="취소">
						<a href="../admin/productManagement.jsp" ><input type = "button" value = "상품 리스트"></input></a>
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

		
