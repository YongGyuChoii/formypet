<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*,admin.*" %>
<jsp:useBean id = "pMMgr" class = "admin.ProductManagementMgr" scope = "page" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 사진 추가 페이지</title>
	<link href = "../css/admin2.css" rel = "stylesheet" type = "text/css">
	
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
		<form name="postFrm" method="post" action="productPicupload" enctype="multipart/form-data">
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
						<td bgcolor= "#002266"><font color = "#ffc303">상품 원본사진</font></td>
				     	<td><input type = "file" name="fileOriginalName" size="70" maxlength="100" >
				     	</td>				     	
					</tr>	
					<tr>
						<td bgcolor= "#002266"><font color = "#ffc303">상품 사본사진</font></td>
						<td><input type = "file" name="fileSaveName" size="70" maxlength="100"></td>
					</tr>
					
					<tr>
						<td colspan="2"align="center"><hr/></td>
						
					</tr>
					<tr align = center>
						<td colspan="2">
						<td><input type="submit" value="등록" id = click>
						<input type="reset" value="취소">
						<a href="../admin/productManagement2.jsp" ><input type = "button" value = "상품 리스트"></input></a>
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

		

		
