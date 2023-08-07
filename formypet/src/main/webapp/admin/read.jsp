<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="admin.ProductManagementBean"%>
<jsp:useBean id="pmmgr" class="admin.ProductManagementMgr" />
<%
	  request.setCharacterEncoding("UTF-8");

	  int productKey = Integer.parseInt(request.getParameter("productKey"));

	  
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  
	  ProductManagementBean bean = pmmgr.getpm(productKey);//게시물 가져오기
	  //bean 객체 에서 getter 메서드를 이용하여 파라미터를 가져와서 화면에 출력하기 위해 각 변수에 대입한다.
	  String productName = bean.getProductName();
	  String productComment = bean.getProductComment();
      String productInfo = bean.getProductInfo();
	  String productDetail = bean.getProductDetail();
	  String productCaution = bean.getProductCaution(); 
	  String productImg = bean.getProductImg();
	  int productPrice = bean.getProductPrice();
	  int productSalePrice = bean.getProductSalePrice();
	  int productCount = bean.getProductCount();
	  String productKind = bean.getProductKind();
	  int categoryKey = bean.getCategoryKey();
	  int productKey1 = bean.getProductKey();
	  String delYn = bean.getDelYn();
 
	  session.setAttribute("bean", bean);//상품을 세션에 저장 product db

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><%=productName %></title>
	<link href="../css/admin2.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function list(){
		   	
			document.listFrm.submit();
		}
 
	</script>
</head>
<body>
	<br/><br/>
	<table align="center" width="1500" cellspacing="3">
	 <tr>
	  <td bgcolor= "#002266" align="center"><font color = "#ffc303"font-weight= "800"><%=productName %></font></td>
	 </tr>
	 <tr>
	  <td colspan="2">
	   <table cellpadding="3" cellspacing="0" width="100%">
	  <tr> 
	  	<td align="center"  bgcolor= "#002266" ><font color = "#ffc303"> 상품 번호</font></td>
	  	<td colspan="3"><%=productKey1%></td>
	 </tr> 
	 <tr> 
	  	<td align="center"  bgcolor= "#002266" ><font color = "#ffc303"> 상품 이름</font></td>
	  	<td colspan="3"><%=productName%></td>
	 </tr>
	 <tr>
	  	<td align="center" bgcolor= "#002266" ><font color = "#ffc303">상품 내용</font></td>
	  	<td colspan="3"><%=productComment%></td>
	 </tr>
	 <tr> 
	    <td align="center"bgcolor= "#002266" ><font color = "#ffc303">상품 가격</font></td>
	    <td  colspan="3"><%=productPrice%></td>
	 </tr>
	 <tr>
	    <td align="center" bgcolor= "#002266" ><font color = "#ffc303">상품 할인가</font></td>
	    <td colspan="3"><%=productSalePrice%></td>
	 </tr>
	 <tr> 
	    <td align="center"bgcolor= "#002266" ><font color = "#ffc303">상품 수량</font></td>
	    <td colspan="3"><%=productCount%></td>
	 </tr>
	 <tr>
	    <td align="center"bgcolor= "#002266" ><font color = "#ffc303">애완동물 종류</font></td>
	    <td colspan="3">
		  <input name="productKind" type="radio" value="dog" 
		  <%if("dog".equals(productKind)){%>checked<%}%>>dog</input>
		  <input name="productKind" type="radio" value="cat"
		  <%if("cat".equals(productKind)){%>checked<%}%>>cat</input>
		  <input name="productKind" type="radio" value="both"
		  <%if("both".equals(productKind)){%>checked<%}%>>both</input>
		 </td>
	 </tr>	 
	 <tr>
	    <td align="center"bgcolor= "#002266" ><font color = "#ffc303">상품 카테고리</font></td>
	    <td colspan="3">
		  <input name="categoryKey" type="radio" value= "1"
		  <%if(1 == categoryKey){%>checked<%}%>>목욕</input>
		  
		  <input name="categoryKey" type="radio" value= "2"
		  <%if(2 == categoryKey){%>checked<%}%>>배변/위생</input>
		  
		  <input name="categoryKey" type="radio" value= "3"
		  <%if(3 == categoryKey){%>checked<%}%>>미용/케어</input>
		 
		  <input name="categoryKey" type="radio" value= "4"
		  <%if(4 == categoryKey){%>checked<%}%>>홈/리빙</input>
		  
		  <input name="categoryKey" type="radio" value= "5"
		  <%if(5 == categoryKey){%>checked<%}%>>산책/놀이</input>
		  
		  <input name="categoryKey" type="radio" value= "6"
		  <%if(6 == categoryKey){%>checked<%}%>>간식/영양제</input>
		  
		  <input name="categoryKey" type="radio" value= "7"
		  <%if(7 == categoryKey){%>checked<%}%>>의류/악세사리</input>
		 </td>
	 </tr>  
	 <tr> 
	     <td align="center"bgcolor= "#002266" ><font color = "#ffc303">상품 대표 이미지</font></td>
	     <td>
	     <% if(	productImg !=null && !productImg.equals("")) {%>
	  		<%=productImg%>
	  		 <%} else{%> 등록된 파일이 없습니다.<%}%>
	  </td>
	   <tr> 
	     <td align="center"bgcolor= "#002266" ><font color = "#ffc303">상품 설명 사진</font></td>
	     <td colspan="3">
	     <% if(	productInfo !=null && !productInfo.equals("")) {%>
	  		<%=productInfo%>
	  		 <%} else{%> 등록된 파일이 없습니다.<%}%>
	     </td>
	   </tr>
	   <tr> 
	   <tr> 
	     <td align="center"bgcolor= "#002266" ><font color = "#ffc303">상품 사이즈 사진</font></td>
	     <td>
	     <% if(	productDetail !=null && !productDetail.equals("")) {%>
	  		<%=productDetail%>
	  		 <%} else{%> 등록된 파일이 없습니다.<%}%>
	     </td>
	   </tr>
	   <tr> 
	     <td align="center"bgcolor= "#002266" ><font color = "#ffc303">상품 주의사항 사진</font></td>
	     <td size="70" maxlength="100">
	     <% if(	productCaution !=null && !productCaution.equals("")) {%>
	  		<%=productCaution%>
	  		 <%} else{%> 등록된 파일이 없습니다.<%}%>
	     </td>
	   </tr>
	  <tr>
	   		<td align="center"bgcolor= "#002266" ><font color = "#ffc303">상품 삭제</font></td>
	    	<td colspan="3">
		  	<input name="delYn" type="radio" value="Y"<%if("Y".equals(delYn)){%>checked<%}%>>Y</input>
		  	<input name="delYn" type="radio" value="N"<%if("N".equals(delYn)){%>checked<%}%>>N</input>
		 	</td>
	 </tr>	
	   
	   </table>
	  </td>
	 </tr>
	 <tr>
	  <td align="center" colspan="2"> 
	 <hr/>
	 [ <a href="../admin/productManagement.jsp" >상품 리스트</a> | 
	 <a href="../admin/productFileupdate.jsp?nowPage=<%=nowPage%>&productKey=<%=productKey%>" >수 정</a> ]
	  </td>
	 </tr>
	</table>
	</form>
	
	<form name="listFrm" method="post" action="../admin/productManagement.jsp">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<%if(!(keyWord==null || keyWord.equals(""))){ %>
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
		<%}%>
	</form>
</body>
</html>