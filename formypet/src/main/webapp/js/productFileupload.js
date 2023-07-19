

	function inputValue(form1, param, form2, idx){
		var paramValue = form1.elements[idx].value;
		form2.elements[idx].value = paramValue;			 
		return;
	}
//파일 추가 버튼
		//상품 내용
		function additem(){
		      
		      console.log(additem);
		      
		      let addItem = document.createElement('div');
		      
		      addItem.innerHTML = '<input type="file" name="productComment" size="30" maxlength="30">';
		      
		      //document.body.appendChild(addItem);
		      document.querySelector("#pct").append(addItem);
		   }
		  
		   //상품 소개
		   function additem2(){
		      
		      console.log(additem2);
		      
		      let addItem2 = document.createElement('div');
		      
		      addItem2.innerHTML = '<input type="file" name="productInfo" size="30" maxlength="30">';
		      
		      //document.body.appendChild(addItem);
		      document.querySelector("#pi").append(addItem2);
		   }
		   //상품 디테일
		   function additem3(){
		      
		      console.log(additem3);
		      
		      let addItem3 = document.createElement('div');
		      
		      addItem3.innerHTML = '<input type="file" name="productDetail" size="30" maxlength="30">';
		      
		      //document.body.appendChild(addItem);
		      document.querySelector("#pd").append(addItem3);//파일 내용
		   }
		   
		   //상품 주의사항
		   function additem4(){
		      
		      console.log(additem4);
		      
		      let addItem4 = document.createElement('div');
		      
		      addItem4.innerHTML = '<input type="file" name="productCaution" size="30" maxlength="30">';
		      
		      //document.body.appendChild(addItem);
		      document.querySelector("#pca").append(addItem4);//파일 내용
		   }
		   
		   //상품 대표이미지
		   function additem5(){
		      
		      console.log(additem5);
		      
		      let addItem5 = document.createElement('div');
		      
		      addItem5.innerHTML = '<input type="file" name="productImg" size="30" maxlength="30">';
		      
		      //document.body.appendChild(addItem);
		      document.querySelector("#pti").append(addItem5);//파일 내용
		   }
		//상품 사진 추가 페이지 바로가기
		function picupload() {
			
			url = "productPicupload.jsp?search=n";
			window.open(url, "productPicupload", "width=800, height=600, scrollbars=yes");
			
		}
		
		//상품 fileSaveName 저장
		   function additem6(){
		      
		      console.log(additem6);
		      
		      let addItem6 = document.createElement('div');
		      
		      addItem6.innerHTML = '<input type="file" name="productImg" size="30" maxlength="30">';
		      
		      //document.body.appendChild(addItem);
		      document.querySelector("#fsn").append(addItem6);//파일 내용
}

	//파일이 선택 되었는지 체크하는 함수
	function elementCheck(formName){
	   paramIndex = 1; 
	   for(idx=0; idx<formName.elements.length; idx++){
	      if(formName.elements[idx].type == "file"){
	         if(formName.elements[idx].value==""){
		        var message = paramIndex +" 번째 파일정보가 누락되었습니다.\n업로드할 파일을 선택해 주세요";
			    alert(message);
				formName.elements[idx].focus();
				return;		
		     }
		     paramIndex++; 
	      }
	   }
	   formName.action = "fileInfoView.jsp"; //action 태그 설정
	   formName.submit(); //submit 실행
	   }