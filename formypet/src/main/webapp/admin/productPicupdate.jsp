<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "admin.ProductManagementBean" %>
    <% 
	  //session에 저장된 pmbean객체를 이용해서 게시물 정보를 각 각 변수에 저장 
	  ProductManagementBean pmbean = (ProductManagementBean)session.getAttribute("vlist");
	  String fileSaveName = pmbean.getFileSaveName();
	  String fileOriginalName = pmbean.getFileOriginalName();
	  int size = pmbean.getSize();
	  int productKey = pmbean.getProductKey();
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
		<form name="postFrm" method="post" action="ptpupdate" enctype="multipart/form-data">
		<table width="800" cellpadding="3" align="center">
			<tr>
				<td align=center>
				<table align="center" bgcolor = "skyblue">
					<tr>
						<td>상품 사진</td>
						<td>
						<input name="fileSaveName" value = "<%=fileSaveName%>"size="30" maxlength="30">
						</td>
					</tr>
					<tr>
						<td>상품 사진</td>
				     	<td><input name="fileOriginalName"  value = "<%=fileOriginalName%>"size="30" maxlength="30" >
				     	</td>				     	
					</tr>	
					<tr>
						<td>상품 키</td>
						<td><input name="productKey" value = "<%=productKey%>" size="30" maxlength="30"></td>
					</tr>
					<tr>
						<td>상품 상세 사진</td>
						<td id = "pca"><input type="file" name="productCaution" value = "<%//productCaution %>" size="30" maxlength="30">
				     	<input type="button" onclick = "additem4()" value="추가"></td>
					</tr>
					<tr>
						<td colspan="2"><hr/></td>
						</tr>
					<tr>
						<td colspan="2">
						<td><input type="submit" value="수정 완료" id = click>
						<input type="reset" value="다시 수정">
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
<script>
	var click = document.getElementById("click");
	click.onclick = function(event) {
		self.close();
	}
</script>