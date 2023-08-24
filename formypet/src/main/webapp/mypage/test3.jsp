<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
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

        .mypage_menu ul li a:hover,
        .mypage_menu ul li a.active {
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
                    <col style="width:auto;">
                    <col style="width:84px;">
                    <col style="width:80px;">
                    <col style="width:55px;">
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col">분류</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">작성일</th>
                        <th scope="col">조회</th>
                    </tr>
                </thead>
                <tbody class="displaynone center">
                    <tr class="">
                        <td></td>
                        <td><a href="" class="txtEm"></a></td>
                        <td class="left subject"> <a href=""></a> </td>
                        <td></td>
                        <td><span class="txtNum"></span></td>
                        <td><span class="txtNum"></span></td>
                    </tr>
                    <tr class="">
                        <td></td>
                        <td><a href="" class="txtEm"></a></td>
                        <td class="left subject"> <a href=""></a> </td>
                        <td></td>
                        <td><span class="txtNum"></span></td>
                        <td><span class="txtNum"></span></td>
                    </tr>
                </tbody>
            </table>
            <p class="message ">게시물이 없습니다.</p>
        </div>
    </div>


    <form id="boardSearchForm" name="" action="/myshop/board_list.html" method="get" target=""
        enctype="multipart/form-data">
        <input id="board_no" name="board_no" value="" type="hidden">
        <input id="page" name="page" value="1" type="hidden">
        <input id="board_sort" name="board_sort" value="" type="hidden">
        <div class="xans-element- xans-myshop xans-myshop-boardlistsearch ">
            <fieldset class="boardSearch">
                <legend>게시물 검색</legend>
                <p><select id="search_key" name="search_key" fw-filter="" fw-label="" fw-msg="">
                        <option value="subject">제목</option>
                        <option value="content">내용</option>
                        <option value="writer_name">글쓴이</option>
                        <option value="member_id">아이디</option>
                        <option value="nick_name">별명</option>
                    </select> <input id="search" name="search" fw-filter="" fw-label="" fw-msg="" class="inputTypeText"
                        placeholder="" value="" type="text"> <a href="#none" class="btnEmFix"
                        onclick="BOARD.form_submit('boardSearchForm');">찾기</a></p>
            </fieldset>
        </div>
    </form>
    <!-- cre.ma / 내가 작성한 리뷰 / 스크립트를 수정할 경우 연락주세요 (support@cre.ma) -->
    <div class="crema-reviews crema-applied" data-type="my-reviews" style="margin: 0 auto;margin-left: 31px;"><iframe
            id="crema-my-reviews-1" height="0"
            src="https://review6.cre.ma/pethroom.com/my/managing_reviews?iframe_id=crema-my-reviews-1&amp;app=0&amp;parent_url=https%3A%2F%2Fpethroom.com%2Fmyshop%2Fboard_list.html&amp;secure_username=V2820cfca11fbcada8a807728de2649ff6&amp;secure_user_name=V2468e2cc763fdea21b4b7d15017fe2f46&amp;secure_device_token=V29d8f596ef8ab306227973f4b00135aae1738ac37a1d775be14c16395f093e3e7dc0e335dbee4c8b17225d2bebc96b3b1&amp;iframe=1"
            width="100%" scrolling="no" allowtransparency="true" frameborder="0" name="crema-my-reviews-1-1692864150464"
            style="display: block; visibility: visible; height: 276px;"></iframe></div>

    <!-- cre.ma / init 스크립트 (PC) / 스크립트를 수정할 경우 연락주세요 (support@cre.ma) -->
    <script>(function (i, s, o, g, r, a, m) { if (s.getElementById(g)) { return }; a = s.createElement(o), m = s.getElementsByTagName(o)[0]; a.id = g; a.async = 1; a.src = r; m.parentNode.insertBefore(a, m) })(window, document, 'script', 'crema-jssdk', '//widgets.cre.ma/pethroom.com/init.js');</script>
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