<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="javax.servlet.*"%>    
<%@page import="cart.CartBean"%>
<%@page import="product.ProductBean"%>
<%@page import="product.ProductFileBean"%>
<%@page import="java.util.*"%>
<%@include file = "/base/icon.jsp" %>
<jsp:useBean id="cMgr" class="cart.CartMgr" />
<jsp:useBean id="bMgr" class="product.ProductDetailMgr" />
<%@page import="product.ProductBean"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	ArrayList<CartBean> pAll = cMgr.getCartAll();

	//쿠키 사용을 위한 비회원 장바구니
	String[] value = null;
	int[] productKey = null;
	int[] cartCount = null;
	String[] optionText = null;

	Cookie[] cookies = request.getCookies(); //쿠키 전체 불러옴
	if(cookies != null) { // 쿠키가 비어있지 않으면
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("noMemCart")){ //쿠키에서 찾아옴
				//찾은 value ,단위로 끊어줌
				value = URLDecoder.decode(cookies[i].getValue(),"UTF-8").split(",");
				productKey = new int[value.length];
				cartCount = new int[value.length];
				optionText = new String[value.length];
			    for(int k=0; k<value.length; k++){ //-단위로 상품키, 수량, 옵션 배열 저장
					productKey[k] = Integer.parseInt(value[k].split("-")[1]);
					optionText[k] = value[k].split("-")[2];
					cartCount[k] = Integer.parseInt(value[k].split("-")[0]) ;
				}  
			}
		}
	} else {
	}
	
	ArrayList<ProductBean> pb = new ArrayList<>();
	if(productKey != null) {
		pb = cMgr.insertNoMemCart(productKey);	
	}
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/base.css">
    <link rel="stylesheet"  href="../css/cart.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/cart.js"></script>
    <style>     
      a {
        text-decoration: none;
      }
      p {
        margin-top: 1rem;
      }
      img {
      	width: 80%;
      }
    </style>
</head>
<body>
    <div id="wrap">
    <!-- header 시작-->
    <header>
        <%@include file="/base/header.jsp"%>
    </header>
    <!--header 끝-->

    <div class="container">
    <section class="cart">
      <div class="cart_title">
        <h1><strong>CART</strong></h1>
      </div>
      
      <%if(memKey != null) {%>
      <table class="cart_table">
        <form>
          <colgroup>
            <col style="width: 27px;">
            <col style="width: 100px;">
          </colgroup>
          <thead>
            <tr>
              <td style="text-align: left;">
              	<input id="ProductItem" class="agreechkAll" type="checkbox" checked="checked"/>
       		  	<label for="ProductItem"></label>
              </td>
              <td colspan="3">상품정보</td>
              <td>판매가</td>
              <td>수량</td>
              <td>배송비</td>
              <td>합계</td>
            </tr>
          </thead>
          <tbody>
          	<%
        	int calPrice;
          	int deliveryFee = 3000;
          	int totalViewPrice;
          	int total=0;
          	int totalFinal=0;
          	%>
          		
          	<%for(int i=0; i<pAll.size(); i++) { %>
            <tr class="cart_table_detail" id="moveTest1"> 
            <!--계산식-->
            <%
         	 	int productViewPrice;
              	if(pAll.get(i).getProductSalePrice() == 0) {
              		productViewPrice = pAll.get(i).getProductPrice();
              	} else {
              		productViewPrice = pAll.get(i).getProductSalePrice();
              	}
                 
              	total += productViewPrice * pAll.get(i).getCartCount();
               	calPrice = productViewPrice * pAll.get(i).getCartCount();
              	
               	if(total>=50000) {
              		deliveryFee = 0;
              	} else {
              		deliveryFee = 3000;
              	}
               	
               	totalFinal = total + deliveryFee;
              	             	
              	if(deliveryFee == 0) {
              		totalViewPrice = productViewPrice * pAll.get(i).getCartCount();
              	} else {
              		totalViewPrice = productViewPrice * pAll.get(i).getCartCount() + deliveryFee;
              	}              	
          	%>
              <td>
              		<input id="chack1" class="chack" type="checkbox" checked="checked" name="checkRow" value=<%=pAll.get(i).getCartKey()%>>
              		<input type="hidden" name="productKey" value="<%=pAll.get(i).getProductKey() %>" />
              		<input type="hidden" name="memKey" value="<%=memKey%>"/>
              		<input type="hidden" name="productCount" value="<%=pAll.get(i).getProductCount()%>">
        			<label for="chack1" class="chack_ele"></label>
              </td>
              <td>
              	<a href="../product/productDetail.jsp?productKey=<%=pAll.get(i).getProductKey() %>&categoryKey=<%=pAll.get(i).getCategoryKey()%>">
                    <%if(pAll.get(i).getCategoryKey() == 1){ %>
                    <img src="../images/bathProduct/<%=pAll.get(i).getProductImg() %>" class="card-img-top" alt="상품메인" style="width:80%;">
                    <%} else if(pAll.get(i).getCategoryKey() == 2){%>
                    <img src="../images/hygieneProduct/<%=pAll.get(i).getProductImg() %>" class="card-img-top" alt="상품메인" style="width:80%;">
                    <%} else if(pAll.get(i).getCategoryKey() == 3){%>
                    <img src="../images/beautyProduct/<%=pAll.get(i).getProductImg() %>" class="card-img-top" alt="상품메인" style="width:80%;">
                    <%} else if(pAll.get(i).getCategoryKey() == 4){%>
                    <img src="../images/livingProduct/<%=pAll.get(i).getProductImg() %>" class="card-img-top" alt="상품메인" style="width:80%;">
                    <%} else if(pAll.get(i).getCategoryKey() == 5){%>
                    <img src="../images/walkProduct/<%=pAll.get(i).getProductImg() %>" class="card-img-top" alt="상품메인" style="width:80%;">
                    <%} else if(pAll.get(i).getCategoryKey() == 6){%>
                    <img src="../images/snackProduct/<%=pAll.get(i).getProductImg() %>" class="card-img-top" alt="상품메인" style="width:80%;">
                    <%} else if(pAll.get(i).getCategoryKey() == 7){%>
                    <img src="../images/clothesProduct/<%=pAll.get(i).getProductImg() %>" class="card-img-top" alt="상품메인" style="width:80%;">
                    <%} %>
                 </a>
              </td>
              <td colspan="2">
              	<a style="color: black;" href="../product/productDetail.jsp?productKey=<%=pAll.get(i).getProductKey() %>&categoryKey=<%=pAll.get(i).getCategoryKey()%>"><%=pAll.get(i).getProductName()%></a>
              	<br>
              	<input type="hidden" name="optionValue" value="<%=pAll.get(i).getOptionValue()%>">
              	<%if(pAll.get(i).getOptionValue() != null) {%>
              	<a style="font-size:12px; opacity: 0.8"><%=pAll.get(i).getOptionValue()%></a>
              	<%} %>
              </td>
              <td class="cart_table_button">
        	  	<%if(pAll.get(i).getProductSalePrice() == 0) {%>
        	  	<strong><fmt:formatNumber value="<%=pAll.get(i).getProductPrice()%>" pattern="#,###"/>원</strong>
        	  	<%} else {%>
        	  	<strong style="opacity: 0.5"><del><fmt:formatNumber value="<%=pAll.get(i).getProductPrice()%>" pattern="#,###"/>원</del></strong>
        	  	<br>
        	  	<strong><fmt:formatNumber value="<%=pAll.get(i).getProductSalePrice()%>" pattern="#,###"/>원</strong>
        	  	<%}%>
              </td>                        
              <td>
                <button name="countBtn+" id="upBtn">+</button>
                <input name="countInput" class="countInput" type="text" value="<%=pAll.get(i).getCartCount()%>" style="width: 30px; text-align: center;" readonly>                
                <button name="countBtn-" id="downBtn">-</button>
              </td>
              </from>            
              <% if(i == 0) {%>
              <td rowspan=100%>
              	<strong><p>배송비 3,000원<br><a style="font-size:10px">(50,000원 이상 구매시 무료!)</a></p></strong>   
              </td>
			  <% } else { %>
			  <% } %>
              <td><strong><fmt:formatNumber value="<%=calPrice%>" pattern="#,###"/>원</strong></td>          
            </tr>
          <% } %>
          </tbody>
          <tfoot>
            <tr>
              <td colspan="3"> <button class="cart_table_button2" id="delete">선택상품 삭제</button>
              <button class="cart_table_button2" type="button" id="deleteAll" onclick="location='cartDeleteAll.jsp;'">장바구니 비우기</button>
              </td>
              <td></td>
              <td></td>
              <td colspan="3" style="text-align: right;"><strong>총 상품구매금액 <fmt:formatNumber value="<%=total%>" pattern="#,###"/>원  + 배송비 <fmt:formatNumber value="<%=deliveryFee%>" pattern="#,###"/>원 = 합계 <fmt:formatNumber value="<%=totalFinal%>" pattern="#,###"/>원</strong></td>
            </tr>
          </tfoot>
        </form>
      </table>
      <div class="cart_bottom_button">
        <button class="cart_big_button left"><a style="color: black;" href="../index.html">쇼핑 계속하기</a></button>
        <button class="cart_big_button right" id="memBuy">주문하기</button>
      </div>     
      <table class="table_bottom">
        <colgroup>
          <col style="width: 17%;">
          <col style="width: 17%;">
          <col style="width: 19%;">
          <col style="width: 17%;">
          <col style="width: auto;">
        </colgroup>
        <thead>
          <tr style="text-align: center;">
            <th>총 상품금액</th>
            <th>배송비</th>
            <th colspan="4">결재 예정금액</th>
          </tr>
        </thead>
        <tbody class="tbody_center">
          <tr>
            <td><strong><fmt:formatNumber value="<%=total%>" pattern="#,###"/>원</strong></td>
            <td><strong>+<fmt:formatNumber value="<%=deliveryFee%>" pattern="#,###"/>원</strong></td>
            <td colspan="4" style="color: blue;"><strong>=<fmt:formatNumber value="<%=totalFinal%>" pattern="#,###"/>원</strong></td>
          </tr>
        </tbody>
      </table>
      <%} else {%>
      <!-- 상품이 담겨져있지않으면 빈카트 페이지로 이동 -->
      <% 
	  if(productKey == null) { 
		response.sendRedirect("cartEmpty.jsp");
	  } else {
	  %>
      <table class="cart_table">
        <form>
          <colgroup>
            <col style="width: 27px;">
            <col style="width: 100px;">
          </colgroup>
          <thead>
            <tr>
              <td style="text-align: left;">
              	<input id="ProductItem" class="agreechkAll" type="checkbox" checked="checked"/>
       		  	<label for="ProductItem"></label>
              </td>
              <td colspan="3">상품정보</td>
              <td>판매가</td>
              <td>수량</td>
              <td>배송비</td>
              <td>합계</td>
            </tr>
          </thead>
          <tbody>          	
          	<%
        	int calPrice;
          	int deliveryFee = 3000;
          	int totalViewPrice;
          	int total=0;
          	int totalFinal=0;
          	%>
          	
          	<%for(int i=0; i<pb.size(); i++) { %>	
            <tr class="cart_table_detail" id="moveTest2">
            <!--계산식-->
            <%
         	 	int productViewPrice;
              	if(pb.get(i).getProductSalePrice() == 0) {
              		productViewPrice = pb.get(i).getProductPrice();
              	} else {
              		productViewPrice = pb.get(i).getProductSalePrice();
              	}
              	
              	total += productViewPrice * cartCount[i];
               	calPrice = productViewPrice * cartCount[i];
              	
              	calPrice = productViewPrice * cartCount[i];
              	if(calPrice>=50000) {
              		deliveryFee = 0;
              	} else {
              		deliveryFee = 3000;
              	}
              	
              	totalFinal = total + deliveryFee;
              	             	
              	if(deliveryFee == 0) {
              		totalViewPrice = productViewPrice * cartCount[i];
              	} else {
              		totalViewPrice = productViewPrice * cartCount[i] + deliveryFee;
              	}              	
          	%>
              <td>
              		<input id="chack1" class="chack" type="checkbox" checked="checked" name="checkRow">
              		<input type="hidden" name="productKey" value="<%=pb.get(i).getProductKey() %>" />
              		<input type="hidden" name="productCount" value="<%=pb.get(i).getProductCount()%>"> 
        			<label for="chack1" class="chack_ele"></label>
              </td>
              <td>
              	<a href="../product/productDetail.jsp?productKey=<%=pb.get(i).getProductKey() %>&categoryKey=<%=pb.get(i).getCategoryKey()%>">
                    <%if(pb.get(i).getCategoryKey() == 1){ %>
                    <img src="../images/bathProduct/<%=pb.get(i).getProductImg() %>" class="card-img-top" alt="상품메인" style="width:80%;">
                    <%} else if(pb.get(i).getCategoryKey() == 2){%>
                    <img src="../images/hygieneProduct/<%=pb.get(i).getProductImg() %>" class="card-img-top" alt="상품메인" style="width:80%;">
                    <%} else if(pb.get(i).getCategoryKey() == 3){%>
                    <img src="../images/beautyProduct/<%=pb.get(i).getProductImg() %>" class="card-img-top" alt="상품메인" style="width:80%;">
                    <%} else if(pb.get(i).getCategoryKey() == 4){%>
                    <img src="../images/livingProduct/<%=pb.get(i).getProductImg() %>" class="card-img-top" alt="상품메인" style="width:80%;">
                    <%} else if(pb.get(i).getCategoryKey() == 5){%>
                    <img src="../images/walkProduct/<%=pb.get(i).getProductImg() %>" class="card-img-top" alt="상품메인" style="width:80%;">
                    <%} else if(pb.get(i).getCategoryKey() == 6){%>
                    <img src="../images/snackProduct/<%=pb.get(i).getProductImg() %>" class="card-img-top" alt="상품메인" style="width:80%;">
                    <%} else if(pb.get(i).getCategoryKey() == 7){%>
                    <img src="../images/clothesProduct/<%=pb.get(i).getProductImg() %>" class="card-img-top" alt="상품메인" style="width:80%;">
                    <%} %>
                 </a>
              </td>
              <td colspan="2">
              	<a style="color: black;" href="../product/productDetail.jsp?productKey=<%=pb.get(i).getProductKey() %>&categoryKey=<%=pb.get(i).getCategoryKey()%>"><%=pb.get(i).getProductName()%></a>
              	<br>
              	<input type="hidden" name="optionText" value="<%=optionText[i]%>">
              	<%if(!optionText[i].equals("null")) {%>
              	<a style="font-size:12px; opacity: 0.8">[옵션 : <%=optionText[i]%>]</a>
              	<%} else {%>              	
              	<%}%>
              </td>
              <td class="cart_table_button">
        	  	<%if(pb.get(i).getProductSalePrice() == 0) {%>
        	  	<strong><fmt:formatNumber value="<%=pb.get(i).getProductPrice()%>" pattern="#,###"/>원</strong>
        	  	<%} else {%>
        	  	<strong style="opacity: 0.5"><del><fmt:formatNumber value="<%=pb.get(i).getProductPrice()%>" pattern="#,###"/>원</del></strong>
        	  	<br>
        	  	<strong><fmt:formatNumber value="<%=pb.get(i).getProductSalePrice()%>" pattern="#,###"/>원</strong>
        	  	<%}%>
              </td>                        
              <td>
                <input name="countInput" class="countInput" type="text" value="<%=cartCount[i]%>">                
              </td>
              </from>
              <% if(i == 0) {%>
              <td rowspan=100%>
              	<strong><p>배송비 3,000원<br><a style="font-size:10px">(50,000원 이상 구매시 무료!)</a></p></strong>   
              </td>
			  <% } else { %>
			  <% } %>
              <td><strong><fmt:formatNumber value="<%=calPrice%>" pattern="#,###"/>원</strong></td>          
            </tr>
          <% } %>
          </tbody>
          <tfoot>
            <tr>
              <td colspan="3"><button class="cart_table_button2" type="button" id="deleteAll" onclick="location='cartCookieDel.jsp;'">장바구니 비우기</button></td>
              <td></td>
              <td></td>
              <td colspan="3" style="text-align: right;"><strong>총 상품구매금액 <fmt:formatNumber value="<%=total%>" pattern="#,###"/>원 + 배송비 <fmt:formatNumber value="<%=deliveryFee%>" pattern="#,###"/>원 = 합계 <fmt:formatNumber value="<%=totalFinal%>" pattern="#,###"/>원</strong></td>
            </tr>
          </tfoot>
        </form>
      </table>
      <div class="cart_bottom_button">
        <button class="cart_big_button left"><a style="color: black;" href="../index.html">쇼핑 계속하기</a></button>
        <button class="cart_big_button right" id="noMemBuy">주문하기</button>
      </div>
  
      <table class="table_bottom">
        <colgroup>
          <col style="width: 17%;">
          <col style="width: 17%;">
          <col style="width: 19%;">
          <col style="width: 17%;">
          <col style="width: auto;">
        </colgroup>
        <thead>
          <tr style="text-align: center;">
            <th>총 상품금액</th>
            <th>배송비</th>
            <th colspan="4">결재 예정금액</th>
          </tr>
        </thead>
        <tbody class="tbody_center">
          <tr>
            <td><strong><fmt:formatNumber value="<%=total%>" pattern="#,###"/>원</strong></td>
            <td><strong>+<fmt:formatNumber value="<%=deliveryFee%>" pattern="#,###"/>원</strong></td>
            <td colspan="4" style="color: blue;"><strong>=<fmt:formatNumber value="<%=totalFinal%>" pattern="#,###"/>원</strong></td>
          </tr>
        </tbody>
      </table>
      <% } %>
    </section>
    </div>
    <!--main 끝-->

    <!-- 오른쪽 맨위 맨아래 화살표 -->
    	<%@include file="/base/rightAside.jsp"%>
    <!-- 오른쪽 맨위 맨아래 화살표 끝 -->
    
    <!-- footer 시작-->
    <footer id="footer">
      	<%@include file="/base/footer.jsp"%>
    </footer>
    <!-- footer 끝.-->
    </div>
    <% } %>
</body>
</html>
