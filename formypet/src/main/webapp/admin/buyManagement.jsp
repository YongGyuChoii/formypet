<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/adminStyle.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" /> <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" /></head>

</head>
<body>
    <div id="wrap">
    <!-- header 시작-->
    <header>
        <a href="../index.jsp" class="logo">
            <h1>For My Pet</h1>
        </a>
            <div id="navi1">
            <ul class="nav justify-content-end">
                 <li class="nav-item">
                    <a class="nav-link active text-primary" aria-current="page" href="../login/login.jsp">로그인</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link text-primary" href="../mypage/mypage.jsp">마이페이지</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link text-primary" href="../admin/admin.jsp">관리자페이지</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link text-primary" href="../cart/cart.jsp">장바구니</a>
                  </li>
            </ul>
            </div>

            <div id="navi2">
            <div class="p-3 mb-2 bg-primary text-white">
            <nav class="nav">
                <a class="nav-link text-white" aria-current="page" href="../admin/csManagement.jsp">회원 정보 관리</a>
                <a class="nav-link text-white" href="../admin/categoryManagement.jsp">게시물 관리</a>
                <a class="nav-link text-white" href="../admin/expendsManagement.jsp">매출 관리</a>
                <a class="nav-link text-white" href="../admin/productManagement.jsp">상품 관리</a>
                <a class="nav-link text-white" href="../admin/csCenterManagement.jsp">고객 센터 관리</a>
                <a class="nav-link text-white" href="../admin/buyManagement.jsp">구매 및 환불 관리</a>
              </nav>
            </div>
            </div>
      </header>
    <!--header 끝-->
       <!-- table 시작 -->
    <div class="container">
        <section>
            <div>
                <table class="table-body">
                    <h2>구매 및 환불 관리</h2>
                    <thead>
                    <tr>
                        <th>회원/비회원</th>
                        <th>주문번호</th>
                        <th>상품이름</th>
                        <th>배송 상태</th>
                        <th>환불 제목</th>
                        <th>환불 내용</th>
                        <th>환불 날짜</th>
                
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>James</td>
                        <td>Matman</td>
                        <td>(713) 123-8965</td>
                        <td><a href="mailto:jmatman@stewart.com">jmatman@stewart.com</a></td>
                        <td>01/13/1979</td>
                        <td>01/13/1979</td>
                        <td>01/13/1979</td>
                    </tr>
                    <tr>
                        <td>Johnny</td>
                        <td>Smith</td>
                        <td>(713) 584-9614</td>
                        <td><a href="mailto:jsmith@stewart.com">jsmith@stewart.com</a></td>
                        <td>06/09/1971</td>
                        <td>06/09/1971</td>
                        <td>06/09/1971</td>
                    </tr>
                    <tr>
                        <td>Susan</td>
                        <td>Johnson</td>
                        <td>(713) 847-1124</td>
                        <td><a href="mailto:sjohnson@stewart.com">sjohnson@stewart.com</a></td>
                        <td>08/25/1965</td>
                        <td>08/25/1965</td>
                        <td>08/25/1965</td>
                    </tr>
                    <tr>
                        <td>Tracy</td>
                        <td>Richardson</td>
                        <td>(713) 245-4821</td>
                        <td><a href="mailto:trichard@stewart.com">trichard@stewart.com</a></td>
                        <td>03/13/1980</td>
                        <td>03/13/1980</td>
                        <td>03/13/1980</td>
                    </tr>
                    <tr>
                        <td>Tracy</td>
                        <td>Richardson</td>
                        <td>(713) 245-4821</td>
                        <td><a href="mailto:trichard@stewart.com">trichard@stewart.com</a></td>
                        <td>03/13/1980</td>
                        <td>03/13/1980</td>
                        <td>03/13/1980</td>
                    </tr>
                    <tr>
                        <td>Tracy</td>
                        <td>Richardson</td>
                        <td>(713) 245-4821</td>
                        <td><a href="mailto:trichard@stewart.com">trichard@stewart.com</a></td>
                        <td>03/13/1980</td>
                        <td>03/13/1980</td>
                        <td>03/13/1980</td>
                    </tr>
                    <tr>
                        <td>Tracy</td>
                        <td>Richardson</td>
                        <td>(713) 245-4821</td>
                        <td><a href="mailto:trichard@stewart.com">trichard@stewart.com</a></td>
                        <td>03/13/1980</td>
                        <td>03/13/1980</td>
                        <td>03/13/1980</td>
                    </tr>
                    <tr>
                        <td>Tracy</td>
                        <td>Richardson</td>
                        <td>(713) 245-4821</td>
                        <td><a href="mailto:trichard@stewart.com">trichard@stewart.com</a></td>
                        <td>03/13/1980</td>
                        <td>03/13/1980</td>
                        <td>03/13/1980</td>
                    </tr>
                    <tr>
                        <td>Tracy</td>
                        <td>Richardson</td>
                        <td>(713) 245-4821</td>
                        <td><a href="mailto:trichard@stewart.com">trichard@stewart.com</a></td>
                        <td>03/13/1980</td>
                        <td>03/13/1980</td>
                        <td>03/13/1980</td>
                    </tr>
                    <tr>
                        <td>Tracy</td>
                        <td>Richardson</td>
                        <td>(713) 245-4821</td>
                        <td><a href="mailto:trichard@stewart.com">trichard@stewart.com</a></td>
                        <td>03/13/1980</td>
                        <td>03/13/1980</td>
                        <td>03/13/1980</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
    <!--table 끝-->
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