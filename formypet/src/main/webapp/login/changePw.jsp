<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="member.MemberBean"%>    
<jsp:useBean id="mMgr" class="member.MemberMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("UTF-8");

	String memId = request.getParameter("memId");
	String memName = request.getParameter("memName");
	String memPw = request.getParameter("memPw");
	int memResident1 = Integer.parseInt(request.getParameter("memResident1"));
	int memResident2 = Integer.parseInt(request.getParameter("memResident2"));
	
	System.out.println(memPw);
	System.out.println(memId);
	System.out.println(memName);
	System.out.println(memResident1);
	System.out.println(memResident2);
	
	String url = "../index.jsp";
	String msg = "��й�ȣ ��Ͽ� �����Ͽ����ϴ�.";
	  				  
	
	boolean flag = mMgr.changePw(memId, memName, memResident1, memResident2, memPw);
	  
	if(flag == true) {
		  
		msg = "���������� ��й�ȣ�� �����Ͽ����ϴ�.";
		url = "./login.jsp";		
	   
	}
%>
</head>
<body>

</body>
</html>
<script>
	alert("<%=msg%>");	
	location.href="<%=url%>";
</script>