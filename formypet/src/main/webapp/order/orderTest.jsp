<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
   	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="../js/order.js"></script>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script>
	  var IMP = window.IMP;   // 생략 가능
	  IMP.init("imp38383113"); // 예: imp00000000 
	  
	  $(document).on("click",".btnnn",function(){
		  IMP.request_pay({ // param
	          pg: "html5_inicis",
	          pay_method: "card",
	          merchant_uid: 'merchant_' + new Date().getTime(),
	          name: "노르웨이 회전 의자, 노르웨이 회전 의자",
	          amount: 64000,
	          buyer_email: "gildong@gmail.com",
	          buyer_name: "홍길동",
	          buyer_tel: "010-4242-4242",
	          buyer_addr: "서울특별시 강남구 신사동",
	          buyer_postcode: "0112281"
	      }, function (rsp) { // callback
	          if (rsp.success) {
	              
	              console.log(rsp);
	              
	          } else {
	              
	        	  console.log(rsp);
	              
	          }
	      });
	  });
	</script>
</head>
<body>
	<button type="button" class="btnnn">클릭클릭</button>
</body>
</html>
