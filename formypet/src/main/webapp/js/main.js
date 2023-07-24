$(function(){
	
	var count = 0; //class 1개씩 증가하기 위한 변수
	
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
		if($(this).val() != "-[필수] 옵션을 선택해 주세요-"){
			//셀렉트 하면 append 할 div
			var optionChoose = $(this).parent().parent().parent().find(".optionChoose");
			
			//셀렉트 값 가져오기
			var selectValue = $(this).val();
			
			//상품 이름 가져오기
			var productName = $(this).parent().parent().parent().children().eq(0).text();
			
			//상품 가격 가져오기
			var salePrice1 = $(this).parent().parent().parent().children().eq(1).val();
			//상품 가격 3자리마다 콤마 찍은 변수
			var salePrice = salePrice1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			
			//추가할 html코드
			var html='';
			html += '<div class="row"><div class="col-6 fw-bold">';
			html += ''+productName+'<br><span class="text-muted optionText'+count+'">'+selectValue+'</span>';
			html += '</div><div class="col-3 text-end">';
			html += '<span class="material-symbols-outlined align-middle addIcon" style="font-size:20px;">add</span>';
			html += ' <span class="align-middle numberIcon fw-bold">1</span>';
			html += ' <span class="material-symbols-outlined align-middle removeIcon" style="font-size:20px;">remove</span>';
			html += '</div><div class="col-3 text-end text-primary fw-bold align-middle">';
			html += ''+salePrice+'원</div></div><hr />';
			
			optionChoose.append(html);
			count++
				
		}
		
	});
	
	//두번째 셀렉트옵션
	$("select[name=optionSelect1]").change(function(){
		
		if($(this).val() != "-[필수] 옵션을 선택해 주세요-"){
			
		}
		
	});
	
});
