$(function(){
	
	//인포, 사이즈, 카우션 토글
	$('.showInfo').click(function(){
		$('.showImg1').slideDown();
		$('.showInfo').css("background-color", "skyblue");
		$('.showImg2').hide();
		$('.showSize').css("background-color", "white");
		$('.showImg3').hide();
		$('.showCaution').css("background-color", "white");
	});
	
	$('.showSize').click(function(){
		$('.showImg1').hide();
		$('.showInfo').css("background-color", "white");
		$('.showImg2').slideDown();
		$('.showSize').css("background-color", "skyblue");
		$('.showImg3').hide();
		$('.showCaution').css("background-color", "white");
	});
	
	$('.showCaution').click(function(){
		$('.showImg1').hide();
		$('.showInfo').css("background-color", "white");
		$('.showImg2').hide();
		$('.showSize').css("background-color", "white");
		$('.showImg3').slideDown();
		$('.showCaution').css("background-color", "skyblue");
	});
	
	//들리버리, 익스체인지 토글
	$('.showDelivery').click(function(){
		var addIconText = $('.addIcon1').text();
		$('.delivery').slideToggle();
		if(addIconText == 'add'){
			$('.addIcon1').text('remove');
		}
		if(addIconText == 'remove'){
			$('.addIcon1').text('add');	
		}
	});
	
	$('.showExchange').click(function(){
		var addIconText = $('.addIcon2').text();
		$('.exchange').slideToggle();
		if(addIconText == 'add'){
			$('.addIcon2').text('remove');
		}
		if(addIconText == 'remove'){
			$('.addIcon2').text('add');	
		}
	});
	
	// 비어있는 새로운 set 을 만듬
	let setA = new Set();
	let setB = [];
	let html = []; //html 넣을 배열 선언
	
	let setC = new Set();
	let setD = [];
	
	for(var i=0; i<oc1.length; i++){
		//만약 옵션이 없다면 한개만
		if(oc1 == "" && oc2 == "" && oc3 == "" && oc4 == "" && oc5 == ""){
			var productName = $("input[name='productName']").val();
			var totalPrice = $('.totalPrice');
			var productSalePrice = $("input[name='productSalePrice']").val();
			var optionChoose = $('.optionChoose');
			
			optionChoose.empty();
			
			//추가할 html코드
			var html2='';
			html2 += '<div class="row"><div class="col-6 fw-bold">';
			html2 += ''+productName+'<br><span class="text-muted optionText"></span>';
			html2 += '</div><div class="col-3 text-end">';
			html2 += '<span class="material-symbols-outlined align-middle addIcon" style="font-size:20px;">add</span>';
			html2 += ' <span class="align-middle numberIcon fw-bold">1</span>';
			html2 += ' <span class="material-symbols-outlined align-middle removeIcon" style="font-size:20px;">remove</span>';
			html2 += '</div><div class="col-3 text-end fw-bold align-middle">';
			html2 += '<span class="salePrice">'+productSalePrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+'</span>원</div></div><hr />';
			
			optionChoose.append(html2);
			
			$('.totalCount').text(1);
			totalPrice.text(productSalePrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
		}else { //옵션이 있다면
			//셀렉트박스 찾아옴
			var select = $("select[name='optionSelect"+i+"']");
			select.children('option:not(:first)').remove(); //셀렉트박스 옵션 초기화
			select.removeClass("d-none"); //display block 변경
			select.attr("disabled",true); //전체셀렉트 disabled
			
			//셀렉트 하면 append 할 div 초기화
			var optionChoose = $(".optionChoose");
			optionChoose.empty();
			setA.clear(); //set 초기화
			setC.clear();
			setB = []; //배열초기화
			setD = [];
			html = [];
			
			//토탈 가격, 갯수 초기화
			$('.totalPrice').text(0);
			$('.totalCount').text(0);
			
			//빈값이 아니라면 옵션 추가
			if(oc1[i] != ""){
				select.append(`<option value='${oc1[i]}'>${oc1[i]}</option>`);
			}
			if(oc2[i] != ""){
				select.append(`<option value='${oc2[i]}'>${oc2[i]}</option>`);
			}
			if(oc3[i] != ""){
				select.append(`<option value='${oc3[i]}'>${oc3[i]}</option>`);
			}
			if(oc4[i] != ""){
				select.append(`<option value='${oc4[i]}'>${oc4[i]}</option>`);
			}
			if(oc5[i] != ""){
				select.append(`<option value='${oc5[i]}'>${oc5[i]}</option>`);
			}
		}
	}
	var optionSelect0 = $("select[name='optionSelect0']");
	optionSelect0.removeAttr("disabled"); //셀렉트 첫번째 disabled 삭제
	
	//select에 대한 클릭 함수
	$("select[name=optionSelect0]").change(function(){
		//다음 셀렉트 disabled 없애기
		$(this).next().removeAttr("disabled");
		
		//select가 하나일때
		if($(this).val() != "" && $(this).next().css("display") == "none"){
			count=0; // 카운트 초기화
			//셀렉트 하면 append 할 div
			var optionChoose = $(".optionChoose");
			
			//셀렉트 값 가져오기
			var selectValue = $(this).val();
			if(setA.has(selectValue)){
				alert("이미 추가한 옵션입니다.");
			}else{
				setA.add(selectValue);
			}
			
			setB = Array.from(setA); //set을 array로 변환
			
			//상품 이름 가져오기
			var productName = $("input[name='productName']").val();
			
			//상품 가격 가져오기
			var salePrice1 = $("input[name='productSalePrice']").val();
			//상품 가격 3자리마다 콤마 찍은 변수
			var salePrice = salePrice1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			//set에 들어있는 값들을 통해 html 배열에 삽입
			for(var i=0; i<setB.length; i++){
				
				//추가할 html코드
				html[i]='';
				html[i] += '<div class="row"><div class="col-6 fw-bold">';
				html[i] += ''+productName+'<br><span class="text-muted optionText">'+setB[i]+'</span>';
				html[i] += '</div><div class="col-3 text-end">';
				html[i] += '<span class="material-symbols-outlined align-middle addIcon" style="font-size:20px;">add</span>';
				html[i] += ' <span class="align-middle numberIcon fw-bold">1</span>';
				html[i] += ' <span class="material-symbols-outlined align-middle removeIcon" style="font-size:20px;">remove</span>';
				html[i] += '</div><div class="col-3 text-end fw-bold align-middle">';
				html[i] += '<span class="salePrice">'+salePrice+'</span>원</div></div><hr />';
				
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
			var productSalePrice = $("input[name='productSalePrice']").val();
			productSalePrice = parseInt(productSalePrice);
			//배열로 가져오기 get()
			for(var i=0; i<optionChoose.children().find('.numberIcon').get().length; i++){
				totalPrice += productSalePrice;
				totalCount++;
			}
			$('.totalPrice').text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$('.totalCount').text(totalCount);
		}
	});
	
	//두번째 셀렉트옵션
	$("select[name=optionSelect1]").change(function(){
		//다음 셀렉트 disabled 없애기
		$(this).next().removeAttr("disabled");
		
		if($(this).val() != "" && $(this).next().css("display") == "none"){
			count=0; // 카운트 초기화
			//optionChoose div 가져오기
			var optionChoose = $(".optionChoose");
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
			var productName = $("input[name='productName']").val();
			
			//상품 가격 가져오기
			var salePrice1 = $("input[name='productSalePrice']").val();
			//상품 가격 3자리마다 콤마 찍은 변수
			var salePrice = salePrice1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			//set에 들어있는 값들을 통해 html 배열에 삽입
			for(var i=0; i<setD.length; i++){
				
				//추가할 html코드
				html[i]='';
				html[i] += '<div class="row"><div class="col-6 fw-bold">';
				html[i] += ''+productName+'<br><span class="text-muted optionText">'+setD[i]+'</span>';
				html[i] += '</div><div class="col-3 text-end">';
				html[i] += '<span class="material-symbols-outlined align-middle addIcon" style="font-size:20px;">add</span>';
				html[i] += ' <span class="align-middle numberIcon fw-bold">1</span>';
				html[i] += ' <span class="material-symbols-outlined align-middle removeIcon" style="font-size:20px;">remove</span>';
				html[i] += '</div><div class="col-3 text-end fw-bold align-middle">';
				html[i] += '<span class="salePrice">'+salePrice+'</span>원</div></div><hr />';
				
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
			var productSalePrice = $("input[name='productSalePrice']").val();;
			productSalePrice = parseInt(productSalePrice);
			//배열로 가져오기 get()
			for(var i=0; i<optionChoose.children().find('.numberIcon').get().length; i++){
				totalPrice += productSalePrice;
				totalCount++;
			}
			$('.totalPrice').text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$('.totalCount').text(totalCount);
		}
	});
	
	//세번째 셀렉트옵션
	$("select[name=optionSelect2]").change(function(){
		
		if($(this).val() != ""){
			count=0; // 카운트 초기화
			//optionChoose div 가져오기
			var optionChoose = $(".optionChoose");
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
			var productName = $("input[name='productName']").val();
			
			//상품 가격 가져오기
			var salePrice1 = $("input[name='productSalePrice']").val();
			//상품 가격 3자리마다 콤마 찍은 변수
			var salePrice = salePrice1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			//set에 들어있는 값들을 통해 html 배열에 삽입
			for(var i=0; i<setD.length; i++){
				
				//추가할 html코드
				html[i]='';
				html[i] += '<div class="row"><div class="col-6 fw-bold">';
				html[i] += ''+productName+'<br><span class="text-muted optionText">'+setD[i]+'</span>';
				html[i] += '</div><div class="col-3 text-end">';
				html[i] += '<span class="material-symbols-outlined align-middle addIcon" style="font-size:20px;">add</span>';
				html[i] += ' <span class="align-middle numberIcon fw-bold">1</span>';
				html[i] += ' <span class="material-symbols-outlined align-middle removeIcon" style="font-size:20px;">remove</span>';
				html[i] += '</div><div class="col-3 text-end fw-bold align-middle">';
				html[i] += '<span class="salePrice">'+salePrice+'</span>원</div></div><hr />';
				
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
			var productSalePrice = $("input[name='productSalePrice']").val();
			productSalePrice = parseInt(productSalePrice);
			//배열로 가져오기 get()
			for(var i=0; i<optionChoose.children().find('.numberIcon').get().length; i++){
				totalPrice += productSalePrice;
				totalCount++;
			}
			$('.totalPrice').text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$('.totalCount').text(totalCount);
		}
	});
	
	//상품수량 +
	$(document).on("click",".addIcon",function(){
		//상품 재고량
		var productCount = $("input[name='productCount']").val();
		
		//상품 가격
		var price = $("input[name='productSalePrice']").val();

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
		var numberIcon = $(".numberIcon").get();
		var salePrice = $(".salePrice").get();
		for(var i=0; i<numberIcon.length; i++){
			totalCount = totalCount + parseInt(numberIcon[i].innerHTML);
		}
		for(var i=0; i<salePrice.length; i++){
			totalPrice = totalPrice + parseInt(salePrice[i].innerHTML.replace(",", ""));
		}
		$('.totalPrice').text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
		$('.totalCount').text(totalCount);
	});
	
	//상품수량 -
	$(document).on("click",".removeIcon",function(){
		//상품 가격
		var price = $("input[name='productSalePrice']").val();
		
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
		var numberIcon = $(".numberIcon").get();
		var salePrice = $(".salePrice").get();
		for(var i=0; i<numberIcon.length; i++){
			totalCount = totalCount + parseInt(numberIcon[i].innerHTML);
		}
		for(var i=0; i<salePrice.length; i++){
			totalPrice = totalPrice + parseInt(salePrice[i].innerHTML.replace(",", ""));
		}
		$('.totalPrice').text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
		$('.totalCount').text(totalCount);
	});
	
	//회원 장바구니 추가
	$(document).on("click",".addCart",function(){
		var productKey = $("input[name='productKey']").val();
		var memKey = $("input[name='memKey']").val();
		
		//상품수량
		var cartCount = [];
		var cartCount1 = $('.numberIcon').get();
		for(var i=0; i<cartCount1.length; i++){
			cartCount[i] = cartCount1[i].innerHTML;
		}
		
		//상품옵션
		var optionText = [];
		var optionText1 = $('.optionText').get();
		var optionChoose = $('.optionChoose');
		for(var i=0; i<optionText1.length; i++){
			optionText[i] = optionText1[i].innerHTML;
		}
		if(optionChoose.children().length < 1){
			alert("한개 이상의 옵션을 선택해주세요.");
		}else {
			$.ajax({
				type : "POST",
				traditional: true,	// ajax 배열 넘기기 옵션!
				url: "/formypet/cart/AddCartServlet",
				data : { productKey:productKey, memKey:memKey, cartCount:cartCount, optionText:optionText },
				dataType : "json",
				success : function(data) { 
					if(data == true){
						alert('장바구니에 추가 되었습니다.')
						if(confirm("장바구니로 이동 하시겠습니까?")){
							 location.href = "../cart/cart.jsp";
						}else {
						     location.reload();
						}
					}else {
						alert('장바구니에 동일한 상품이 있습니다.');
					}
				},
				errer : function() {
					alert('errer');
				}
			});
		}
		
	});
	
	//비회원 장바구니 추가
	$(document).on("click",".addNoMemCart",function(){
		var productKey = $("input[name='productKey']").val();
		
		//상품수량
		var cartCount = [];
		var cartCount1 = $('.numberIcon').get();
		for(var i=0; i<cartCount1.length; i++){
			cartCount[i] = cartCount1[i].innerHTML;
		}
		
		//상품옵션
		var optionText = [];
		var optionText1 = $('.optionText').get();
		var optionChoose = $('.optionChoose');
		for(var i=0; i<optionText1.length; i++){
			optionText[i] = optionText1[i].innerHTML;
		}
		if(optionChoose.children().length < 1){
			alert("한개 이상의 옵션을 선택해주세요.");
		}else {
			$.ajax({
				type : "POST",
				traditional: true,	// ajax 배열 넘기기 옵션!
				url: "/formypet/cart/AddCartNoMemServlet",
				data : { productKey:productKey, cartCount:cartCount, optionText:optionText },
				dataType : "json",
				success : function(data) { 
					if(data == true){
						alert('장바구니에 추가 되었습니다.')
						if(confirm("장바구니로 이동 하시겠습니까?")){
							 location.href = "../cart/cart.jsp";
						}else {
						     location.reload();
						}
					}else {
						alert('장바구니에 동일한 상품이 있습니다.');
					}
				},
				errer : function() {
					alert('errer');
				}
			});
		}
		
	});
	
	//회원 바로구매
	$(document).on("click",".buyNow",function(){
		var memKey = $("input[name='memKey']").val();
		var productKey = [];
		
		//상품수량
		var cartCount = [];
		var cartCount1 = $('.numberIcon').get();
		for(var i=0; i<cartCount1.length; i++){
			cartCount[i] = cartCount1[i].innerHTML;
			productKey[i] = $("input[name='productKey']").val();
		}
		
		//상품옵션
		var optionText = [];
		var optionText1 = $('.optionText').get();
		var optionChoose = $('.optionChoose');
		for(var i=0; i<optionText1.length; i++){
			optionText[i] = optionText1[i].innerHTML;
		}
		if(optionChoose.children().length < 1){
			alert("한개 이상의 옵션을 선택해주세요.");
		}else {
			if(confirm("구매하시겠습니까?")){
				$.ajax({
					type : "POST",
					traditional: true,	// ajax 배열 넘기기 옵션!
					url: "/formypet/order/MemOrderServlet",
					data : {memKey:memKey, productKey:productKey, cartCount:cartCount, optionText:optionText},
					dataType : "json",
					success : function(data) { 
						window.location.href="/formypet/order/memOrder.jsp";
					},
					errer : function() {
						alert('errer');
					}
				});
			}
		}
	});
	
	//비회원 바로구매
	$(document).on("click",".buyNoMemNow",function(){
		var productKey = [];
		
		//상품수량
		var cartCount = [];
		var cartCount1 = $('.numberIcon').get();
		for(var i=0; i<cartCount1.length; i++){
			cartCount[i] = cartCount1[i].innerHTML;
			productKey[i] = $("input[name='productKey']").val();
		}
		
		//상품옵션
		var optionText = [];
		var optionText1 = $('.optionText').get();
		var optionChoose = $('.optionChoose');
		for(var i=0; i<optionText1.length; i++){
			optionText[i] = optionText1[i].innerHTML;
		}
		if(optionChoose.children().length < 1){
			alert("한개 이상의 옵션을 선택해주세요.");
		}else {
			if(confirm("구매하시겠습니까?")){
				$.ajax({
					type : "POST",
					traditional: true,	// ajax 배열 넘기기 옵션!
					url: "/formypet/order/NoMemOrderServlet",
					data : {productKey:productKey, cartCount:cartCount, optionText:optionText},
					dataType : "json",
					success : function(data) { 
						window.location.href="/formypet/order/nonMemOrder.jsp";
					},
					errer : function() {
						alert('errer');
					}
				});
			}
		}
	});
	
});

