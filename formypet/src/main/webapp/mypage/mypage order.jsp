<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="order.OrderBean"%>
<%@page import="product.ProductBean"%>
<%@page import="product.ProductFileBean"%>
<%@page import="product.ProductOptionBean"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.*"%>
 <jsp:useBean id="orderMgr" class="order.myOrderMgr" />
<jsp:useBean id="pMgr" class="product.ProductMgr" />
<jsp:useBean id="bMgr" class="product.ProductDetailMgr" />
<!DOCTYPE html>
<html lang="ko">
<%
request.setCharacterEncoding("UTF-8");

int totalRecord=0; //전체레코드수
int numPerPage=1; // 페이지당 레코드 수 
int pagePerBlock=5; //블럭당 페이지수 

int totalPage=0; //전체 페이지 수
int totalBlock=0;  //전체 블럭수 

int nowPage=1; // 현재페이지
int nowBlock=1;  //현재블럭

//데이터베이스 에서 select문 으로 게시물 조회시 limit절 을 통해 한 페이지에 필요한 만큼의 게시물을 가져오기 위해서
//start 와 end 변수 선언. start=0 , end=10 이므로 게시판 한 페이지에 총 10개의 게시물을 출력 한다.
int start=0; //디비의 select 시작번호
int end=1; //시작번호로 부터 가져올 select 갯수

int listSize=0; //현재 읽어온 게시물의 수 

//ProductManagementBean 클래스를 참조한 return 타입으로 vector배열 vlist 선언
Vector<OrderBean> vlist = null; //product db


if (request.getParameter("nowPage") != null) {
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}

start = (nowPage * numPerPage)-numPerPage;
end = numPerPage;

//ProductManagementMgr 클래스 getTotalCount 메서드 호출하여 총 게시물 수 가져오기.
totalRecord = orderMgr.getTotalCount();

//전체 페이지수 계산, 122개의 레코드(게시물)가 있다면 122/10 을 연산하여, Math클래스의 ceil() 메서드로  
//결과값의 소숫점을 반올림 하여 페이지를 구성.
totalPage = (int)Math.ceil((double)totalRecord / numPerPage);  //전체페이지수
nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock); //현재블럭 계산

//전체 블록 계산, 방법은 전체 페이지수 계산법과 동일.
totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);  //전체블럭계산
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/base.css">
 	<link rel="stylesheet"  href="../css/test1.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/ForMyPet_icon1.png" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
function pageing(page) {
	document.readFrm.nowPage.value = page;
	document.readFrm.submit();
}

function block(value){
	 document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1;
	 document.readFrm.submit();
} 
</script>
<style type="text/css">
        .mypage_menu {
            text-align: center;
            margin: 0 0 50px 0;
        }

        .mypage_menu ul {}

        .mypage_menu ul li {
            display: inline-block;
            margin: 0 20px;
        }

        .mypage_menu ul li a {
            color: #868686;
            font-size: 20px;
            line-height: 1.1;
            font-family: 'Frutiger LT Pro 75 Black';
            display: inline-block;
            border-bottom: 2px solid transparent;
        }

        :.mypage_menu ul li a:hover,
        :.mypage_menu ul li a.active {
            color: #2b2b2b;
            border-bottom: 2px solid #2b2b2b;
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

    <!--main 시작-->
<div id="contents" style="min-height: 317px;">
    <div class="titleArea">
        <h2>ORDER</h2>
    </div>
    <div class="mypage_menu">
        <ul>
            <li><a href="../mypage/test1.jsp">My shop</a></li>
            <li><a href="../mypage/test2.jsp" class="active">Order</a></li>
            <li><a href="../mypage/test3.jsp">My Posts</a></li>
        </ul>
    </div>

    <script type="text/javascript">
        $('.mypage_menu [href="' + location.pathname + location.search + '"]').addClass('active');
    </script>

    <script type="text/javascript">
        $('.mypage_menu [href="/mypage/list.jsp"]').addClass('active');
    </script>


    <div class="xans-element- xans-myshop xans-myshop-orderhistorytab ec-base-tab ">
        <ul class="menu">
            <li class="tab_class selected"><a
                    href="/myshop/order/list.html?history_start_date=2023-05-26&amp;history_end_date=2023-08-24&amp;past_year=2022">주문내역조회
                    (<span id="xans_myshop_total_orders">1</span>)</a></li>
            <li class="tab_class_cs"><a
                    href="/myshop/order/list.html?mode=cs&amp;history_start_date=2023-05-26&amp;history_end_date=2023-08-24&amp;past_year=2022">취소/반품/교환
                    내역 (<span id="xans_myshop_total_orders_cs">0</span>)</a></li>
            <li class="tab_class_old displaynone"><a
                    href="/myshop/order/list_old.html?mode=old&amp;history_start_date=2023-05-26&amp;history_end_date=2023-08-24&amp;past_year=2022">이전
                    주문내역 (<span id="xans_myshop_total_orders_old">0</span>)</a></li>
        </ul>
    </div>

    <form method="GET" id="OrderHistoryForm" name="OrderHistoryForm">
        <div class="xans-element- xans-myshop xans-myshop-orderhistoryhead ">
            <fieldset class="ec-base-box">
                <legend>검색기간설정</legend>
                <div class="stateSelect ">
                    <select id="order_status" name="order_status" class="fSelect">
                        <option value="all">전체 주문처리상태</option>
                        <option value="shipped_before">입금전</option>
                        <option value="shipped_standby">배송준비중</option>
                        <option value="shipped_begin">배송중</option>
                        <option value="shipped_complate">배송완료</option>
                        <option value="order_cancel">취소</option>
                        <option value="order_exchange">교환</option>
                        <option value="order_return">반품</option>
                    </select>
                </div>
                <span class="period">
                    <a href="#none" class="btnNormal" days="00"><img
                            src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1.gif"
                            offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1.gif"
                            onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1_on.gif" alt="오늘"></a>
                    <a href="#none" class="btnNormal" days="07"><img
                            src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2.gif"
                            offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2.gif"
                            onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2_on.gif" alt="1주일"></a>
                    <a href="#none" class="btnNormal" days="30"><img
                            src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3.gif"
                            offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3.gif"
                            onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3_on.gif" alt="1개월"></a>
                    <a href="#none" class="btnNormal" days="90"><img
                            src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4.gif"
                            offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4.gif"
                            onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4_on.gif" alt="3개월"></a>
                    <a href="#none" class="btnNormal" days="180"><img
                            src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5.gif"
                            offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5.gif"
                            onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5_on.gif" alt="6개월"></a>
                </span>
                <input id="history_start_date" name="history_start_date" class="fText hasDatepicker" readonly="readonly"
                    size="10" value="2023-05-26" type="text"><button type="button" class="ui-datepicker-trigger"><img
                        src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif" alt="..."
                        title="..."></button> ~ <input id="history_end_date" name="history_end_date"
                    class="fText hasDatepicker" readonly="readonly" size="10" value="2023-08-24" type="text"><button
                    type="button" class="ui-datepicker-trigger"><img
                        src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif" alt="..."
                        title="..."></button> <input alt="조회" id="order_search_btn" type="image"
                    src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/btn_search.gif">
            </fieldset>
            <ul>
                <li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
                <li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
                <li class="">취소/교환/반품 신청은 주문 완료일 기준 14일까지 가능합니다.</li>
            </ul>
        </div>
        <input id="mode" name="mode" value="" type="hidden">
        <input id="term" name="term" value="" type="hidden">
    </form>
    <div class="xans-element- xans-myshop xans-myshop-orderhistorylistitem ec-base-table typeList"><!--
            $login_url = /member/login.html
        -->
        <div class="title">
            <h3>주문 상품 정보</h3>
        </div>
        <table border="1" summary="">
            <caption>주문 상품 정보</caption>
            <colgroup>
                <col style="width:135px;">
                <col style="width:93px;">
                <col style="width:auto;">
                <col style="width:61px;">
                <col style="width:111px;">
                <col style="width:111px;">
                <col style="width:111px;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">주문일자<br>[주문번호]</th>
                    <th scope="col">이미지</th>
                    <th scope="col">상품정보</th>
                    <th scope="col">수량</th>
                    <th scope="col">상품구매금액</th>
                    <th scope="col">주문처리상태</th>
                    <th scope="col">취소/교환/반품</th>
                </tr>
            </thead>
            <tbody class="center ">
                <tr class="xans-record-">
                
                	<% 
		
	Vector<OrderBean> vlist1 = null;

	vlist1 = orderMgr.getOrderList(start,end);
	
	for(int i=0; i<vlist1.size(); i++) {
		
		OrderBean bean = vlist1.get(i);
		
		              
		String img = bean.getProductImg(); 
		String product = bean.getProductName();		//상품				
		String optionValue = bean.getOptionValue(); //옵션
		String pDate = bean.getpDate(); //날짜
		String memOrder=bean.getMemOrderKey(); //주문 번호
		int productPrice = bean.getProductPrice();		// 가격	
		int oCount = bean.getoCount();  //수량
		
		System.out.println("mypageorder.jsp 이미지 변수 값" + img);
		
		
	%>		
                
                    <td class="number ">
                       <%=pDate%> <p><a
                                href="detail.html?order_id=20230614-0014129&amp;page=1&amp;history_start_date=2023-05-26&amp;history_end_date=2023-08-24"
                                class="line"><%=memOrder%></a></p>
                        <a href="#none" class="btnNormal displaynone"
                            onclick="OrderHistory.orderCancel('20230614-0014129')">주문취소</a>
                        <a href="cancel.html?order_id=20230614-0014129" class="btnNormal displaynone">취소신청</a>
                        <a href="exchange.html?order_id=20230614-0014129" class="btnNormal displaynone">교환신청</a>
                        <a href="return.html?order_id=20230614-0014129" class="btnNormal displaynone">반품신청</a>
                    </td>
                    <td class="thumb"><a href="/product/detail.html?product_no=266&amp;cate_no=209"><img
                                src=../images/myorder/<%=img%>
                                onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';" alt=""></a>
                    </td>
                    <td class="product left top">
                        <strong class="name"><a href="/product/퓨어-튜나-스틱-참치참치연어참치닭가슴살/266/category/209/"
                                class="ec-product-name"><%=product%></a></strong>
                        <div class="option "><%=optionValue%></div>
                        <p class="gBlank5 displaynone">무이자할부 상품</p>
                    </td>
                    <td><%=oCount%>개</td>
                    <td class="right">
                        <strong><%=productPrice%>원</strong>
                        <div class="displaynone"></div>
                    </td>
                    <td class="state">
                        <p class="txtEm">배송완료</p>
                        <p class=""><a
                                href="/common/delivery_trace.php?is12RFront=T&amp;order_id=20230614-0014129&amp;invoice_no=575579603293&amp;product_no=266&amp;opt_id=000B&amp;is_second_delivery=F"
                                target="_blank">CJ대한통운</a></p>
                        <p class=""><a href="#none" class="line"
                                onclick="window.open('/common/delivery_trace.php?is12RFront=T&amp;order_id=20230614-0014129&amp;invoice_no=575579603293&amp;product_no=266&amp;opt_id=000B&amp;is_second_delivery=F', '', 'scrollbars=yes, resizeable=0, status=0, directories=0, toolbar=0'); return false;">[575579603293]</a>
                        </p>
                        <a href="#" class="btnSubmit  crema-new-review-link crema-applied"
                            data-cafe24-product-link="?board_no=4&amp;product_no=266&amp;order_id=20230614-0014129"
                            data-product-code="266" data-order-code="20230614-0014129"> <%if(bean.getReviewYn().equals("N")){ %>
	<button type="button" class="n-btn btn-sm btn-accent" onclick="location.href='${pageContext.request.contextPath}/review/review.jsp?ordersKey=<%=bean.getOrdersKey()%>'">후기작성</button> <!-- test code -->	
		<%} %>	</a>
                        <a href="#none" class="btnNormal displaynone"
                            onclick="OrderHistory.withdraw('C','20230614-0014129|266|000B|3985574','F', 'F', 'F', '' , '')">취소철회</a>
                        <a href="#none" class="btnNormal displaynone"
                            onclick="OrderHistory.withdraw('E','20230614-0014129|266|000B|3985574','F', 'F', 'F', '' , '')">교환철회</a>
                        <a href="#none" class="btnNormal displaynone"
                            onclick="OrderHistory.withdraw('R','20230614-0014129|266|000B|3985574','F', 'F', 'F', '' , '')">반품철회</a>
                    </td>
                    <td>
                        <p class="displaynone"><a href="#none" class="btnNormal"
                                onclick="OrderHistory.getDetailInfo('?product_no=266&amp;cate_no=209&amp;order_id=20230614-0014129&amp;ord_item_code=20230614-0014129-01');">상세정보</a>
                        </p>
                        <p class="">-</p>
                    </td>                     
                    
                    
                     <% } %>             

                </tr>          
                <tr>
            	<td>
				<%
	   				  int pageStart = (nowBlock -1)*pagePerBlock + 1 ; //하단 페이지 시작번호
	   				  int pageEnd = ((pageStart + pagePerBlock ) <= totalPage) ?  (pageStart + pagePerBlock): totalPage+1; 
	   				  //하단 페이지 끝번호
	   				  if(totalPage !=0){
	    			  	if (nowBlock > 1) {%>
	    			  		<a href="javascript:block('<%=nowBlock-1%>')">prev...</a><%}%>&nbsp; 
	    			  		<%for ( ; pageStart < pageEnd; pageStart++){%>
	     			     	<a href="javascript:pageing('<%=pageStart %>')"> 
	     					<%if(pageStart==nowPage) {%><font color="blue"> <%}%>
	     					[<%=pageStart %>] 
	     					<%if(pageStart==nowPage) {%></font> <%}%></a> 
	    					<%}//for%>&nbsp; 
	    					<%if (totalBlock > nowBlock ) {%>
	    					<a href="javascript:block('<%=nowBlock+1%>')">.....next</a>
	    			<%}%>&nbsp;  
	   			<%}%>
	   			</td>	
	   			</tr>
            </tbody>
	
        </table>
        <p class="message displaynone">주문 내역이 없습니다.</p>
    </div>

    				<!-- 페이징 및 블럭 처리 Start--> 

	   		<form name="readFrm" method="get">
				<input type="hidden" name="ordersKey"> 
				<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
			</form>	 			<!-- 페이징 및 블럭 처리 End-->

    <!-- cre.ma / init 스크립트 (PC) / 스크립트를 수정할 경우 연락주세요 (support@cre.ma) -->
  <!--     <script>(function (i, s, o, g, r, a, m) { if (s.getElementById(g)) { return }; a = s.createElement(o), m = s.getElementsByTagName(o)[0]; a.id = g; a.async = 1; a.src = r; m.parentNode.insertBefore(a, m) })(window, document, 'script', 'crema-jssdk', '//widgets.cre.ma/pethroom.com/init.js');</script> -->
</div>


    <!--main 끝-->

    <!-- 오른쪽 맨위 맨아래 화살표 -->
    <%@include file="/base/rightAside.jsp" %>
        <!-- 오른쪽 맨위 맨아래 화살표 끝 -->

        <!-- footer 시작-->
        <footer id="footer">
            <%@include file="/base/footer.jsp" %>
        </footer>
        <!-- footer 끝.-->
        </div>
</body>

</html>
