$(function(){

	  var send = document.getElementById("click");
	
	  send.addEventListener("click", function () {
	  var form = document.getElementById("form");
	  
	  var temp = $('input:radio[name="categoryKey"]:checked').val();
	  form.action = "productFileupload?categoryKey="+temp;
	  form.submit();
	});
	
});