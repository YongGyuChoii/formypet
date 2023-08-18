/**
 * 
 */
//이메일 select
function selectOption() {
	
	var select = document.getElementById("memEmail3").value;

	document.getElementById("memEmail2").value = select;
}

//daum 우편번호
function DaumPostcode() {
	
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
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("postcode2").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("postcode3").focus();
            }
        }).open();
}

//id중복체크
function idCheck(memId) {
			frm = document.regFrm;
			if (memId == "") {
				alert("아이디를 입력해 주세요.");
				frm.id.focus();
				return;
			}
			check = true;
			document.getElementById("checking").value = check;
			//idCheck.jsp 페이지로 id파라미터 옮기기
			url = "idCheck.jsp?memId=" + memId;
			//창 크기로 idCheck.jsp 페이지 열기
			window.open(url, "IDCheck", "width=300,height=150");
}	

//중복체크 활성화
function idActivate() {
	check = false;
	document.getElementById("checking").value = check;
}

function inputCheck(){
	
	
	var addr0 = document.getElementById("postcode").value;
	var addr1 = document.getElementById("postcode2").value;
	document.getElementById("test").value = addr0 + "/" + addr1; 
	
	
	
	// 정규식
    // id
    var regId = /^[a-z0-9]{4,12}$/;
    // 이름
    var regName = /^[가-힣a-zA-Z]{2,15}$/;
    // 이메일
    var regMail1 = /^([\w-]+(?:\.[\w-]+)*)/
    var regMail2 = /^((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    // pw
    var regexPw = /^[A-Za-z0-9`~!@#\$%\^&\*\(\)\{\}\[\]\-_=\+\\|;:'"<>,\./\?]{4,10}$/;
    // 주민번호
    var regResi1 = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))/;
    var regResi2 = /^[1-4][0-9]{6}$/
    
    var uid = document.getElementById("userId");
    var testing = document.getElementById("duplicateCheck").value;
    console.log(testing);
	
	//아이디
	if(document.regFrm.memId.value==""){
		alert("아이디를 입력해 주세요.");
		uid.focus();
		return;
	}
    else if(!regId.test(document.regFrm.memId.value)){
        alert("4~12자 영문소문자, 숫자만 입력하세요.");
        uid.value = "";
        uid.focus();
        return;
    }    
	if(document.regFrm.idDuplication.value=="false") {
		alert("중복체크를 해주세요.");
		uid.value = "";
		uid.focus();
		return;
	}
	
	if(testing=="true"){
		alert("이미 존재하는 아이디입니다.");
		uid.value = "";
        uid.focus();
		return;
	}
	
	//비밀번호
	if(document.regFrm.memPw.value==""){
		alert("비밀번호를 입력해 주세요.");
		return;
	}
	else if(!regexPw.test(document.regFrm.memPw.value)){
        alert("4~10자 영문 대소문자, 숫자, 특수문자를 사용하세요.");
        document.regFrm.memPw.value = "";
        document.regFrm.memPw.focus();
        return;
    }
    
	if(document.regFrm.repwd.value==""){
		alert("비밀번호를 확인해 주세요");
		document.regFrm.repwd.focus();
		return;
	}
	if(document.regFrm.memPw.value != document.regFrm.repwd.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.regFrm.repwd.value="";
		document.regFrm.repwd.focus();
		return;
	}
	
	//이름
	if(document.regFrm.memName.value==""){
		alert("이름을 입력해 주세요.");
		document.regFrm.memName.focus();
		return;
	}
	else if(!regName.test(document.regFrm.memName.value)){
        alert("이름의 형식이 올바르지 않습니다.");
        document.regFrm.memName.value = "";
        document.regFrm.memName.focus();
        return;
    }
	
	//이메일
	if(document.regFrm.memEmail1.value==""){
		alert("이메일을 입력해 주세요.");
		document.regFrm.memEmail1.focus();
		return;
	}
	else if(!regMail1.test(document.regFrm.memEmail1.value)){
        alert("이메일 형식이 올바르지 않습니다.");
        document.regFrm.memEmail1.value = "";
        document.regFrm.memEmail1.focus();
        return;
    }
    
	if(document.regFrm.memEmail2.value==""){
		alert("이메일을 입력해 주세요.");
		document.regFrm.memEmail2.focus();
		return;
	}
	else if(!regMail2.test(document.regFrm.memEmail2.value)){
        alert("이메일 형식이 올바르지 않습니다.");
        document.regFrm.memEmail2.value = "";
        document.regFrm.memEmail2.focus();
        return;
    }
	
	//배송주소
	if(document.regFrm.memAddress0.value==""){
		alert("우편번호를 입력해 주세요.");
		document.regFrm.memAddress1.value = "";
		document.regFrm.memAddress1.focus();
		return;
	}
	if(document.regFrm.memAddress1.value==""){
		alert("배송주소를 입력해 주세요.");
		document.regFrm.memAddress0.focus();
		return;
	}
	
	//전화번호
	if(document.regFrm.memPhone1.value==""){
		alert("전화번호 앞자리를 입력하세요.");
		document.regFrm.memPhone1.focus();
		return;
	}
	if(document.regFrm.memPhone2.value==""){
		alert("전화번호 뒷자리를 입력하세요.");
		document.regFrm.memPhone2.focus();
		return;
	}
	
	//주민등록번호
	if(document.regFrm.memResident1.value==""){
		alert("주민번호 앞자리를 입력하세요.");
		document.regFrm.memResident1.focus();
		return;
	}	
	else if(!regResi1.test(document.regFrm.memResident1.value)){
        alert("주민번호 형식이 올바르지 않습니다.");
        document.regFrm.memResident1.value = "";
        document.regFrm.memResident1.focus();
        return;
    }
    
	if(document.regFrm.memResident2.value==""){
		alert("주민번호 뒷자리를 입력하세요.");
		document.regFrm.memResident2.focus();
		return;
	}	
	else if(!regResi2.test(document.regFrm.memResident2.value)){
        alert("주민번호 형식이 올바르지 않습니다.");
        document.regFrm.memResident2.value = "";
        document.regFrm.memResident2.focus();
        return;
    }
    
    
    
	document.regFrm.submit();
}





