<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!-- MemberMgr 클래스 와 MemberBean 클래스 빈 사용  -->
<jsp:useBean id="mgr" class="member.MemberMgr"/>
<jsp:useBean id="bean" class="member.MemberBean"/>  
<!-- MemberBean 클래스 setProperty 사용 -->
<jsp:setProperty property="*" name="bean"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		boolean result = mgr.insertMember(bean);
		//MemberMgr 클래스 insertMember() 메서드 호출
		String msg = "회원가입에 실패 하였습니다.";
		String location = "signup.jsp";
		//result 에 담긴 결과값이 true 이면 아래 출력
		if(result){
			msg = "회원가입을 하였습니다.";
			location = "login.jsp";
		}
	%>
</body>
</html>
<script>
	//msg 변수에 담긴 값 alert 출력
	alert("<%=msg%>"); 
	//location 에 담긴 값으로 페이지 이동
	location.href = "<%=location%>";
</script>