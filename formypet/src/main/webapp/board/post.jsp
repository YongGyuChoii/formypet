<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%     
    String memId = (String)session.getAttribute("idkey2");   
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file = "/base/icon.jsp" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/base.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <style>
    	h2 {
        font-weight: bold;
    	color: #2b2b2b;
  		font-size: 50px;
    	}
    
        table.table2{
                border-collapse: separate;
                border-spacing: 1px;
                text-align: left;
                line-height: 1.5;
                margin : 30px 10px;
        }
        table.table2 tr {
                 width: 50px;
                 padding: 10px;
                font-weight: bold;
                vertical-align: top;
                border-bottom: 1px solid #ccc;
        }
        table.table2 td {
                 width: 100px;
                 padding: 10px;
                 vertical-align: top;
				border-bottom: 1px solid #ccc;
                 font-size: 14px;
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
    <br/><br/>
    <div class="container" align="center">
    <br/>
		<form name="postFrm" method="post" action="boardPost" enctype="multipart/form-data">
		<div>
		<h2>INQUIRY</h2>
		</div>
        <table  style="padding-top:50px" align=center width=1200 border=0 cellpadding=2 >
                <tr>
                <td bgcolor=white>
                <table class = "table2">         
 	 	                <tr>
 	 	                <hr/>
                        <td>제  목</td>
                        <td><input type="text" name="subject" size=40 maxlength=50></td>
                        </tr> 						              
                    
                        <tr>
                        <td>분  류</td>
                        <td><select name="group" width="390px" onchange="Display(this.form)" ;>
                        <option selected value=0>-선택하세요-
                        <option value=1>[상품] 상품관련 문의</option>
                        <option value=2>[배송] 배송관련 문의</option>
                        <option value=3>[주문취소] 주문취소 문의</option>
                        <option value=4>[주소변경] 주소변경 문의</option>  
                        <option value=5>[반품/환불] 반품/환불 문의</option>        
                        <option value=6>[기타] 기타 문의</option>                                                                                                                    
                        </select>
                        </td>
                        </tr>
 
                        <tr>
                        <td>내  용</td>
                        <td><textarea name="content" type="text" cols=150 rows=15 placeholder="궁금한 점이 있으시다면 문의를 남겨주세요."></textarea></td>
                        </tr>
 							           
           				<tr>
	    	 			<td>파일찾기</td> 
	     				<td><input type="file" name="filename" size="50" maxlength="50"></td>
	    				</tr>
	    				
	 					<tr>
		 				<td>내용타입</td>
		 				<td> HTML<input type=radio name="contentType" value="HTTP" >&nbsp;&nbsp;&nbsp;
		  			 	TEXT<input type=radio name="contentType" value="TEXT" checked>
		  			 	</td>
	 					</tr>
	 	
	 	                <tr>
                        <td>비밀번호</td>
                        <td><input type="password" name="pass" size=20 maxlength=10></td>
                        </tr>
                        
					<tr>
					<td><input type="button" class="btn btn-outline-primary" value="리스트" onClick="javascript:location.href='list.jsp'"></td>
					<td align="right"><input type="button" class="btn btn-outline-primary" value="등록" onClick="javascript:check()"></td>
					</tr>	    				
  
                </table>
                </td>
                </tr>
        </table>
        <input type="hidden" name="memKey" value="<%=memKey%>">
        <input type="hidden" name="name" value="<%=memId%>">
        </form>
        </div>
    <!--main 끝-->

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
<script>

function check() {
    if (document.postFrm.content.value == ""||document.postFrm.pass.value == "" ) {
  alert("모든 문항을 입력해주세요.");
  document.postFrm.content.focus();
  return;
    }
 document.postFrm.submit();
}

function Display(frm) {

    var content = frm.group.selectedIndex;

    switch( content ){
	   case 0:
	     frm.content.value = '';
		 break;
	   case 1:
	     frm.content.value = 
	    	 '문의 내용을 구체적으로 작성해주시면 정확하고 빠른 답변에 도움이 됩니다.\n' +
	    	 '\n' +
	    	 'ㅇ 문의제품 :\n' +
	    	 '\n' +
	    	 'ㅇ 문의사항 :\n' +
	    	 '\n' +
	    	 'ㅇ 기타 :';
		 break;
	   case 2:
	     frm.content.value =
	    	 'formypet은 CJ 대한통운을 통하여 배송을 도와드리고 있으며, 출고 후 수령 받으시기까지 평일 기준 1~3일 정도 소요됩니다.\n' +
	    	 '다만 택배사 물류량 등 운송 사정에 따라 추가적으로 시간이 소요될 수 있는 점 너른 양해 부탁 드립니다.\n' +
	    	 '출고 이후 배송 중인 제품에 대한 문의는 CJ 대한통운 고객센터(1588-1255)로 문의하시면 더욱 정확한 확인이 가능합니다.\n' +
	    	 '문의 내용을 구체적으로 작성해주시면 정확하고 빠른 답변에 도움이 됩니다.\n' +
	    	 '\n' +
	    	 'ㅇ 주문자명 :\n' +
	    	 '\n' +
	    	 'ㅇ 주문번호(or휴대폰번호) :\n' +
	    	 '\n' +
	    	 'ㅇ 문의사항 :\n' +
	    	 '\n' +
	    	 'ㅇ 기타 :';
		 break;
	   case 3:
	     frm.content.value =
	    	 '주문 취소/변경은 제품 출고 전인 오전 9시 30분 까지만 가능합니다.\n' +
	    	 '출고 이후에는 취소 처리가 불가한 점 양해 부탁 드립니다.\n' +
	    	 '최초 구매 사이트에 접속 후 주문 취소 버튼을 통해 직접 취소 신청이 가능합니다.\n' +
	    	 '문의 내용을 구체적으로 작성해주시면 정확하고 빠른 답변에 도움이 됩니다.\n' +
	    	 '\n' +
	    	 'ㅇ 주문자명 :\n' +
	    	 '\n' +
	    	 'ㅇ 주문번호(or휴대폰번호) :\n' +
	    	 '\n' +
	    	 'ㅇ 취소하실 제품명 :\n' +
	    	 '\n' +
	    	 '(전체 취소를 원하실 경우에는 [전체취소] 라고 남겨주세요)\n' +
	    	 '\n' +
	    	 'ㅇ 환불계좌번호, 예금주명, 은행명(가상계좌결제만) :\n' +
	    	 '\n' +
	    	 'ㅇ 기타 :';
		 break;
	   case 4:
	     frm.content.value =
	    	 '주문 취소/변경은 제품 출고 전인 오전 9시 30분 까지만 가능합니다.\n' +
	    	 '출고 이후에는 취소/변경 처리가 불가한 점 양해 부탁 드립니다.\n' +
	    	 '배송 상태가 상품준비중일 경우에만 수령지 변경이 가능하며, 배송준비중 또는 이미 출고된 주문건에 대한 수령지 변경은 불가합니다.\n' +
	    	 '문의 내용을 구체적으로 작성해주시면 정확하고 빠른 답변에 도움이 됩니다.\n' +
	    	 '\n' +
	    	 'ㅇ 주문자명 :\n' +
	    	 '\n' +
	    	 'ㅇ 주문번호(or휴대폰번호) :\n' +
	    	 '\n' +
	    	 'ㅇ 변경 전 주소 :\n' +
	    	 '\n' +
	    	 'ㅇ 변경 후 주소 :\n' +
	    	 '\n' +
	    	 'ㅇ 기타 :';
		 break;
	   case 5:
		   frm.content.value =		   
		   '교환/반품을 원하시는 경우 하단의 교환/반품 신청서를 작성 부탁드립니다.\n' +
		   '> 제품 수령일을 기준으로 7일 이내에 접수 해주셔야 합니다.\n' +
		   '> 미개봉한 새 상품일 경우에만 반품 및 환불이 가능합니다. (제품 사이즈 확인을 위한 하네스 시착은 제외)\n' +
		   '> 반품 후 환불은 수거일로 부터 평일 기준 7일정도 소요될 수 있습니다.\n' +
		   '> 단순변심으로 인한 반품은 반품 택배비가 제외되어 환불됩니다.\n' +
		   '> SET 제품의 경우, 반품 사유가 본사 과실이 아닌 경우 부분취소/부분반품/부분교환이 불가능합니다.\n' +
		   '반품 배송비의 경우, 환불금에서 차감 또는 계좌 입금을 통한 결제만 이루어지고 있으며 제품에 동봉하는 형식은 분실 위험이 다대하여 진행 불가하신 점 참고 부탁드립니다.\n' +
		   '회수 상품에 동봉 후 분실된 택배비에 대한 도움은 드리기 어려우니 이 점 양해 부탁드립니다.\n' +
		   '고객센터 접수 없이 임의로 발송하신 제품이 분실되거나 훼손된 경우에는 책임을 지지 않습니다.\n' +
		   'CJ대한통운 외 다른 택배사 이용 시에는 선불로 결제하셔야하며 추가 금액 또한 고객님께서 부담해주셔야합니다.\n' +
		   '문의 내용을 구체적으로 작성해주시면 정확하고 빠른 답변에 도움이 됩니다.\n' +
	       '\n' +
		   '---------------------[ 교환/반품 신청서 ]--------------------\n' +
	       '\n' +
		   'ㅇ 주문자명 :\n' +
	    	 '\n' +
		   'ㅇ 주문번호(or휴대폰번호) :\n' +
	    	 '\n' +
		   'ㅇ 반품 제품명 :\n' +
	    	 '\n' +
		   'ㅇ 제품 개봉 및 사용 여부:\n' +
	    	 '\n' +
		   '(하네스의 경우 외부착용 및 단상자 소지 여부)\n' +
	    	 '\n' +
		   'ㅇ 반품 사유 :\n' +
	    	 '\n' +
		   'ㅇ 환불계좌번호, 예금주명, 은행명 :\n' +
	    	 '\n' +
		   'ㅇ 기타 :';
			 break;
	   case 6:
		     frm.content.value =
		    	 '문의 내용을 구체적으로 작성해주시면 정확하고 빠른 답변에 도움이 됩니다.\n' +
		    	 '\n' +
		    	 'ㅇ 문의사항 :';
			 break;			 
    }
	
    return true;
}

</script>