$(function(){
	
	//상품구매금액 합계 구하기
	var totalPrevPrice = [];
	var sum = 0; //토탈 계산을 위한 변수
	var regex = /[^0-9]/g; //숫자만 추출하기 위한 변수
	var totalPrevPrice2 = $('.totalPrevPrice').get();
	for(var i=0; i<totalPrevPrice2.length; i++){
			totalPrevPrice[i] = parseInt(totalPrevPrice2[i].innerHTML.replace(regex, ""));
			sum += totalPrevPrice[i];
	}
	
	//적립금의 합계 구하기
	var totalPoint = [];
	var point = 0;
	var totalPoint2 = $('.text3').get();
	for(var i=0; i<totalPoint2.length; i++){
			totalPoint[i] = parseInt(totalPoint2[i].innerHTML.replace(regex, ""));
			point += totalPoint[i];
	}
	 	
	$('.totalPrice').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
	$('.totalPointView').text(point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
	
	//배송비 50000원 이상이면 무료
	if(sum >= 50000){
		$('.deliveryPrice').text(0);
		$('.totalRealPrice').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
		$('.totalPriceView').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
		$('.totalView').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
	}else {
		$('.deliveryPrice').text("3,000");
		var sum2 = sum + 3000;
		$('.totalRealPrice').text(sum2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
		$('.totalPriceView').text(sum2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
		$('.totalView').text(sum2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
	}
	
	//체크한 상품의 행 삭제
	$(".btnEm").on('click', function() {
		if($('input:checkbox[name="checkProduct"]:checked').length === 0){
			alert('삭제할 항목이 없습니다.');
		}else {
			if(confirm("정말 삭제하시겠습니까?")){
				$('input:checkbox[name="checkProduct"]:checked').each(function(k,kVal){
					let a = kVal.parentElement.parentElement;
					$(a).remove();
					//상품구매금액 합계 구하기
					var totalPrevPrice = [];
					var sum = 0; //토탈 계산을 위한 변수
					var regex = /[^0-9]/g; //숫자만 추출하기 위한 변수
					var totalPrevPrice2 = $('.totalPrevPrice').get();
					for(var i=0; i<totalPrevPrice2.length; i++){
							totalPrevPrice[i] = parseInt(totalPrevPrice2[i].innerHTML.replace(regex, ""));
							sum += totalPrevPrice[i];
					}
					//적립금의 합계 구하기
					var totalPoint = [];
					var point = 0;
					var totalPoint2 = $('.text3').get();
					for(var i=0; i<totalPoint2.length; i++){
							totalPoint[i] = parseInt(totalPoint2[i].innerHTML.replace(regex, ""));
							point += totalPoint[i];
					}
						
					$('.totalPrice').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
					$('.totalPointView').text(point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
					
					//배송비 50000원 이상이면 무료
					if(sum >= 50000){
						$('.deliveryPrice').text(0);
						$('.totalRealPrice').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
						$('.totalPriceView').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
						$('.totalView').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
					}else {
						$('.deliveryPrice').text("3,000");
						var sum2 = sum + 3000;
						$('.totalRealPrice').text(sum2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
						$('.totalPriceView').text(sum2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
						$('.totalView').text(sum2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
					}
				});
			}
		}
	});
	
	//이메일 셀렉트
	$("select[name=orderEmail3]").change(function(){
		var orderEmail3 = $(this).val();
		var orderEmail2 = $('input[name="orderEmail2"]');
		if(orderEmail3 != ""){
			orderEmail2.val(orderEmail3);
		}
	});
	
	// 회원 구매하기
	var IMP = window.IMP;   // 생략 가능
	IMP.init("imp38383113"); // 예: imp00000000 
	
	$(document).on("click","#btnCouponSelect",function(){
		
		var flag = true; //유효성 검사를 위한 변수
		var regex = /[^0-9]/g; //숫자만 추출하기 위한 변수
		
		var orderName = $("input[name='orderName']").val(); //주문하시는분
		var orderPhone2 = $("input[name='orderPhone2']").val(); //폰2
		var orderPhone3 = $("input[name='orderPhone3']").val(); //폰3
		var orderEmail1 = $("input[name='orderEmail1']").val(); //이메일1
		var orderEmail2 = $("input[name='orderEmail2']").val(); //이메일1
		var delName2 = $("input[name='delName2']").val(); //받으시는분
		var delZipcode1 = $("input[name='delZipcode1']").val(); //우편번호
		var delZipcode2 = $("input[name='delZipcode2']").val(); //주소
		var delZipcode3 = $("input[name='delZipcode3']").val(); //주소2
		var delPhone2 = $("input[name='delPhone2']").val(); //받으시는 폰2
		var delPhone3 = $("input[name='delPhone3']").val(); //받으시는 폰3
		var delMessage = $("textarea[name='delMessage']").val(); //배송메세지
		var inputMilage = $("input[name='inputMilage']").val(); //포인트 사용금액
		var memKey = $("input[name='memKey']").val(); //멤버키
		
		var totalView = $(".totalView").text(); //총 결제금액
		totalView = parseInt(totalView.replace(regex, ""));
		if(inputMilage.trim() != ""){
			totalView = totalView - inputMilage;
		}
		
		//상품키 배열로 담기
		var productKey = new Array();
		$("input[name=productKey]").each(function(index, item){
	    	productKey.push($(item).val());
		});
		//옵션 배열로 담기
		var optionValue = new Array();
		$("input[name='optionValue']").each(function(index, item){
	    	optionValue.push($(item).val());
		});
		//상품 수량 배열 담기
		var oCount = new Array();
		$("input[name='oCount']").each(function(index, item){
	    	oCount.push($(item).val());
		});
		//상품 가격 배열 담기
		var oPrice = new Array();
		$(".totalPrevPrice").each(function(index, item){
	    	oPrice.push($(item).text().replace(regex, ""));
		});
		//적립금 배열 담기
		var oPoint = new Array();
		$(".text3").each(function(index, item){
	    	oPoint.push($(item).text().replace(regex, ""));
		});
		
		//가지고 있는 포인트 가져오기
		var txtWarn2 = $('.txtWarn').text();
		var txtWarn = parseInt(txtWarn2.replace(regex, ""));
		
		//유효성 검사
		var tableBody = $('.tableBody').children().length;
		if(tableBody < 1){ //상품이 하나라도 없을시
			alert('상품이 하나도 없습니다');
			flag=false;
		}
		if(orderName.trim() == ""){ //주문하시는분
			alert('주문 하시는분은 필수 항목입니다');
			$("input[name='orderName']").focus();
			flag=false;
		}
		if(orderPhone2.trim() == ""){ //폰2
			alert('휴대전화는 필수 항목입니다');
			$("input[name='orderPhone2']").focus();
			flag=false;
		}
		if(orderPhone3.trim() == ""){ //폰3
			alert('휴대전화는 필수 항목입니다');
			$("input[name='orderPhone3']").focus();
			flag=false;
		}
		if(orderEmail1.trim() == ""){ //이메일1
			alert('이메일은 필수 항목입니다');
			$("input[name='orderEmail1']").focus();
			flag=false;
		}
		if(orderEmail2.trim() == ""){ //이메일2
			alert('이메일은 필수 항목입니다');
			$("input[name='orderEmail2']").focus();
			flag=false;
		}
		if(delName2.trim() == ""){ //받으시는분
			alert('받으시는분은 필수 항목입니다');
			$("input[name='delName2']").focus();
			flag=false;
		}
		if(delZipcode1.trim() == ""){ //우편번호
			alert('우편번호는 필수 항목입니다');
			$("input[name='delZipcode1']").focus();
			flag=false;
		}
		if(delZipcode2.trim() == ""){ //주소
			alert('주소는 필수 항목입니다');
			$("input[name='delZipcode2']").focus();
			flag=false;
		}
		if(delPhone2.trim() == ""){ //받으시는폰2
			alert('휴대전화는 필수 항목입니다');
			$("input[name='delPhone2']").focus();
			flag=false;
		}
		if(delPhone3.trim() == ""){ //받으시는폰3
			alert('휴대전화는 필수 항목입니다');
			$("input[name='delPhone3']").focus();
			flag=false;
		}
		var checked = $('#addrCheck').is(':checked');
		if(!checked){ //주소확인 체크박스 체크여부
			alert('주소 확인여부 체크를 해주세요');
			$("input[name='addrCheck']").focus();
			flag=false;
		}
		if(inputMilage>0 && inputMilage<2500){ //포인트가 2500원 이상 있어야 사용가능
			alert('포인트는 2,500원 이상 사용 가능합니다.');
			flag=false;
		}
		if(inputMilage>0 && inputMilage > txtWarn){ //가진 포인트보다 사용 포인트가 많을 경우
			alert('포인트가 부족합니다.');
			flag=false;
		}
		if(inputMilage.trim() == ""){
			alert('포인트 사용 안할시 0을 입력해주세요');
			flag=false;
		}
		
		//유효성 검사가 다완료 한다면 결제하기 툴 실행
		if(flag==true){
			
			IMP.request_pay({ // param
	        pg: "html5_inicis",
	        pay_method: "card",
	        merchant_uid: 'merchant_' + new Date().getTime(),
	        name: "ForMyPet",
	        amount: 100,
	        buyer_email: orderEmail1+"@"+orderEmail2,
	        buyer_name: orderName,
	        buyer_tel: "010-"+orderPhone2+"-"+orderPhone3,
	        buyer_addr: delZipcode2+" "+delZipcode3,
	        buyer_postcode: delZipcode1
		    }, function (rsp) { // callback
		        if (rsp.success) {
		              
		            $.ajax({
						type : "POST",
						traditional: true,	// ajax 배열 넘기기 옵션!
						url: "/formypet/order/MemBuyServlet",
						data : {oPoint:oPoint, oPrice:oPrice, oCount:oCount, optionValue:optionValue, productKey:productKey, delName2:delName2, delZipcode1:delZipcode1, delZipcode2:delZipcode2, delZipcode3:delZipcode3, delPhone2:delPhone2, delPhone3:delPhone3, delMessage:delMessage, inputMilage:inputMilage, totalView:totalView, memKey:memKey},
						dataType : "json",
						success : function(data) { 
							window.location.href="/formypet/index.jsp";
						},
						errer : function() {
							alert('errer');
						}
					});
		              
		        } else {
		              
		      	  console.log(rsp);
		              
		        }
		    });
		    
		}
		
    });
	
});

//다음지도 api
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                /*if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
                */

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
	}