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
	
});

