$(function(){
	
	//회원일때 옵션 불러오기
	$('.btnIcon').click(function(){
		
		//넘길 productKey 찾아옴
		var productKey = $(this).parent().parent().find("input[name='productKey']").val();
		//셀렉트박스 찾아옴
		var select = $(this).parent().parent().find("select[name='optionSelect']");
				
		$.ajax({
			type : "POST",
			url: "/formypet/product/ProductMainServlet",
			data : { productKey:productKey },
			dataType : "json",
			success : function(data) { // Ajax 목적 : data를 얻기 위함
				for(var i=0; i<data.length; i++){
					//만약 옵션이 없다면 바로 카트에 추가
					if(data[i].oc1 == "" && data[i].oc2 == "" && data[i].oc3 == "" && data[i].oc4 == "" && data[i].oc5 == ""){
						fnCartInsert();
						break;
					}else { //옵션이 있다면
						select.children('option:not(:first)').remove(); //셀렉트박스 옵션 초기화
						
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
	
});

//회원일때 장바구니 추가하기
function fnCartInsert() {
	alert("자압구니추가");
}
