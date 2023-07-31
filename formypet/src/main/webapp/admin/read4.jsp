<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="admin.ReviewManagementBean"%>
<jsp:useBean id="rmmgr" class="admin.ReviewManagementMgr" />
<%
	  request.setCharacterEncoding("UTF-8");

	  int rvKey = Integer.parseInt(request.getParameter("rvKey"));

	  
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  
	  ReviewManagementBean bean = rmmgr.getrm(rvKey);//게시물 가져오기
	  //bean 객체 에서 getter 메서드를 이용하여 파라미터를 가져와서 화면에 출력하기 위해 각 변수에 대입한다.
	  String rvTitle = bean.getRvTitle();
	  String rvContents = bean.getRvContents();
      String rvPhoto = bean.getRvPhoto();
	  int rvScore = bean.getRvScore();
	  String optionValue = bean.getOptionValue(); 
	  int memKey = bean.getMemKey();
	  int rvKey1 = bean.getRvKey();
 
	  session.setAttribute("bean", bean);//상품을 세션에 저장 review db

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><%=rvTitle %></title>
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
	  <td bgcolor= "#002266" align="center"><font color = "#ffc303"font-weight= "800"><%=rvTitle %></font></td>
	 </tr>
	 <tr>
	  <td colspan="2">
	   <table cellpadding="3" cellspacing="0" width="100%">
	  <tr> 
	  	<td align="center"  bgcolor= "#002266" ><font color = "#ffc303">리뷰 번호</font></td>
	  	<td colspan="3"><%=rvKey1%></td>
	 </tr> 
	 <tr> 
	  	<td align="center"  bgcolor= "#002266" ><font color = "#ffc303">회원 번호</font></td>
	  	<td colspan="3"><%=memKey%></td>
	 </tr>
	 <tr>
	  	<td align="center" bgcolor= "#002266" ><font color = "#ffc303">리뷰 제목</font></td>
	  	<td colspan="3"><%=rvTitle%></td>
	 </tr>
	 <tr> 
	    <td align="center"bgcolor= "#002266" ><font color = "#ffc303">리뷰 내용</font></td>
	    <td  colspan="3"><%=rvContents%></td>
	 </tr>	 
	 <tr> 
	     <td align="center"bgcolor= "#002266" ><font color = "#ffc303">리뷰 사진</font></td>
	     <td>
	     <% if(	rvPhoto !=null && !rvPhoto.equals("")) {%>
	  		<%=rvPhoto%>
	  		 <%} else{%> 등록된 파일이 없습니다.<%}%></td>
	 </tr>
	   <tr> 
	    <td align="center"bgcolor= "#002266" ><font color = "#ffc303">리뷰 별점</font></td>
	    <td colspan="3"><%=rvScore%></td>
	 </tr> 
	 
	   </table>
	  </td>
	 </tr>
	 <tr>
	  <td align="center" colspan="2"> 
	 <hr/>
	 [ <a href="../admin/reviewManagement.jsp" >리뷰 목록</a> | 
	 <a href="../admin/rvdelete.jsp?nowPage=<%=nowPage%>&rvKey=<%=rvKey%>" >삭 제</a> ]
	  </td>
	 </tr>
	</table>
	</form>
	
	<form name="listFrm" method="post" action="../admin/reviewManagement.jsp">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<%if(!(keyWord==null || keyWord.equals(""))){ %>
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
		<%}%>
	</form>
</body>
</html>