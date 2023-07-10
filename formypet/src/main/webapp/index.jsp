<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  </head>
<body>
    <div id="wrap">
    <!-- header 시작-->
    <header>
      <%@include file="/base/header.jsp"%>
    </header>
    <!--header 끝-->
fff
    <!-- 메인시작 -->
  <div class="container">
		<div class="section" id="RF">
			<img class="mainImg" src="images/main/main.jpg" alt="메인강아지">
		</div>
    <!-- 메인 5층 -->
		<div class="section" id="5F">
			<img class="mainImg" src="images/main/bathroom.jpg" alt="목욕">
            <div class="mainImgTitle rounded-pill">5F Bathroom</div>
            <div class="mainContent">
              <div class="mainContent1 mainContent2">
                <p class="fs-3 fw-bold">Bathroom</p>
                <p class="mainText">PETHROOM aims to create a happy bathroom lifestyle.
                  We respect and value healthy companionship between pets and
                  people and we continuously strive to sustain
                  this value through sincere communication.</p>
                <p class="mainText">즐거운 욕실 라이프스타일을 지향합니다.
                  또한 이 가치가 지속 가능하도록 건강한 반려생활을
                  중시하고 배려하며,  
                  반려 동물 및 반려인들과 진정성 있는 소통을 합니다.</p>
              </div>
              <div class="mainContent1">
                <img src="images/solution.jpg" alt="상품">
                <p class="fs-5 fw-bold mt-3">덴탈 솔류션 세트 XS</p>
                <p class="fs-5 fw-bold mt-3"><span class="fs-6 text-decoration-line-through fw-light me-1">31,000원</span>17,900원<a href="#"><span class="material-symbols-outlined ms-5">
                  shopping_bag
                </span></a></p>
                <span class="Best">BEST</span>
              </div>
              <div class="mainContent1">
                <img src="images/solution.jpg" alt="상품">
                <p class="fs-5 fw-bold mt-3">덴탈 솔류션 세트 XS</p>
                <p class="fs-5 fw-bold mt-3"><span class="fs-6 text-decoration-line-through fw-light me-1">31,000원</span>17,900원<a href="#"><span class="material-symbols-outlined ms-5">
                  shopping_bag
                </span></a></p>
                <span class="Best">BEST</span>
              </div>
              <div class="mainContent1">
                <img src="images/solution.jpg" alt="상품">
                <p class="fs-5 fw-bold mt-3">덴탈 솔류션 세트 XS</p>
                <p class="fs-5 fw-bold mt-3"><span class="fs-6 text-decoration-line-through fw-light me-1">31,000원</span>17,900원<a href="#"><span class="material-symbols-outlined ms-5">
                  shopping_bag
                </span></a></p>
                <span class="Best">BEST</span>
              </div>
            </div>
		</div>
    <!-- 메인 5층 끝 -->
		
    <!-- 메인 4층 -->
    <div class="section" id="4F">
			<img class="mainImg" src="images/main/food.jpg" alt="음식">
            <div class="mainImgTitle rounded-pill">4F Food Restaurant</div>
            <div class="mainContent">
              <div class="mainContent1 mainContent2">
                <p class="fs-3 fw-bold">Food Restaurant</p>
                <p class="mainText">Tasty, high in nutrition custom-made
                  pet food to assist keeping your pets healthy
                </p>
                <p class="mainText">아이들의 건강 관리에 도움이 되는 맛있는
                  고영양 기능 맞춤형 펫푸드</p>
              </div>
              <div class="mainContent1">
                <img src="images/solution.jpg" alt="상품">
                <p class="fs-5 fw-bold mt-3">덴탈 솔류션 세트 XS</p>
                <p class="fs-5 fw-bold mt-3"><span class="fs-6 text-decoration-line-through fw-light me-1">31,000원</span>17,900원<a href="#"><span class="material-symbols-outlined ms-5">
                  shopping_bag
                </span></a></p>
                <span class="Best">BEST</span>
              </div>
              <div class="mainContent1">
                <img src="images/solution.jpg" alt="상품">
                <p class="fs-5 fw-bold mt-3">덴탈 솔류션 세트 XS</p>
                <p class="fs-5 fw-bold mt-3"><span class="fs-6 text-decoration-line-through fw-light me-1">31,000원</span>17,900원<a href="#"><span class="material-symbols-outlined ms-5">
                  shopping_bag
                </span></a></p>
                <span class="Best">BEST</span>
              </div>
              <div class="mainContent1">
                <img src="images/solution.jpg" alt="상품">
                <p class="fs-5 fw-bold mt-3">덴탈 솔류션 세트 XS</p>
                <p class="fs-5 fw-bold mt-3"><span class="fs-6 text-decoration-line-through fw-light me-1">31,000원</span>17,900원<a href="#"><span class="material-symbols-outlined ms-5">
                  shopping_bag
                </span></a></p>
                <span class="Best">BEST</span>
              </div>
            </div>
		</div>
    <!-- 메인 4층 끝 -->

    <!-- 메인 3층 -->
    <div class="section" id="3F">
			<img class="mainImg" src="images/main/living.jpg" alt="청소도구">
            <div class="mainImgTitle rounded-pill">3F Living Room</div>
            <div class="mainContent">
              <div class="mainContent1 mainContent2">
                <p class="fs-3 fw-bold">Living Room</p>
                <p class="mainText">The brand color of PETHROOM is set for our children who have 'red-green color blindness', and adds vibrant colors to make the living space of your companion colorful.
                </p>
                <p class="mainText">페스룸의 브랜드 컬러는 '적록 색맹'을 갖고 있는
                  우리 아이들을 위해 정해졌으며
                  톡톡 튀는 컬러를 더해 반려인의 생활공간을
                  다채롭게 만들어냅니다.</p>
              </div>
              <div class="mainContent1">
                <img src="images/solution.jpg" alt="상품">
                <p class="fs-5 fw-bold mt-3">덴탈 솔류션 세트 XS</p>
                <p class="fs-5 fw-bold mt-3"><span class="fs-6 text-decoration-line-through fw-light me-1">31,000원</span>17,900원<a href="#"><span class="material-symbols-outlined ms-5">
                  shopping_bag
                </span></a></p>
                <span class="Best">BEST</span>
              </div>
              <div class="mainContent1">
                <img src="images/solution.jpg" alt="상품">
                <p class="fs-5 fw-bold mt-3">덴탈 솔류션 세트 XS</p>
                <p class="fs-5 fw-bold mt-3"><span class="fs-6 text-decoration-line-through fw-light me-1">31,000원</span>17,900원<a href="#"><span class="material-symbols-outlined ms-5">
                  shopping_bag
                </span></a></p>
                <span class="Best">BEST</span>
              </div>
              <div class="mainContent1">
                <img src="images/solution.jpg" alt="상품">
                <p class="fs-5 fw-bold mt-3">덴탈 솔류션 세트 XS</p>
                <p class="fs-5 fw-bold mt-3"><span class="fs-6 text-decoration-line-through fw-light me-1">31,000원</span>17,900원<a href="#"><span class="material-symbols-outlined ms-5">
                  shopping_bag
                </span></a></p>
                <span class="Best">BEST</span>
              </div>
            </div>
		</div>
    <!-- 메인 3층 끝 -->

    <!-- 메인 2층 -->
    <div class="section" id="2F">
			<img class="mainImg" src="images/main/dress.jpg" alt="드레스룸">
            <div class="mainImgTitle rounded-pill">2F Dress Room</div>
            <div class="mainContent">
              <div class="mainContent1 mainContent2">
                <p class="fs-3 fw-bold">Dress Room</p>
                <p class="mainText">Customized pet fashion brand that satisfies various tastes of pets and people with the five character lineups of the PETHROOM.
                </p>
                <p class="mainText">페스룸만의 5가지 캐릭터 라인업으로 반려인과 반려 동물의 다양한 취향을 만족시키는 맞춤형 펫패션 브랜드</p>
              </div>
              <div class="mainContent1">
                <img src="images/solution.jpg" alt="상품">
                <p class="fs-5 fw-bold mt-3">덴탈 솔류션 세트 XS</p>
                <p class="fs-5 fw-bold mt-3"><span class="fs-6 text-decoration-line-through fw-light me-1">31,000원</span>17,900원<a href="#"><span class="material-symbols-outlined ms-5">
                  shopping_bag
                </span></a></p>
                <span class="Best">BEST</span>
              </div>
              <div class="mainContent1">
                <img src="images/solution.jpg" alt="상품">
                <p class="fs-5 fw-bold mt-3">덴탈 솔류션 세트 XS</p>
                <p class="fs-5 fw-bold mt-3"><span class="fs-6 text-decoration-line-through fw-light me-1">31,000원</span>17,900원<a href="#"><span class="material-symbols-outlined ms-5">
                  shopping_bag
                </span></a></p>
                <span class="Best">BEST</span>
              </div>
              <div class="mainContent1">
                <img src="images/solution.jpg" alt="상품">
                <p class="fs-5 fw-bold mt-3">덴탈 솔류션 세트 XS</p>
                <p class="fs-5 fw-bold mt-3"><span class="fs-6 text-decoration-line-through fw-light me-1">31,000원</span>17,900원<a href="#"><span class="material-symbols-outlined ms-5">
                  shopping_bag
                </span></a></p>
                <span class="Best">BEST</span>
              </div>
            </div>
		</div>
    <!-- 메인 2층 끝 -->

    <!-- 메인 1층 -->
    <div class="section" id="1F">
			<img class="mainImg" src="images/main/play.jpg" alt="플레이룸">
            <div class="mainImgTitle rounded-pill">1F Play Room</div>
            <div class="mainContent">
              <div class="mainContent1 mainContent2">
                <p class="fs-3 fw-bold">Play Room</p>
                <p class="mainText">Through various collaborations,
                  PETHROOM provides great products
                  and services to our customers.
                </p>
                <p class="mainText">페스룸은 다양한 협업을 통해 고객님들께
                  멋진 제품과 서비스를 선보입니다</p>
              </div>
              <div class="mainContent1">
                <img src="images/solution.jpg" alt="상품">
                <p class="fs-5 fw-bold mt-3">덴탈 솔류션 세트 XS</p>
                <p class="fs-5 fw-bold mt-3"><span class="fs-6 text-decoration-line-through fw-light me-1">31,000원</span>17,900원<a href="#"><span class="material-symbols-outlined ms-5">
                  shopping_bag
                </span></a></p>
                <span class="Best">BEST</span>
              </div>
              <div class="mainContent1">
                <img src="images/solution.jpg" alt="상품">
                <p class="fs-5 fw-bold mt-3">덴탈 솔류션 세트 XS</p>
                <p class="fs-5 fw-bold mt-3"><span class="fs-6 text-decoration-line-through fw-light me-1">31,000원</span>17,900원<a href="#"><span class="material-symbols-outlined ms-5">
                  shopping_bag
                </span></a></p>
                <span class="Best">BEST</span>
              </div>
              <div class="mainContent1">
                <img src="images/solution.jpg" alt="상품">
                <p class="fs-5 fw-bold mt-3">덴탈 솔류션 세트 XS</p>
                <p class="fs-5 fw-bold mt-3"><span class="fs-6 text-decoration-line-through fw-light me-1">31,000원</span>17,900원<a href="#"><span class="material-symbols-outlined ms-5">
                  shopping_bag
                </span></a></p>
                <span class="Best">BEST</span>
              </div>
            </div>
		</div>
    <!-- 메인 1층 끝 -->
	</div>
    <!-- 메인끝 -->

    <!-- 오른쪽 사이드바    -->
    <div class="rightAside rounded-pill">
        <div class="rightNumber rounded-circle"><a href="#RF">R</a></div>
        <div class="rightNumber rounded-circle"><a href="#5F">5F</a></div>
        <div class="rightNumber rounded-circle"><a href="#4F">4F</a></div>
        <div class="rightNumber rounded-circle"><a href="#3F">3F</a></div>
        <div class="rightNumber rounded-circle"><a href="#2F">2F</a></div>
        <div class="rightNumber rounded-circle"><a href="#1F">1F</a></div>
    </div>
    <!-- 오른쪽 맨위 맨아래 화살표 -->
    <%@include file="/base/rightAside.jsp"%>

    <!-- footer 시작-->
    <footer id="footer">
      	<%@include file="/base/footer.jsp"%>
    </footer>
    <!-- footer 끝.-->
    </div>
</body>
</html>