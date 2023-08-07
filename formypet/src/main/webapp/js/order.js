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
	$('.totalPrice').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
	
	//배송비 50000원 이상이면 무료
	if(sum >= 50000){
		$('.deliveryPrice').text(0);
		$('.totalRealPrice').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
	}else {
		$('.deliveryPrice').text("3,000");
		var sum2 = sum + 3000;
		$('.totalRealPrice').text(sum2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
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
					$('.totalPrice').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
					
					//배송비 50000원 이상이면 무료
					if(sum >= 50000){
						$('.deliveryPrice').text(0);
						$('.totalRealPrice').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
					}else {
						$('.deliveryPrice').text("3,000");
						var sum2 = sum + 3000;
						$('.totalRealPrice').text(sum2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
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