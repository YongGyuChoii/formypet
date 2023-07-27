$(function(){
	
	var count = 0; //class 1개씩 증가하기 위한 변수
	
	// 비어있는 새로운 set 을 만듬
	let setA = new Set();
	let setB = [];
	let html = []; //html 넣을 배열 선언
	
	let setC = new Set();
	let setD = [];
	
	//옵션 불러오기
	$(document).on("click",".btnIcon",function(){
		
		//넘길 productKey 찾아옴
		var productKey = $(this).parent().parent().find("input[name='productKey']").val();
		//멤버키
		var memKey = $(this).parent().parent().find("input[name='memKey']").val();
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
						fnCartInsert(productKey,memKey);
						break;
					}else { //옵션이 있다면
						//셀렉트박스 찾아옴
						var select = $(this).parent().parent().find("select[name='optionSelect"+i+"']");
						select.children('option:not(:first)').remove(); //셀렉트박스 옵션 초기화
						select.removeClass("d-none"); //display block 변경
						select.attr("disabled",true); //전체셀렉트 disabled
						
						//셀렉트 하면 append 할 div 초기화
						var optionChoose = $(this).parent().parent().find(".optionChoose");
						optionChoose.empty();
						count=0; //class 초기화
						setA.clear(); //set 초기화
						setC.clear();
						setB = []; //배열초기화
						setD = [];
						html = [];
						
						//토탈 가격, 갯수 초기화
						$(this).parent().parent().parent().find('.totalPrice').text(0);
						$(this).parent().parent().parent().find('.totalCount').text(0);
						
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
					var optionSelect0 = $(this).parent().parent().find("select[name='optionSelect0']");
					optionSelect0.removeAttr("disabled"); //셀렉트 첫번째 disabled 삭제
			},
			errer : function() {
				alert('errer');
			}
		});
	});
	
	//select에 대한 클릭 함수
	$("select[name=optionSelect0]").change(function(){
		//다음 셀렉트 disabled 없애기
		$(this).next().removeAttr("disabled");
		
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
				html[i] += '<span class="salePrice">'+salePrice+'</span>원</div></div><hr />';
				
				count++
				
			}
			//div 초기화 시켜주고
			optionChoose.empty();

			//html 출력
			for(var i=0; i<html.length; i++){
				optionChoose.append(html[i]);
				$(this).find('option:eq(0)').prop('selected',true); //옵션 초깃값 초기화
			}
			
			//전체 가격, 갯수 부분
			var totalPrice = 0;
			var totalCount = 0;
			var productSalePrice = $(this).parent().parent().parent().find("input[name='productSalePrice']").val();
			productSalePrice = parseInt(productSalePrice);
			//배열로 가져오기 get()
			for(var i=0; i<optionChoose.children().find('.numberIcon').get().length; i++){
				totalPrice += productSalePrice;
				totalCount++;
			}
			$(this).parent().parent().parent().find('.totalPrice').text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$(this).parent().parent().parent().find('.totalCount').text(totalCount);
		}
	});
	
	//두번째 셀렉트옵션
	$("select[name=optionSelect1]").change(function(){
		//다음 셀렉트 disabled 없애기
		$(this).next().removeAttr("disabled");
		
		if($(this).val() != "" && $(this).next().css("display") == "none"){
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
			}else if(selectValue0 ==""){
				alert("첫번째 옵션을 선택해주세요.");
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
				html[i] += '<span class="salePrice">'+salePrice+'</span>원</div></div><hr />';
				
				count++
				
			}
			//div 초기화 시켜주고
			optionChoose.empty();
			//html 출력
			for(var i=0; i<html.length; i++){
				optionChoose.append(html[i]);
			}
			
			//전체 가격, 갯수 부분
			var totalPrice = 0;
			var totalCount = 0;
			var productSalePrice = $(this).parent().parent().parent().find("input[name='productSalePrice']").val();
			productSalePrice = parseInt(productSalePrice);
			//배열로 가져오기 get()
			for(var i=0; i<optionChoose.children().find('.numberIcon').get().length; i++){
				totalPrice += productSalePrice;
				totalCount++;
			}
			$(this).parent().parent().parent().find('.totalPrice').text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$(this).parent().parent().parent().find('.totalCount').text(totalCount);
		}
	});
	
	//세번째 셀렉트옵션
	$("select[name=optionSelect2]").change(function(){
		
		if($(this).val() != ""){
			count=0; // 카운트 초기화
			//optionChoose div 가져오기
			var optionChoose = $(this).parent().parent().parent().find(".optionChoose");
			//첫번째 옵션 셀렉트
			var selectValue0 = $(this).prev().prev().val();
			//두번째 옵션 셀렉트
			var selectValue1 = $(this).prev().val();
			//셀렉트 값 가져오기
			var selectValue2 = $(this).val();
			
			//select 처음꺼 선택 + 지금 셀렉트 값
			if(setC.has(selectValue0+"/"+selectValue1+"/"+selectValue2)){
				alert("이미 추가한 옵션입니다.");
			}else if(selectValue0 ==""){
				alert("첫번째 옵션을 선택해주세요.");
			}else if(selectValue1 ==""){
				alert("두번째 옵션을 선택해주세요.");
			}else{
				setC.add(selectValue0+"/"+selectValue1+"/"+selectValue2);
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
				html[i] += '<span class="salePrice">'+salePrice+'</span>원</div></div><hr />';
				
				count++
				
			}
			//div 초기화 시켜주고
			optionChoose.empty();
			//html 출력
			for(var i=0; i<html.length; i++){
				optionChoose.append(html[i]);
			}
			
			//전체 가격, 갯수 부분
			var totalPrice = 0;
			var totalCount = 0;
			var productSalePrice = $(this).parent().parent().parent().find("input[name='productSalePrice']").val();
			productSalePrice = parseInt(productSalePrice);
			//배열로 가져오기 get()
			for(var i=0; i<optionChoose.children().find('.numberIcon').get().length; i++){
				totalPrice += productSalePrice;
				totalCount++;
			}
			$(this).parent().parent().parent().find('.totalPrice').text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$(this).parent().parent().parent().find('.totalCount').text(totalCount);
		}
	});
	
	//상품수량 +
	$(document).on("click",".addIcon",function(){
		//상품 재고량
		var productCount = $(this).parent().parent().parent().parent().find("input[name='productCount']").val();
		
		//상품 가격
		var price = $(this).parent().parent().parent().parent().find("input[name='productSalePrice']").val();

		var countProduct = $(this).next().text(); //+옆에 상품수량
		countProduct = parseInt(countProduct);
		
		if(productCount <= countProduct){
			alert("재고량보다 많습니다.");
		}else {
			countProduct += 1;
			price = price*countProduct;
		}
		$(this).next().text(countProduct);
		$(this).parent().next().children().text(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
		
		//전체 가격, 전체 수량
		var totalCount = 0;
		var totalPrice = 0;
		var numberIcon = $(this).parent().parent().parent().find(".numberIcon").get();
		var salePrice = $(this).parent().parent().parent().find(".salePrice").get();
		for(var i=0; i<numberIcon.length; i++){
			totalCount = totalCount + parseInt(numberIcon[i].innerHTML);
		}
		for(var i=0; i<salePrice.length; i++){
			totalPrice = totalPrice + parseInt(salePrice[i].innerHTML.replace(",", ""));
		}
		$(this).parent().parent().parent().parent().find('.totalPrice').text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
		$(this).parent().parent().parent().parent().find('.totalCount').text(totalCount);
	});
	
	//상품수량 -
	$(document).on("click",".removeIcon",function(){
		//상품 가격
		var price = $(this).parent().parent().parent().parent().find("input[name='productSalePrice']").val();
		
		var countProduct = $(this).prev().text();
		countProduct = parseInt(countProduct);
		if(countProduct <= 1){
			alert("1개 이상이여야 합니다.");
		}else{
			countProduct -= 1;
			price = price*countProduct;
		}
		$(this).prev().text(countProduct);
		$(this).parent().next().children().text(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
	
		//전체 가격, 전체 수량
		var totalCount = 0;
		var totalPrice = 0;
		var numberIcon = $(this).parent().parent().parent().find(".numberIcon").get();
		var salePrice = $(this).parent().parent().parent().find(".salePrice").get();
		for(var i=0; i<numberIcon.length; i++){
			totalCount = totalCount + parseInt(numberIcon[i].innerHTML);
		}
		for(var i=0; i<salePrice.length; i++){
			totalPrice = totalPrice + parseInt(salePrice[i].innerHTML.replace(",", ""));
		}
		$(this).parent().parent().parent().parent().find('.totalPrice').text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
		$(this).parent().parent().parent().parent().find('.totalCount').text(totalCount);
	});
	
});

function fnCartInsert(productKey, memKey){
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
