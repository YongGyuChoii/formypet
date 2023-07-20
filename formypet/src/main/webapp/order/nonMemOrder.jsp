<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/base.css">
    <link rel="stylesheet"  href="../css/order.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
    <div id="wrap">
    <!-- header 시작-->
    <header>
        <%@include file="/base/header.jsp"%>
    </header>
    <!--header 끝-->

    <!--main 시작-->
    <div class="container">

      <section>
        <div class="titleArea">
        	<h2>Order</h2>
        </div>
      <div class="memOrderJsp">  
      <div clss="orderListArea"> 
        <div class="headTitle">
        	<h3>국내배송상품 주문내역</h3>
        	<p class="button">
        		<a href="#" class="btnNormal">이전페이지</a>
        	</p>
        </div>
        <div class="gBorder">
        	<table border="1" summary>
        		<caption></caption>
        		<colgroup>
        			<col style="width:27px">
        			<col style="width:92px">
        			<col style="width:auto">
        			<col style="width:98px">
        			<col style="width:75px">
        			<col style="width:98px">
        			<col style="width:98px">
        			<col style="width:85px">
        			<col style="width:98px">
        		</colgroup>
        		<thead>
        			<tr>
        				<th scope="col" class>
        					<input type="checkbox" onclick="#">
        				</th>
        				<th scope="col">이미지</th>
        				<th scope="col">상품정보</th>
        				<th scope="col">판매가</th>
        				<th scope="col">수량</th>
        				<th scope="col">적립금</th>
        				<th scope="col">배송구분</th>
        				<th scope="col">배송비</th>
        				<th scope="col">합계</th>
        			</tr>
        		</thead>
        		<tfoot class="tableFoot">
        			<tr>
        				<td class></td>
        				<td colspan="8">
        					<span class="footLeft">[기본배송]</span>
        					상품구매금액
        					<strong>65,800
        					</strong>
        					+ 배송비
        					<span id="delPin">3,000</span>
        					= 합계 :
        					<strong class="text1">
        						<span id="totalPrice" class="text2">35,900</span>
        						원
        					</strong>
        				</td>
        			</tr>
        		</tfoot>
        		<tbody class="tableBody">
        			<tr class="bTable">
        				<td class>
        					<input type="checkbox">
        				</td>
        				<td class="firstLine">
        					<a href="#">
        						<img style="max-width: 75px;" style="text-align:center;" src="../images/cart/cart.jpg">
        					</a>
        				</td>
        				<td class="secondLine">
        					<strong class="name">
        						<a href="#" class="proName">세이프 쿨젤매트</a>
        					</strong>
        					<div class="option">[옵션 : 세이프 쿨젤매트 S]</div>
        				</td>	
        				<td class="thirdLine">
        					<div id="productPrice">
        						<strong>32,900원</strong>
        					</div>
        				</td>
        				<td style="text-align: center;">1</td>
        				<td>
        					<span id="reserves" class="text3"></span>
        				</td>
        				<td>
        					<div class="text3">
        						기본배송
        						<br>
        					</div>
        				</td>
        				<td rowspan="1" class style="text-align: center;">[조건]</td>
        				<td class="fourth">
        					<strong>
        						<span id="bodyTotalPrice">32,900</span>
        						원
        					</strong>
        				</td>
        			</tr>
        		</tbody>
        	</table>
        </div>
        <div class="buttonBase">
        	<span class="buttonLeft">
        		<strong class="baseText">선택상품을</strong>
        		<a href="#" id="baseDelete" class="btnEm">X 삭제하기</a>
        	</span>
        	<span class="buttonRight">
        		<a href="#" class="btnNormal">이전페이지</a>
        	</span>
        </div>
        
        <div class="orderAreaTop">
        	<div class="title">
        		<h3>주문 정보</h3>
        		<p class="required">* 필수입력사항</p>
        	</div>
        	<div class="orderImpormation">
        		<table border="1" summary>
        			<colgroup>
        				<col style="width:139px;">
        				<col style="width:auto;">
        			</colgroup>
        			<tbody class="addressForm">
        				<tr>
        					<th scope="row">주문하시는 분</th>
        					<td>
        						<input id="orderName" name="orderName" type="text" size="15">
        					</td>
        				</tr>
        				<tr class>
        					<th scope="row">휴대전화</th>
          					<td class>
          						<select id="orderPhone1" name="orderPhone1" value="010">
          							<option value="010">010</option>
          						</select>
          						-				
          						<input id="orderPhone2" name="orderPhone2" maxlength="4" type="text">
          						- 				
          						<input id="orderPhone3" name="orderPhone3" maxlength="4" type="text">
          					</td>
          				</tr>
        			</tbody>
        			<tbody class="emailForm">
        				<tr>
        					<th scope="row">이메일</th>
        					<td>
        						<input id="orderEmai1" name="orderEmail1" type="text">
        						@
        						<input id="orderEmail2" name="orderEmail" type="text">
        						<select id="orderEmail3">
        							<option value="">-선택-</option>
    								<option value="naver.com">naver.com</option>
    								<option value="gmail.com">gmail.com</option>
    								<option value="hanmail.net">hanmail.net</option>
    								<option value="hotmail.com">hotmail.com</option>
    								<option value="korea.com">korea.com</option>
    								<option value="nate.com">nate.com</option>
    								<option value="yahoo.com">yahoo.com</option>
    								<option value="직접입력">직접입력</option>
        						</select>
        						<ul class="orderBlank">
        							<li>이메일을 통해 주문처리과정을 보내드립니다</li>
        							<li>이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요</li>
        						</ul>
        					</td>
        				</tr>
        				<tr>
        					<th scope="row">주문조회 비밀번호</th>
        					<td>
        						<input id="orderPw1" name="orderPw1" type="password">
        						<span style="color: #707070; font-size: 12px;">(영문대소문자/숫자/특수문자 중 2가지 이상 조합, 6자~16자)</span>
        					</td>
        				</tr>
        				<tr>
        					<th scope="row">주문조회 비밀번호 확인</th>
        					<td>
        						<input id="orderPw2"  type="password">
        					</td>
        				</tr>
        			</tbody>
        		</table>
        	</div>
        </div>
        <div class="orderArea">
        	<div class="title">
        		<h3>배송정보</h3>
        		<p class="required">* 필수입력사항</p>
        	</div>
        	<div class="orderImpormation">
        		<table border="1" summary>
        			<caption>배송 정보 입력</caption>
        			<colgroup>
        				<col style="width:139px;">
        				<col style="width:auto;">
        			</colgroup>
        			<tbody class>
        				<tr class>
        					<th scope="row">배송지 선택</th>
        					<td>
        						<div class="address">
        							<input id="sameAddr1" name="sameAddr1" type="radio" autocomplete="off">
        							<label for="sameAddr1">주문자 정보와 동일</label>
        							<input id="sameAddr2" name="sameAddr2" type="radio" sutocomplete="off">
        							<label for="sameAddr2">새로운 배송지</label>
        							<a href="#" id="btnAddr" class="btnNormal">주소록 보기</a>
        						</div>
        					</td>
        				</tr>
        				<tr>
        					<th scope="row">받으시는 분</th>
        					<td>
        						<input id="delName1" name="delName2" type="text">
        					</td>
        				</tr>
        				<tr>
        					<th scope="row">배송주소</th>
        					<td>
        						<input id="delZipcode1" name="delZipcode1" type="text" maxlength="6">
        						<a href="#" id="btnZipcode" class="btnNormal">우편번호</a>
        						<br>
        						<input id="delZipcode2" name="delZipcode2" type="text">
        						<span class="grid">기본 주소</span>
        						<br>
        						<input id="delZipcode3" name="delZipcode3" type="text">
        						<span class="grid">나머지주소(선택입력가능)</span>
        					</td>
        				</tr>
        				<tr class>
        					<th scope="row">휴대전화</th>
        					<td>
          						<select id="orderPhone1" name="orderPhone1" value="010">
          							<option value="010">010</option>
          						</select>
          						-
          						<input id="delPhone2" name="delPhone2" maxlength="4" type="text">
          						-
          						<input id="delPhone3" name="delPhone3" maxlength="4" type="text">
          					</td>
        				</tr>
        			</tbody>
        			<tbody class="delivery">
        				<tr class>
        					<th scope="row">배송메시지</th>
        					<td>
        						<textarea id="delMessage" name="delMessage" cols="70"></textarea>
        					</td>
        				</tr>
        			</tbody>
        	</table>
        </div>
        <div class="orderArea">
        	<div class="title">
        		<h3>추가정보</h3>
        	</div>
        	<div class="orderImpormation">
        		<table border="1" summary>
        			<caption>추가 정보 입력</caption>
        			<colgroup>
        				<col style="width:139px;">
        				<col style="width:auto;">
        			</colgroup>
        			<tbody class="extraImpormation">
        				<tr class="extraRecode">
        					<th scope="row">★주소확인★</th>
        					<td>
        						<input id="addrCheck" name="addrCheck" type="checkbox">
        						<label for="addrCheck">주소확인</label>
        						<br>
        						<span class="addMessage">
        						(상세주소 (동, 호수)를 제대로 기재하셨나요?)
        						<br>
        						주소가 올바르지 않을경우에는 반송위험이 있습니다:(
        					</span>
        					</td>
        				</tr>
        			</tbody>
        		</table>
        	</div>
        </div>
        
        <div class="title">
        	<h3>결제 예정 금액</h3>
        </div>
        <div class="totalArea">
        	<div class="totalTable">
        		<table border="1" summary>
        			<caption>결제 예정 금액</caption>
        			<colgroup>
        				<col style="width:33.33%">
        				<col style="width:33.33%" class>
        				<col style="width:33.33%">
        			</colgroup>
        			<thead>
        				<tr>
        					<th scope="col">
        						<strong>총 주문 금액</strong>
        					</th>
        					<th scope="col" class>
        						<strong>총 할인 + 부가결제 금액</strong>
        					</th>
        					<th scope="col">
        						<strong>총 결제예정 금액</strong>
        					</th>
        				</tr>
        			</thead>
        			<tbody class="center">
        				<tr>
        					<td class="price">
        						<div class="boxText">
        							<strong>
        								<span id="totalPriceView" class="text10">35,900</span>
        								원
        							</strong>
        						</div>
        					</td>
        					<td class="option">
        						<div class="boxText">
        							<strong>-</strong>
        							<strong>
        								<span id="totalSaleView" class="text10">0</span>
        							</strong>
        						</div>
        					</td>
        					<td>
        						<div class="boxText">
        							<strong>=</strong>
        							<strong>
        								<span id="totalView" class="text10">35,900</span>
        								원
        							</strong>
        						</div>
        					</td>
        				</tr>
        			</tbody>
        		</table>
        	</div>
        	<div class="detail">
        		<div class="gMerge">
        			<table border="1" summary>
        				<colgroup>
        					<col style="width:139px">
        					<col style="width:auto">
        				</colgroup>
        				<tbody>
        					<tr class="text20">
        						<th scope="row">
        							<strong>총 할인금액</strong>
        						</th>
        						<td>
        							<strong id="totalAddsaleView">0</strong>
        							원
        						</td>
        					</tr>
        					<tr class="couponSelect">
        						<th scope="row">쿠폰할인</th>
        						<td>
        							<a href="#" id="btnCouponSelect" class="btnSubmit">쿠폰적용</a>
        						</td>
        					</tr>
        				</tbody>
        			</table>
        		</div>
        		
        		<div class="gMerge">
        			<table border="1" summary>
        				<caption>부가결제 내역</caption>
        				<colgroup>
        					<col style="width:139px">
        					<col style="width:auto">
        				</colgroup>
        				<tbody>
        					<tr class="text20">
        						<th scope="row">
        							<strong>총 부가결제금액</strong>
        						</th>
        						<td>
        							<strong id="totalAddplayView">0</strong>
        							원
        						</td>
        					</tr>
        				</tbody>
        				<tbody class="milage">
        					<tr>
        						<th scope="row">적립금</th>
        						<td>
        							<p>
        								<input id="inputMilage" name="inputMilage" type="text">
        								원 (총 사용가능 적립금 :
        								<strong class="txtWarn">0</strong>
        								원)
        							</p>
        							<ul class="info">
        								<li>적립금은 최소 2,500 이상일 때 결제가 가능합니다.</li>
        								<li>최대 사용금액은 제한이 없습니다.</li>
        								<li>1회 구매시 적립금 최대 사용금액은 0원입니다.</li>
        								<li>적립금으로만 결제할 경우, 결제금액이 0으로 보여지는 것은 정상이며 [결제하기] 버튼을 누르면 주문이 완료됩니다.</li>
        							</ul>
        						</td>
        					</tr>
        				</tbody>
        			</table>
        		</div>
        	</div>
        </div>
        
        <div class="baseHelp">
        	<h3>무이자 할부 이용내역</h3>
        	<div class="inner">
        		<ul>
        			<li>무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해 무이자할부가 적용되지 않습니다.</li>
        			<li>무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기 바랍니다.</li>
        		</ul>
        	</div>
        </div>
        
        <div class="baseHelp">
        	<h3>이용안내</h3>
        	<div class="inner">
        		<h4>WindowXP 서비스팩2를 설치하신후 결제가 정상적인 단계로 처리되지 않는경우, 아래의 절차에 따라 해결하시기 바랍니다.</h4>
        		<ol>
        			<li class="item1">안심클릭 결제모듈이 설치되지 않은 경우 ActiveX 수동설치</li>
        			<li class="item2">안심클릭 결제모듈이 설치되지 않은 경우 ActiveX 수동설치</li>
        		</ol>
        		<div class>
        			<h4>아래의 쇼핑몰일 경우에는 모든 브라우저 사용이 가능합니다.</h4>
        			<ol>
        				<li class="item1">KG이니시스, KCP, LG U+를 사용하는 쇼핑몰일 경우</li>
        				<li class="item2">결제가능브라우저 : 크롬,파이어폭스,사파리,오페라 브라우저에서 결제 가능
        				<br>(단, window os 사용자에 한하며 리눅스/mac os 사용자는 사용불가)</li>
        				<li class="item3">최초 결제 시도시에는 플러그인을 추가 설치 후 반드시 브라우저 종료 후 재시작해야만 결제가 가능합니다.
        				<br>(무통장, 휴대폰결제 포함)</li>
        			</ol>
        		</div>
        		<h4>세금계산서 발행 안내</h4>
        		<ol>
        			<li class="item1">부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달 10일까지만 요청하실 수 있습니다.</li>
        			<li class="item2">세금계산서는 사업자만 신청하실 수 있습니다.</li>
        			<li class="item3">배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</li>
        			<li class="item4">[세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스로 사업자등록증사본을 보내셔야 세금계산서 발생이 가능합니다.</li>
        			<li class="item5">[세금계산서 인쇄]버튼을 누르면 발행된 세금계산서를 인쇄하실 수 있습니다.</li>
        		</ol>
        		<h4>부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경안내</h4>
        		<ol>
        			<li class="item1">변경된 부가가치세법에 의거, 2004.7.1 이후 신용카드로 결제하신 주문에 대해서는 세금계산서 발행이 불가하며</li>
        			<li class="item2">신용카드매출전표로 부가가치세 신고를 하셔야 합니다.(부가가치세법 시행령 57조)</li>
        			<li class="item3">상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만 세금계산서 발행이 가능함을 양지하여 주시기 바랍니다.</li>
        		</ol>
        		<h4>현금영수증 이용안내</h4>
        		<ol>
        			<li class="item1">현금영수증은 1원 이상의 현금성거래(무통장입금, 실시간계좌이체, 에스크로, 예치금)에 대해 발행이 됩니다..</li>
        			<li class="item2">현금영수증 발행 금액에는 배송비는 포함되고, 적립금사용액은 포함되지 않습니다.</li>
        			<li class="item3">발행신청 기간제한 현금영수증은 입금확인일로 부터 48시간안에 발행을 해야 합니다.</li>
        			<li class="item4">현금영수증 발행 취소의 경우는 시간 제한이 없습니다. (국세청의 정책에 따라 변경 될 수 있습니다.)</li>
        			<li class="item5">현금영수증이나 세금계산서 중 하나만 발행 가능 합니다..</li>
        		</ol>       		
        	</div>
        </div>
        </div>        
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
</body>
</html>