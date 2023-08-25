<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <div id="contents" style="min-height:317px;">
        <div class="titleArea">
            <h2>MY PAGE</h2>
        </div>
    <div class="mypage_menu">
        <ul>
            <li><a href="../mypage/test1.jsp">My shop</a></li>
            <li><a href="../mypage/test2.jsp" class="active">Order</a></li>
            <li><a href="../mypage/test3.jsp">My Posts</a></li>
        </ul>
    </div>  
        <div class="xans-element- xans-myshop xans-myshop-asyncbenefit mypage_summ ">
        <div class="mem_info">
            <div class="thumb"><img src="//pethroom.com/web/upload/mg_img_charlie_icon.png" alt=""
                    onerror="this.src='//img.echosting.cafe24.com/skin/base/member/img_member_default.gif';"
                    class="myshop_benefit_group_image_tag"></div>

            <div class="xans-element- xans-layout xans-layout-statelogon mem ">
                반가워요,
                <strong><span class="xans-member-var-name">회원</span></strong>
                님
                <br><span>고객님은 <a href="/board/membership.html" class="btn_mem"><strong><span
                                class="xans-member-var-group_name">CHARLIE</span></strong></a> 등급입니다</span>
            </div>

            <div class="gMessage ">
                <div class="" id="sGradeAutoDisplayArea">
                    <p class=" sAutoGradeDisplay"><span class="sNextGroupIconArea displaynone"><img src="" alt=""
                                class="myshop_benefit_next_group_icon_tag"></span><span
                            class="xans-member-var-sGradeIncreasePrice">94,000원</span> 추가 결제 시 <span
                            class="xans-member-var-sNextGrade">ERIC</span> 달성!</p>
                </div>
            </div>
        </div>
        <div class="xans-element- xans-layout xans-layout-statelogon mem_point ">
    
            <div class="item">
                <div class="xans-element- xans-myshop xans-myshop-asyncbankbook it ">적립금
                    <span class="cnt"><a href="/myshop/mileage/historyList.html">
                    <span id="xans_myshop_bankbook_avail_mileage" style="opacity: 1;">0</span></a> 원</span>
                </div>
            </div>
        </div>
    </div>
        <div class="my_title">
            Order
            <p>(최근 3개월 기준)</p>
            <a href="/myshop/order/list.html" class="more">더보기+</a>
        </div>
        <div class="xans-element- xans-myshop xans-myshop-orderstate order_summ ">
            <div class="item">
                <div class="d">
                    <a href="/myshop/order/list.html?order_status=shipped_before" class="count">
                        <span id="xans_myshop_orderstate_shppied_before_count">0</span>
                    </a>
                </div>
                <div class="t">입금전</div>
            </div>
            <div class="item">
                <div class="d">
                    <a href="/myshop/order/list.html?order_status=shipped_standby" class="count">
                        <span id="xans_myshop_orderstate_shppied_standby_count">0</span>
                    </a>
                </div>
                <div class="t">배송준비중</div>
            </div>
            <div class="item">
                <div class="d">
                    <a href="/myshop/order/list.html?order_status=shipped_begin" class="count">
                        <span id="xans_myshop_orderstate_shppied_begin_count">0</span>
                    </a>
                    </div>
                        <div class="t">배송중</div>
                </div>
                <div class="item">
                    <div class="d">
                        <a href="/myshop/order/list.html?order_status=shipped_complate" class="count">
                            <span id="xans_myshop_orderstate_shppied_complate_count">1</span>
                        </a>
                    </div>
                    <div class="t">배송완료</div>
                </div>
                <div class="item last">
                    <ul class="other">

                        <li>취소
                            <span>
                                <a href="/myshop/order/list.html?order_status=order_cancel" class="count">
                                    <span id="xans_myshop_orderstate_order_cancel_count">0</span>
                                </a>
                            </span>
                        </li>
                        <li>교환
                            <span>
                                <a href="/myshop/order/list.html?order_status=order_exchange" class="count">
                                    <span id="xans_myshop_orderstate_order_exchange_count">0</span>
                                </a>
                            </span>
                        </li>
                        <li>반품
                            <span>
                                <a href="/myshop/order/list.html?order_status=order_return" class="count">
                                    <span id="xans_myshop_orderstate_order_return_count">0</span>
                                </a>
                            </span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

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