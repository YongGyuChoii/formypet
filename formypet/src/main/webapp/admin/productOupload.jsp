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
	<%@include file = "/base/icon.jsp" %>
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
		<!-- form 태그의 action 이 ProductOuploadSevlet 클래스의 url 맵핑 을 찾아서 이동한다. -->
		<form name="postFrm" method="post" action="oupload" enctype="multipart/form-data">
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
						<td bgcolor= "#002266"><font color = "#ffc303">옵션 1</font></td>
						<td>
						<input name="oc1" size="70" maxlength="100"></td>
					</tr>
					<tr>
						<td bgcolor= "#002266"><font color = "#ffc303">옵션 2</font></td>
						<td>
						<input name="oc2" size="70" maxlength="100"></td>
					</tr>
					<tr>
						<td bgcolor= "#002266"><font color = "#ffc303">옵션 3</font></td>
						<td>
						<input name="oc3" size="70" maxlength="100"></td>
					</tr>
					<tr>
						<td bgcolor= "#002266"><font color = "#ffc303">옵션 4</font></td>
						<td>
						<input name="oc4" size="70" maxlength="100"></td>
					</tr>
					<tr>
						<td bgcolor= "#002266"><font color = "#ffc303">옵션 5</font></td>
						<td>
						<input name="oc5" size="70" maxlength="100"></td>
					</tr>
					<tr>
						<td colspan="2"align="center"><hr/></td>
						
						</tr>
					<tr align = center>
						<td colspan="2">
						<td><input type="submit" value="등록">
						<input type="reset" value="취소">
						<a href="../admin/productManagement3.jsp" ><input type = "button" value = "상품 리스트"></input></a>
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

		
