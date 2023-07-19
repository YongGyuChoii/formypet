<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*,admin.*" %>
<jsp:useBean id = "pMMgr" class = "admin.ProductManagementMgr" scope = "page" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 사진 추가 페이지</title>
	<script src="../js/productFileupload.js"></script>
</head>
<body>
	<div align="center">
		<br/><br/>
		<table width="600" cellpadding="3">
			<tr>
				<td  align="center">상품 사진 추가</td>
			</tr>
		</table>
		<!-- form 태그의 action 이 BoardPostSevlet 클래스의 url 맵핑 을 찾아서 이동한다. -->
		<form name="postFrm" method="post" action="ProductPicupload" enctype="multipart/form-data">
		<table width="800" cellpadding="3" align="center">
			<tr>
				<td align=center>
				<table align="center" bgcolor = "skyblue">
					<tr>
						<td>상품 사진 등록(설명, 사이즈, 주의사항, 대표 사진)</td>
						<td id = "fsn"><input type="file" name="files" size="30" maxlength="30">
				     	<input type="button" onclick = "additem6()" value="추가"></td>
					</tr>
				    <tr>
				     	<td>상품 키</td> 
				     	<td><input name="productKey" size="30" maxlength="50"></td>
				    </tr>
					<tr>
						<td colspan="2"><hr/></td>
						</tr>
					<tr>
						<td colspan="2">
						<td><input type="submit" value="등록">
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

		
