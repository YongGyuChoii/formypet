<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "admin.CsManagementBean" %>
<jsp:useBean id="cmmgr" class="admin.CsManagementMgr" />
<%
		 
		//csmanagement.jsp페이지에서 이동한 memKey,nowPage 파라미터를 받아 각 각 변수에 저장

		int memKey = Integer.parseInt(request.getParameter("memKey"));

		String nowPage = request.getParameter("nowPage");
		
		 //session에 저장된 bean객체를 이용해서 게시물 정보를 각 각 변수에 저장 
		CsManagementBean bean = (CsManagementBean) session.getAttribute("bean");
		 
		  int memKey1 = bean.getMemKey();
		  String memId = bean.getMemId();
		  String memPw = bean.getMemPw();
		  int memPhone1 = bean.getMemPhone1();
		  int memPhone2 = bean.getMemPhone2();
		  String memEmail1 = bean.getMemEmail1();
		  String memEmail2 = bean.getMemEmail2();
		  String memAddress = bean.getMemAddress();
		  String memAddress2 = bean.getMemAddress2();
		  String memName = bean.getMemName();
		  int memResident1 = bean.getMemResident1();
		  int memResident2 = bean.getMemResident2();
		  String delYn = bean.getDelYn();
		  int memPoint = bean.getMemPoint();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보 수정 페이지</title>
	<link href="../css/admin2.css" rel="stylesheet" type="text/css">
	<script>
	function check() {
		document.updateFrm.submit();
	}
	</script>
</head>
<body>
	<div align="center"><br/><br/>
	<table width="600" cellpadding="3">
	  <tr>
	   <td bgcolor= "#002266" align="center"><font color = "#ffc303"><%=memKey %></font></td>
	  </tr>
	</table>
	<!-- boardUpdate 로 url맵핑된 서블릿으로 이동한다. -->
	<form name="updateFrm" method="post" action="cupdate">
	<table width="1200" cellpadding="7">
	 <tr>
	  <td>
	   <table>
	   	<tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">번 호</font></td>
	     <td>
		  <input name="memKey" value="<%=memKey1%>" size="70" maxlength="100">
		 </td>
		</tr>
	    <tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">아이디</font></td>
	     <td>
		  <input name="memId" value="<%=memId%>" size="70" maxlength="100">
		 </td>
		</tr>
		<tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">이 름</font></td>
	     <td>
		  <input name="memName" size="70" value="<%=memName%>" maxlength="100">
		 </td>
	    </tr>
		<tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">비밀번호</font></td>
	     <td>
		  <input name="memPw" size="70" value="<%=memPw%>" maxlength="100">
		 </td>
	    </tr>
		<tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">전화번호</font></td>
	     <td>
		  <input name="memPhone1" size="70" value="<%=memPhone1%>" maxlength="100">
		 </td>
		 </tr>
		 <tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">전화번호2</font></td>
		 <td>
		  <input name="memPhone2" size="70" value="<%=memPhone2%>" maxlength="100">
		 </td>
	    </tr>
		<tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">이메일</font></td>
	     <td>
		  <input name="memEmail1" size="70" value="<%=memEmail1%>" maxlength="100">
		 </td>
		 </tr>
		 <tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">이메일2</font></td>
		 <td>
		  <input name="memEmail2" size="70" value="<%=memEmail2 %>" maxlength="100">
		 </td>
		</tr>
		<tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">주 소</font></td>
	     <td>
		  <input name="memAddress" size="70" value="<%=memAddress%>" maxlength="100">
		 </td>
	    </tr>
	    <tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">상세 주소</font></td>
	     <td>
		  <input name="memAddress2" size="70" value="<%=memAddress2%>" maxlength="100">
		 </td>
	    </tr>
	    <tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">주민번호</font></td>
	     <td>
		  <input name="memResident1" size="70" value="<%=memResident1%>" maxlength="100">
		 </td>
		 </tr>
		 <tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">주민번호2</font></td>
		 <td>
		  <input name="memResident2" size="70" value="<%=memResident2%>" maxlength="100">
		 </td>
	    </tr>
	    <tr>
	     <td bgcolor= "#002266"><font color = "#ffc303">적립 포인트</font></td>
	     <td>
		  <input name="memPoint" size="70" value="<%=memPoint%>" maxlength="100">
		 </td>
	    </tr>
	    <tr>
	   		<td align="center"bgcolor= "#002266" ><font color = "#ffc303">삭 제</font></td>
	    	<td colspan="3">
		  	<input name="delYn" type="radio" value="Y"<%if("Y".equals(delYn)){%>checked<%}%>>Y</input>
		  	<input name="delYn" type="radio" value="N"<%if("N".equals(delYn)){%>checked<%}%>>N</input>
		 	</td>
		</tr>			    	    
		<tr>
	     <td colspan="2" height="5"><hr/></td>
	    </tr>
		<tr>
	     <td colspan="2" height = "6">
		  <input type="button" value="수정완료" onclick="check()">
	      <input type="reset" value="다시수정"> 
	      <input type="button" value="뒤로" onclick="history.go(-1)">
		 </td>
	    </tr> 
	   </table>
	  </td>
	 </tr>
	</table>
	 <input type="hidden" name="nowPage" value="<%=nowPage %>">
	 <input type='hidden' name="memKey" value="<%=memKey1%>">
	</form> 
	</div>
</body>
</html>
