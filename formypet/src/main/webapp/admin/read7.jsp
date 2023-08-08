<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="admin.CsManagementBean"%>
<jsp:useBean id="cmmgr" class="admin.CsManagementMgr" />
<%
	  request.setCharacterEncoding("UTF-8");

	  int memKey = Integer.parseInt(request.getParameter("memKey"));
	  
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  
	  CsManagementBean bean = cmmgr.getcbean(memKey);//db 가져오기
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
	  session.setAttribute("bean",bean);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><%=memKey%></title>
	<link href="../css/admin2.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function list(){
		   	
			document.listFrm.submit();
 
	</script>
</head>
<body>
	<br/><br/>
	<table align="center" width="1500" cellspacing="3">
	 <tr>
	  <td bgcolor= "#002266" align="center"><font color = "#ffc303"font-weight= "800"><%=memKey%></font></td>
	 </tr>
	 <tr>
	  <td colspan="2">
	   <table cellpadding="3" cellspacing="0" width="100%">
	  <tr> 
	  	<td align="center"  bgcolor= "#002266" ><font color = "#ffc303">번 호</font></td>
	  	<td colspan="3"><%=memKey1%></td>
	 </tr> 
	 <tr> 
	  	<td align="center"  bgcolor= "#002266" ><font color = "#ffc303">아이디</font></td>
	  	<td colspan="3"><%=memId%></td>
	 </tr>
	 <tr> 
	  	<td align="center"  bgcolor= "#002266" ><font color = "#ffc303">이 름</font></td>
	  	<td colspan="3"><%=memName%></td>
	 </tr>
	 <tr>
	  	<td align="center" bgcolor= "#002266" ><font color = "#ffc303">비밀번호</font></td>
	  	<td colspan="3"><%=memPw %></td>
	 </tr>
	 <tr> 
	    <td align="center"bgcolor= "#002266" ><font color = "#ffc303">전화번호</font></td>
	    <td  colspan="3">010-<%=memPhone1%>-<%=memPhone2%></td>
	 </tr>
	 <tr>
	    <td align="center" bgcolor= "#002266" ><font color = "#ffc303">이메일</font></td>
	    <td colspan="3"><%=memEmail1%>@<%=memEmail2 %></td>
	 </tr>
	 <tr> 
	    <td align="center"bgcolor= "#002266" ><font color = "#ffc303">주소</font></td>
	    <td colspan="3"><%=memAddress%></td>
	 </tr>
	 <tr> 
	    <td align="center"bgcolor= "#002266" ><font color = "#ffc303">상세주소</font></td>
	    <td colspan="3"><%=memAddress2%></td>
	 </tr>
	 <tr> 
	    <td align="center"bgcolor= "#002266" ><font color = "#ffc303">주민번호</font></td>
	    <td colspan="3"><%=memResident1%>-<%=memResident2%></td>
	 </tr>
	 	 <tr> 
	    <td align="center"bgcolor= "#002266" ><font color = "#ffc303">적립 포인트</font></td>
	    <td colspan="3"><%=memPoint%></td>
	 </tr>
	 <tr> 
	    <td align="center"bgcolor= "#002266" ><font color = "#ffc303">삭제</font></td>
	    <td colspan="3">
	    <input name="delYn" type="radio" value="Y"<%if("Y".equals(delYn)){%>checked<%}%>>Y</input>
		 <input name="delYn" type="radio" value="N"<%if("N".equals(delYn)){%>checked<%}%>>N</input>
		</td>
	 </tr>
	   </table>
	  </td>
	 </tr>
	 <tr>
	  <td align="center" colspan="2"> 
	 <hr/>
	 [ <a href="../admin/csManagement.jsp" >리스트</a> | 
	 <a href="../admin/csupdate.jsp?nowPage=<%=nowPage%>&memKey=<%=memKey%>" >수 정</a> ]
	  </td>
	 </tr>
	</table>
	</form>
	
	<form name="listFrm" method="post" action="../admin/csManagement.jsp">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<%if(!(keyWord==null || keyWord.equals(""))){ %>
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
		<%}%>
	</form>
</body>
</html>