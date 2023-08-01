<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/expends1.css">
    <link rel="stylesheet"  href="../css/base.css">
    <link rel="stylesheet"  href="../css/adminStyle.css">
   	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<!-- header 시작-->
    <header>
        <%@include file="../admin/adminHeader.jsp"%>
      </header>
    <!--header 끝-->
<div align="center" id = "wrap">
	<main>
		<section>
  			<div class="today">
  				<span>
  					<span>오늘 매출</span>
  					<span id="today"></span>
  				</span>
  				
  				<button>상세보기</button>
  				
  			</div>
  			
  		</section>
  		
		<section class="detail today_detail">
  			<div>
				<h3 class="sales_today_detail_title">
					<span>매출 상세</span>
					<span>
						<button class="sort_name reverse">이름순</button>
						<button class="sort_price reverse">가격순</button>
					</span>
				</h3>
				
  				<div class="sales_today_detail">
  					<div>메뉴</div>
  					<div>수량</div>
  					<div>가격</div>
  				</div>
  			</div>
  		</section>
	
	
		<section class="graph_section" onselectstart="return false;" > 
			<div class="box">
				<button class="year_btn">연 매출</button>
				<button class="month_btn">이번 달 매출</button>
				<button class="week_btn">이번 주 매출</button>
				<input type="month"name="date" id="date">
				<button class="other_month_search">검색</button>
			
				<h1>1월 총 합계</h1>
				
				<div>(단위 : 만원)</div>
				<div class="graph_box">
					<ul>
					<!-- 
						<li>
							<span class="sales"></span>
							<div class="graph"></div>
							<span class="graph_date"></span>
						</li>
						 -->
					</ul>
				
					<div class="graph_background">
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
					</div>
				</div>
			
			</div>
		</section>
		
		<section class="detail other_detail">
  			<div>
  				<h3 class="sales_today_detail_title">
  					<span id="other_detail_date"></span>
  					<span>
						<button class="sort_name reverse">이름순</button>
						<button class="sort_price reverse">가격순</button>
					</span>
  				</h3>
  				<div class="sales_today_detail">
  					<!-- <div>메뉴</div>
  					<div>수량</div>
  					<div>가격</div> -->
  				</div>
  			</div>
  		</section>
  		
	</main>

 <!-- 오른쪽 맨위 맨아래 화살표 -->
    <%@include file="/base/rightAside.jsp"%>
    <!-- 오른쪽 맨위 맨아래 화살표 끝 -->
    
    <!-- footer 시작-->
    <footer id="footer">
      <%@include file="/base/footer.jsp"%>
    </footer>   
    <!-- footer 끝.-->
</div>
<script src="../js/expends.js"></script>
<script src="/js/admin/sales.js"></script> 
 
 
</body>
</html>
