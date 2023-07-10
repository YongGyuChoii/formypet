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
        <table class="table-body">
            <h2>상품 관리</h2>
            <thead>
            <tr>
                <th>상품 이름</th>
                <th>상품 번호</th>
                <th>상품 가격</th>
                <th>상품 삭제</th>
                <th>판매 중지</th>
                <th>상품 sold out</th>
        
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>James</td>
                <td>Matman</td>
                <td>(713) 123-8965</td>
                <th><button>상품 삭제</button></th>
                <th><button>판매 중지</button></th>
                <th><button >sold out</button></th>
            </tr>
            <tr>
                <td>Johnny</td>
                <td>Smith</td>
                <td>(713) 584-9614</td>
                <th><button >상품 삭제</button></th>
                <th><button >판매 중지</button></th>
                <th><button >sold out</button></th>
            </tr>
            <tr>
                <td>Susan</td>
                <td>Johnson</td>
                <td>(713) 847-1124</td>
                <th><button >상품 삭제</button></th>
                <th><button >판매 중지</button></th>
                <th><button >sold out</button></th>
            </tr>
            <tr>
                <td>Tracy</td>
                <td>Richardson</td>
                <td>(713) 245-4821</td>
                <th><button >상품 삭제</button></th>
                <th><button >판매 중지</button></th>
                <th><button >sold out</button></th>
            </tr>
            <tr>
                <td>Tracy</td>
                <td>Richardson</td>
                <td>(713) 245-4821</td>
                <th><button >상품 삭제</button></th>
                <th><button >판매 중지</button></th>
                <th><button >sold out</button></th>
            </tr>
            <tr>
                <td>Tracy</td>
                <td>Richardson</td>
                <td>(713) 245-4821</td>
                <th><button >상품 삭제</button></th>
                <th><button >판매 중지</button></th>
                <th><button >sold out</button></th>
            </tr>
            <tr>
                <td>Tracy</td>
                <td>Richardson</td>
                <td>(713) 245-4821</td>
                <th><button >상품 삭제</button></th>
                <th><button >판매 중지</button></th>
                <th><button >sold out</button></th>
            </tr>
            <tr>
                <td>Tracy</td>
                <td>Richardson</td>
                <td>(713) 245-4821</td>
                <th><button >상품 삭제</button></th>
                <th><button >판매 중지</button></th>
                <th><button >sold out</button></th>
            </tr>
            <tr>
                <td>Tracy</td>
                <td>Richardson</td>
                <td>(713) 245-4821</td>
                <th><button >상품 삭제</button></th>
                <th><button >판매 중지</button></th>
                <th><button >sold out</button></th>
            </tr>
            <tr>
                <td>Tracy</td>
                <td>Richardson</td>
                <td>(713) 245-4821</td>
                <th><button>상품 삭제</button></th>
                <th><button>판매 중지</button></th>
                <th><button>sold out</button></th>
            </tr>
            </tbody>
        </table>
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