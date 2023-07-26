<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.MemberMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		  request.setCharacterEncoding("UTF-8");
	
		  String memId = request.getParameter("memId");
		  String memPw = request.getParameter("memPw");
		  
		  String url = "login.jsp";
		  String msg = "로그인에 실패 하였습니다.";
		  
		  //MemberMgr 클래스 loginMember() 메서드 호출 하여 결과값은 boolean 타입 으로 return 
	//	  boolean result = mMgr.loginMember(memId,memPw);
		  
	//	  if(result){
			  //result 결과값이 true 일때 
		    session.setAttribute("idKey",memId);
			  //session에 id 저장.
		    msg = "로그인에 성공 하였습니다.";
		    url = "../index.jsp";
	//	  }
	%>
</body>
</html>
<script>
	alert("<%=msg%>");	
	location.href="<%=url%>";
</script>