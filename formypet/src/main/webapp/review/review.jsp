<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dog and Cat</title>
    <link rel="stylesheet"  href="../css/review.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<title>������Ÿ������ ���� ��� ��� �����ϱ�</title>
    <script type="text/javascript" src="../js/review.js"></script>
    
</head>
<body>
   
   
    <div id="wrap">

    <!-- header ����-->
    <header>
        <a href="index.html" class="logo">
            <h1>For My Pet</h1>
        </a>
            <div id="navi1">
            <ul class="nav justify-content-end">
                <li class="nav-item">
                  <a class="nav-link active text-primary" aria-current="page" href="#">�α���</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-primary" href="#">����������</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-primary" href="#">��ٱ���</a>
                </li>
            </ul>
            </div>

            <div id="navi2">
            <div class="p-3 mb-2 bg-primary text-white">
            <nav class="nav">
                <a class="nav-link text-white" aria-current="page" href="#">����������</a>
                <a class="nav-link text-white" href="#">��ǰ���</a>
                <a class="nav-link text-white" href="#">������</a>
              </nav>
            </div>
            </div>
      </header>
    <!--header ��-->
   
   
   <!--main ����-->
 
 <div class="wrap">
        <h1>�ı�</h1>
        <form name="reviewform" class="reviewform" method="post" action="/save">
            <input type="hidden" name="rate" id="rate" value="0"/>
            <p class="title_star">������ �̿������ �����ּ���.</p>
     
            <div class="review_rating rating_point">
                <div class="warning_msg">������ ������ �ּ���.</div>
                <div class="rating">
                    <div class="ratefill"></div>
                    <!-- [D] �ش� ������ ���õ� �� �� ���� ������ input������Ʈ�� checked Ŭ���� �߰� -->
                    <input type="checkbox" name="rating" id="rating11" value="1" class="rate_radio" title="1��">
                    <label for="rating11"></label>
                    <input type="checkbox" name="rating" id="rating12" value="2" class="rate_radio" title="2��">
                    <label for="rating12"></label>
                    <input type="checkbox" name="rating" id="rating13" value="3" class="rate_radio" title="3��" >
                    <label for="rating13"></label>
                    <input type="checkbox" name="rating" id="rating14" value="4" class="rate_radio" title="4��">
                    <label for="rating14"></label>
                    <input type="checkbox" name="rating" id="rating15" value="5" class="rate_radio" title="5��">
                    <label for="rating15"></label>
                </div>
            </div>
            
                <div class="review_contents">
                <div class="warning_msg">5�� �̻��� ���� ������ �ۼ��� �ּ���.</div>
                <textarea rows="10" class="review_textarea"></textarea>
            </div>   
            <div class="cmd">
                <input type="button" name="save" id="save" value="���">
            </div>
        </form>
    </div>
  
    <!--main ��-->

    <!-- ������ ���� �ǾƷ� ȭ��ǥ -->
    <div class="rightAside2 rounded-pill">
      <div class="rounded-circle"><a href="#wrap"><span class="material-icons">
        expand_less
        </span></a></div>
      <div class="rounded-circle"><a href="#footer"><span class="material-icons">
        expand_more
        </span></a></div>
    </div>
    <!-- ������ ���� �ǾƷ� ȭ��ǥ �� -->
    
    <!-- footer ����-->
    <footer id="footer">
      <nav>
            <p>Dog And Cat</p>
            <p>tel : 1234-5678 / Email : path@naver.com</p>
            <p>Business License No : 394-81-01000[���������Ȯ��]</p>
            <p>���ֽ� �ϻ걸 �ȴ޷� 184 2��</p>
            <br>
            <p>CEO : Joenseo </p>
      </nav>
    </footer>
    <!-- footer ��.-->
    </div>
</body>
</html>
    