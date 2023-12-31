/*체크박스*/
$(function(){
	
    var listAll = $("input[type='checkbox'].agreechkAll");    //전체 클릭하는 엘리먼트에 .agreechkAll 클랙스가 추가되어야 한다.
    var list = $("input[type='checkbox'].chack");    //각각 클릭하는 엘리먼트에 .chack 클랙스가 추가되어야 한다.
    var common = {
        allCheck : function(e){ 
            if($(e.target).prop("checked") === true) { 
                //해당화면에 전체 checkbox들을 체크한다 
                list.prop("checked",true);
            } else if($(e.target).prop("checked") === false){
                //해당화면에 모든 checkbox들의 체크를해제 한다. 
                list.prop("checked",false);
            }
        },
        check : function(e){
            if($(e.target).prop("checked") === true){
                $(e.target).prop("checked", true)
            }
            if($(e.target).prop("checked") === false){
                $(e.target).prop("checked", false)
                listAll.prop('checked', false);
            }
            // 각자 하나씩 선택시 자동으로 전채선택도 활성화 시키기
            var size = list.filter(':checked').length;
                if(size == list.length) {
                    listAll.prop("checked", true);
                } else {
                    listAll.prop("checked", false);
                }
            },
           
        }
    $('.cart_table').on('click','.agreechkAll', common.allCheck)
    $('.cart_table').on('click','.chack', common.check)
    
	/*회원 구매*/
	$(document).on("click","#memBuy",function(){
		var memKey = $(this).parent().parent().parent().parent().parent().parent().find("input[name='memKey']").val();
		var productKey = [];
		

		//상품수량
		var cartCount = new Array();
		$("input[name='countInput']").each(function(index, item){
	    	cartCount.push($(item).val());
		});
		
		//상품키
		var productKey = new Array();
				$("input[name=productKey]").each(function(index, item){
	    		productKey.push($(item).val());
			});
		
		//상품옵션
		var optionValue = new Array();
				$("input[name=optionValue]").each(function(index, item){
	    		optionValue.push($(item).val());
			});
			for(var i=0; i<cartCount.length; i++){
			console.log(cartCount[i]);
			console.log(productKey[i]);
			console.log(optionValue[i]);
		}
			
		if($(".cart_table_detail").children().length < 1){
			alert("한개 이상의 옵션을 선택해주세요.");
		}else {
			if(confirm("구매하시겠습니까?")){
				$.ajax({
					type : "POST",
					traditional: true,	// ajax 배열 넘기기 옵션!
					url: "/formypet/order/MemOrderServlet",
					data : {memKey:memKey, productKey:productKey, cartCount:cartCount, optionText:optionValue},
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
	
	/*비회원 구매*/
	$(document).on("click","#noMemBuy",function(){
		var productKey = [];
		
		//상품수량
		var cartCount = new Array();
		$("input[name='countInput']").each(function(index, item){
	    	cartCount.push($(item).val());
		});
		
		//상품키
		var productKey = new Array();
				$("input[name=productKey]").each(function(index, item){
	    		productKey.push($(item).val());
			});
		
		//상품옵션
		var optionText = new Array();
				$("input[name=optionText]").each(function(index, item){
	    		optionText.push($(item).val());
			});
			for(var i=0; i<cartCount.length; i++){
			console.log(cartCount[i]);
			console.log(optionText[i]);
		}
		
		
		if($(".cart_table_detail").children().length < 1){
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
	
	//선택삭제
	$(document).on("click","#delete",function() {
		var cartKey = new Array();
		$("input[name='checkRow']:checked").each(function(index, item){
	    	cartKey.push($(item).val());
		});
		for(var i=0; i<cartKey.length; i++){
			console.log(cartKey[i]);
		}
		
		if(cartKey.length < 1 ) {
			alert("삭제할 상품을 선택해주세요");
		} else {
		if(confirm("삭제하시겠습니까?")){
				$.ajax({
					type : "POST",
					traditional: true,	// ajax 배열 넘기기 옵션!
					url: "/formypet/cart/DeleteCartServlet",
					data : {cartKey:cartKey},
					dataType : "json",
					success : function(data) { 
						window.location.href="/formypet/cart/cart.jsp";
					},
					errer : function() {
						alert('errer');
					}
				});
			}
		}
	});	
	
	//+수량변경
	$(document).on("click","#upBtn",function() {
		
		var thisButton = $(this);
		var tr = thisButton.parent().parent();
		var td = tr.children();
		var cartKey = td.find("input[name='checkRow']").val();
		var cartCount = td.find("input[name='countInput']").val();
		var productCount = td.find("input[name='productCount']").val();
		productCount = parseInt(productCount);
		console.log(productCount);
		console.log(cartCount);

		if(cartCount >= productCount) {
			alert("재고량보다 많습니다.");
		} else {	
			$.ajax({
				type : "POST",
				traditional: true,	// ajax 배열 넘기기 옵션!
				url: "/formypet/cart/PlusCartCountServlet",
				data : {cartKey:cartKey},
				dataType : "json",
				success : function(data) { 
					window.location.href="/formypet/cart/cart.jsp";
				},
				errer : function() {
					alert('errer');
				}
			});
		}
	});	
	
	//-수량변경
	$(document).on("click","#downBtn",function() {
		
		var thisButton = $(this);
		var tr = thisButton.parent().parent();
		var td = tr.children();
		var cartKey = td.find("input[name='checkRow']").val();
		var cartCount = td.find("input[name='countInput']").val();

		if(cartCount <= 1) {
			alert("1개 이상이여야 합니다.");
		} else {
			$.ajax({
				type : "POST",
				traditional: true,	// ajax 배열 넘기기 옵션!
				url: "/formypet/cart/MinusCartCountServlet",
				data : {cartKey:cartKey},
				dataType : "json",
				success : function(data) { 
					window.location.href="/formypet/cart/cart.jsp";
				},
				errer : function() {
					alert('errer');
				}
			});
		}
	});	
	
	//장바구니에 상품에 유무체크
		var test2 = document.getElementById("moveTest2");	
		var test1 = document.getElementById("moveTest1");
		if(test2 == null) {
			if(test1 == null) {
				window.location.href = "./cartEmpty.jsp";
		}
	} else {}
 });




   
   
/**
 * 
 */