<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="order.OrderBean"%>
<%@page import="product.ProductBean"%>
<%@page import="product.ProductFileBean"%>
<%@page import="product.ProductOptionBean"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.*"%>
<%@page import="review.ReviewBean"%>
 <jsp:useBean id="rvMgr" class="review.ReviewMgr" />
 <jsp:useBean id="orderMgr" class="order.myOrderMgr" />
<jsp:useBean id="pMgr" class="product.ProductMgr" />
<jsp:useBean id="bMgr" class="product.ProductDetailMgr" />
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

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/ForMyPet_icon1.png" />
    <link rel="stylesheet"  href="../css/base.css">
 	<link rel="stylesheet"  href="../css/test1.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
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
        <h2>MY POSTS</h2>
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



    <div class="xans-element- xans-myshop xans-myshop-boardpackage ">
        <div class="xans-element- xans-myshop xans-myshop-boardlisthead ">
            <p>분류 선택 <select id="board_sort" name="board_sort" fw-filter="" fw-label="" fw-msg=""
                    onchange="BOARD.change_sort('boardSearchForm', this);">
                    <option value="D">작성 일자별</option>
                    <option value="C">분류별</option>
                </select></p>
        </div>
        <div class="xans-element- xans-myshop xans-myshop-boardlist ec-base-table typeList gBorder gBlank10"><!--
                $count = 10
                $relation_post = yes
            -->
            <table border="1" summary="">
                <caption>게시물 관리 목록</caption>
                <colgroup
                    class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
                    <col style="width:70px;">
                    <col style="width:135px;">
                    <col style="width:84px;">
                    <col style="width:auto;">
                    <col style="width:80px;">
                   
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col">분류</th>
                        <th scope="col">제목</th>
                        <th scope="col">내용</th>
                        <th scope="col">별점</th>
                      
                    </tr>
                </thead>
               
            </table>
            
             <% 
	Vector<ReviewBean> vlist1 = null;

	vlist1 = rvMgr.getReviewList();
	
	for(int i=0; i<vlist1.size(); i++) {
		
		ReviewBean bean = vlist1.get(i);
		
		int num = bean.getRvKey();
		String rvTitle = bean.getRvTitle();
		String rvContents = bean.getRvContents();
		int rvScore = bean.getRvScore();
		String product = bean.getProductName();		//상품	
		
		
	%>
	<table border="1" summary="">
	  <colgroup
                    class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
                    <col style="width:70px;">
                    <col style="width:135px;">
                    <col style="width:84px;">
                    <col style="width:auto;">
                    <col style="width:80px;">
                   
                </colgroup>
	  <tr>
                 <th><%=num%>번</th>
                   <th><%=product %></th>
                   <th><%=rvTitle %></th>
                    <th><a><%=rvContents%><a></th>
                     <th><%=rvScore%>점</th>
                
 
          </table>   
           
          <% } %>
	
	
	
	</div>
        </div>
    </div>


    
     <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
     
     
     
    
          
            
            

    <!-- cre.ma / init 스크립트 (PC) / 스크립트를 수정할 경우 연락주세요 (support@cre.ma) -->
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