<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "admin.ProductManagementBean" %>
<jsp:useBean id="pmmgr" class="admin.ProductManagementMgr" />
<%
		//productmanagement.jsp페이지에서 이동한 productName,productKey,nowPage 파라미터를 받아 각 각 변수에 저장
		
		int productKey = Integer.parseInt(request.getParameter("productKey"));
		
		//System.out.println("productFileupdate.jsp productKey = " + productKey);
		
		String nowPage = request.getParameter("nowPage");

		//pmmgr.getPMBean(productKey);
		
		 //session에 저장된 pmbean객체를 이용해서 게시물 정보를 각 각 변수에 저장 
		ProductManagementBean bean = (ProductManagementBean) session.getAttribute("bean");
		 
		String pName = bean.getProductName();
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
		<form name="postFrm" method="post" action="ptfupdate" enctype="multipart/form-data">
		<table width="800" cellpadding="3" align="center">
			<tr>
				<td align=center>
				<table align="center" bgcolor = "skyblue">
					<tr>
						<td>상품 이름</td>
						<td>
						<input name="productName" value = "<%=pName %>" size="70" maxlength="100">
						</td>
					</tr>
					<tr>
						<td>상품 내용</td>
				     	<td><input name="productComment" value = "<%=productComment %>" size="70" maxlength="100" >
				     	</td>				     	
					</tr>	
					
					<tr>
						<td>상품 가격</td>
						<td><input name="productPrice" value = "<%=productPrice %>" size="70" maxlength="100"></td>
					</tr>
					<tr>
						<td>상품 할인 가격</td>
						<td><input name="productSalePrice"  value = "<%=productSalePrice %>" size="70" maxlength="100"></td>
					</tr>
					<tr>
					<tr>
				     	<td>상품 개수</td> 
				     	<td><input name="productCount" value = "<%=productCount %>" size="70" maxlength="100"></td>
				    </tr>
				 	<tr>
				     	<td>애완동물 종 선택</td> 
				     	<td><input name="productKind" value = "<%=productKind%>" size="70" maxlength="100"></td>
				    </tr>	
				    <tr>
				     	<td>상품 카테고리</td> 
				     	<td><input name="categoryKey" value = "<%=categoryKey %>" size="70" maxlength="100"></td>
				    </tr>
				 	<tr>
				     	<td>상품 대표 이미지</td> 
				     	<td id = "pti"><input type="file" name="productImg" value = "<%=productImg %>" size="70" maxlength="100">
				     	<input type="button" onclick = "additem5()" value="추가">js파일 수정용으로 따로 만들기</td>
				    </tr>
				    <tr>
						<td>상품 사이즈 사진</td>
						<td id = "pd"><input type="file" name="productDetail" value = "<%=productDetail%>" size="70" maxlength="100">
				     	<input type="button" onclick = "additem3()" value="추가"></td>
					</tr>
				    
				    <tr>
						<td>상품 설명 사진</td>
						<td id = "pi"><input type="file" name="productInfo" value = "<%=productInfo%>" size="30" maxlength="30">
				     	<input type="button" onclick = "additem2()" value="추가"></td>
					</tr>
					<tr>
						<td>상품 주의사항 사진</td>
						<td id = "pca"><input type="file" name="productCaution" value = "<%=productCaution%>" size="30" maxlength="30">
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
	<input type = "hidden" name = "nowPage" value = "<%=nowPage %>">
	<input type = "hidden" name = "productName" value = "<%=productKey %>">
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