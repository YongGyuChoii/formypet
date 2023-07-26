$(function(){
	
	var count = 0; //class 1개씩 증가하기 위한 변수
	
	// 비어있는 새로운 set 을 만듬
	let setA = new Set();
	let setB = [];
	let html = []; //html 넣을 배열 선언
	
	let setC = new Set();
	let setD = [];
	
	//회원일때 옵션 불러오기
	$(document).on("click",".btnIcon",function(){
		
		//넘길 productKey 찾아옴
		var productKey = $(this).parent().parent().find("input[name='productKey']").val();
		
		$.ajax({
			type : "POST",
			url: "/formypet/product/ProductMainServlet",
			data : { productKey:productKey },
			dataType : "json",
			context: this, //this를 success 안에서 현재 객체를 가르킬 수 있다.
			success : function(data) { // Ajax 목적 : data를 얻기 위함
				for(var i=0; i<data.length; i++){
					//만약 옵션이 없다면 바로 카트에 추가
					if(data[i].oc1 == "" && data[i].oc2 == "" && data[i].oc3 == "" && data[i].oc4 == "" && data[i].oc5 == ""){
						fnCartInsert();
						break;
					}else { //옵션이 있다면
						//셀렉트박스 찾아옴
						var select = $(this).parent().parent().find("select[name='optionSelect"+i+"']");
						select.children('option:not(:first)').remove(); //셀렉트박스 옵션 초기화
						select.removeClass("d-none"); //display block 변경
						
						//셀렉트 하면 append 할 div 초기화
						var optionChoose = $(this).parent().parent().find(".optionChoose");
						optionChoose.empty();
						count=0; //class 초기화
						setA.clear(); //set 초기화
						setC.clear();
						setB = []; //배열초기화
						setD = [];
						html = [];
						
						//빈값이 아니라면 옵션 추가
						if(data[i].oc1 != ""){
							select.append(`<option value='${data[i].oc1}'>${data[i].oc1}</option>`);
						}
						if(data[i].oc2 != ""){
							select.append(`<option value='${data[i].oc2}'>${data[i].oc2}</option>`);
						}
						if(data[i].oc3 != ""){
							select.append(`<option value='${data[i].oc3}'>${data[i].oc3}</option>`);
						}
						if(data[i].oc4 != ""){
							select.append(`<option value='${data[i].oc4}'>${data[i].oc4}</option>`);
						}
						if(data[i].oc5 != ""){
							select.append(`<option value='${data[i].oc5}'>${data[i].oc5}</option>`);
						}
					}
				}	
			},
			errer : function() {
				alert('errer');
			}
		});
	});
	
	//select에 대한 클릭 함수
	$("select[name=optionSelect0]").change(function(){
		//select가 하나일때
		if($(this).val() != "" && $(this).next().css("display") == "none"){
			count=0; // 카운트 초기화
			//셀렉트 하면 append 할 div
			var optionChoose = $(this).parent().parent().parent().find(".optionChoose");
			
			//셀렉트 값 가져오기
			var selectValue = $(this).val();
			if(setA.has(selectValue)){
				alert("이미 추가한 옵션입니다.");
			}else{
				setA.add(selectValue);
			}
			
			setB = Array.from(setA); //set을 array로 변환
			
			//상품 이름 가져오기
			var productName = $(this).parent().parent().parent().children().eq(0).text();
			
			//상품 가격 가져오기
			var salePrice1 = $(this).parent().parent().parent().children().eq(1).val();
			//상품 가격 3자리마다 콤마 찍은 변수
			var salePrice = salePrice1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			//set에 들어있는 값들을 통해 html 배열에 삽입
			for(var i=0; i<setB.length; i++){
				
				//추가할 html코드
				html[i]='';
				html[i] += '<div class="row"><div class="col-6 fw-bold">';
				html[i] += ''+productName+'<br><span class="text-muted optionText'+count+'">'+setB[i]+'</span>';
				html[i] += '</div><div class="col-3 text-end">';
				html[i] += '<span class="material-symbols-outlined align-middle addIcon" style="font-size:20px;">add</span>';
				html[i] += ' <span class="align-middle numberIcon fw-bold">1</span>';
				html[i] += ' <span class="material-symbols-outlined align-middle removeIcon" style="font-size:20px;">remove</span>';
				html[i] += '</div><div class="col-3 text-end text-primary fw-bold align-middle">';
				html[i] += ''+salePrice+'원</div></div><hr />';
				
				count++
				
			}
			//div 초기화 시켜주고
			optionChoose.empty();

			//html 출력
			for(var i=0; i<html.length; i++){
				optionChoose.append(html[i]);
				$(this).find('option:eq(0)').prop('selected',true); //옵션 초깃값 초기화
			}
		}
	});
	
	//두번째 셀렉트옵션
	$("select[name=optionSelect1]").change(function(){
		
		if($(this).val() != ""){
			count=0; // 카운트 초기화
			//optionChoose div 가져오기
			var optionChoose = $(this).parent().parent().parent().find(".optionChoose");
			//첫번째 옵션 셀렉트
			var selectValue0 = $(this).prev().val();
			//셀렉트 값 가져오기
			var selectValue1 = $(this).val();
			
			//select 처음꺼 선택 + 지금 셀렉트 값
			if(setC.has(selectValue0+"/"+selectValue1)){
				alert("이미 추가한 옵션입니다.");
			}else{
				setC.add(selectValue0+"/"+selectValue1);
			}
			
			setD = Array.from(setC); //set을 array로 변환
			
			//상품 이름 가져오기
			var productName = $(this).parent().parent().parent().children().eq(0).text();
			
			//상품 가격 가져오기
			var salePrice1 = $(this).parent().parent().parent().children().eq(1).val();
			//상품 가격 3자리마다 콤마 찍은 변수
			var salePrice = salePrice1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			//set에 들어있는 값들을 통해 html 배열에 삽입
			for(var i=0; i<setD.length; i++){
				
				//추가할 html코드
				html[i]='';
				html[i] += '<div class="row"><div class="col-6 fw-bold">';
				html[i] += ''+productName+'<br><span class="text-muted optionText'+count+'">'+setD[i]+'</span>';
				html[i] += '</div><div class="col-3 text-end">';
				html[i] += '<span class="material-symbols-outlined align-middle addIcon" style="font-size:20px;">add</span>';
				html[i] += ' <span class="align-middle numberIcon fw-bold">1</span>';
				html[i] += ' <span class="material-symbols-outlined align-middle removeIcon" style="font-size:20px;">remove</span>';
				html[i] += '</div><div class="col-3 text-end text-primary fw-bold align-middle">';
				html[i] += ''+salePrice+'원</div></div><hr />';
				
				count++
				
			}
			//div 초기화 시켜주고
			optionChoose.empty();
			//html 출력
			for(var i=0; i<html.length; i++){
				optionChoose.append(html[i]);
			}
		}
	});
	
});

function fnCartInsert(){
	var productKey = $(this).parent().parent().find("input[name='productKey']").val();
	
	$.ajax({
			type : "POST",
			url: "/formypet/cart/CartServlet",
			data : { productKey:productKey, memKey:memKey },
			dataType : "json",
			success : function() { 
				alert("장바구니에 추가되었습니다.");
				
			},
			errer : function() {
				alert('errer');
			}
		});
}
