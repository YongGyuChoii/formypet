<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardBean"%>

<% 	
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  
	  BoardBean bean = (BoardBean)session.getAttribute("bean");
	  String subject = bean.getSubject();
	  String name = bean.getName(); 
	  String content = bean.getContent();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/list.css">
    <link rel="stylesheet"  href="../css/base.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    <style>
    	h2 {
        font-weight: bold;
    	color: #2b2b2b;
  		font-size: 50px;
    	}
    
        table.table2{
                border-collapse: separate;
                border-spacing: 1px;
                text-align: left;
                line-height: 1.5;

                margin : 30px 10px;
        }
        table.table2 tr {
                 width: 50px;
                 padding: 10px;
                font-weight: bold;
                vertical-align: top;
                border-bottom: 1px solid #ccc;
        }
        table.table2 td {
                 width: 100px;
                 padding: 10px;
                 vertical-align: top;
				border-bottom: 1px solid #ccc;
                 font-size: 14px;
        }

 
</style>
    <script>
		//패스워드 가 입력 되었는지 확인하는 check() 함수
		function check() {
		   if (document.updateFrm.pass.value == "") {
			 alert("수정을 위해 패스워드를 입력하세요.");
			 document.updateFrm.pass.focus();
			 return false;
			 }
		   document.updateFrm.submit();
		}
	</script>
</head>
<body>
    <div id="wrap">
    <!-- header 시작-->
    <header>
        <%@include file="/base/header.jsp"%>
    </header>
    <!--header 끝-->

    <!--main 시작-->
    <br/><br/>
    <div class="container" align="center">
    <br/>
    <form name="updateFrm" method="post" action="boardUpdate">
		<div>
		<h2>Post Update</h2>
		</div>
	<!-- boardUpdate 로 url맵핑된 서블릿으로 이동한다. -->

    <table  style="padding-top:50px" align=center width=1200 border=0 cellpadding=2 >
	 <tr>
	  <td>
       <table class = "table2"> 
 	 	<tr>
 	 	<hr/>
        <td>제  목</td>
        <td><input type="text" name="subject" size=20 maxlength=10 value="<%=subject %>"></td>
        </tr> 	
	     
	    <tr> 
	     <td>내 용</td>
	     <td><textarea name="content" cols=150 rows=15><%=content%></textarea></td>
	    </tr>
		
	 	 <tr>
          <td>비밀번호</td>
          <td><input type="password" name="pass" size=20 maxlength=10 placeholder="비밀번호가 필요합니다."></td>
         </tr>
		
		<tr>
		 <td><input type="button" class="btn btn-outline-primary" value="리스트" onClick="javascript:location.href='list.jsp'"></td>
		 <td align="right"><input type="button" class="btn btn-outline-primary" value="수정완료" onClick="check()"></td>
	    </tr> 
	   </table>
	  </td>
	 </tr>
	</table>
	 <input type="hidden" name="nowPage" value="<%=nowPage %>">
	 <input type='hidden' name="num" value="<%=num%>">
	 <input type="hidden" name="name" value="<%=name%>">
	 <input type="hidden" name="memKey" value="<%=memKey%>">
	</form> 
	</div>
    </div>
    <!--main 끝-->

    <!-- 오른쪽 맨위 맨아래 화살표 -->
    	<%@include file="/base/rightAside.jsp"%>
    <!-- 오른쪽 맨위 맨아래 화살표 끝 -->
    
    <!-- footer 시작-->
    <footer id="footer">
      	<%@include file="/base/footer.jsp"%>
    </footer>
    <!-- footer 끝.-->
    </div>
</body>
</html>
    