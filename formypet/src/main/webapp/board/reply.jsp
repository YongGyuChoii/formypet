<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="board.BoardBean" scope="session"/>

<%
	  String nowPage = request.getParameter("nowPage");
	  String subject = bean.getSubject();
	  String content = bean.getContent();
	  
	  String memId = (String)session.getAttribute("idkey2");   
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file = "/base/icon.jsp" %>
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
		<form name="postFrm" method="post" action="boardReply">
		<div>
		<h2>REPLY</h2>
		</div>
        <table  style="padding-top:50px" align=center width=1200 border=0 cellpadding=2 >
                <tr>
                <td bgcolor=white>
                <table class = "table2">
                        <tr>
                        <hr/>
                        <td>제  목</td>
		  <td><input name="subject" size=60 maxlength=10 value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re : <%=subject%>"></td>
		  </tr>
 
                        <tr>
                        <td>내  용</td>
                        <td><textarea name="content" cols=150 rows=15><%=content %>
		========답변 글을 쓰세요.=======
		</textarea></td>
                        </tr>
	 	
	 	  			 <tr>
                        <td>비밀번호</td>
                        <td><input type="password" name="pass" size=20 maxlength=10></td>
                     </tr>
                        
					<tr>
					<td><input type="button" class="btn btn-outline-primary" value="뒤로" onClick="history.back()"></td>
					<td align="right"><input type="button" class="btn btn-outline-primary" value="등록" onClick="javascript:check()"></td>
					</tr>	    				
  
                </table>
                </td>
                </tr>
        </table>
	 <input type="hidden" name="nowPage" value="<%=nowPage%>">
	 <input type="hidden" name="ref" value="<%=bean.getRef()%>">
	 <input type="hidden" name="pos" value="<%=bean.getPos()%>">
	 <input type="hidden" name="depth" value="<%=bean.getDepth()%>">
	 <input type="hidden" name="memKey" value="<%=memKey%>">
    	 <input type="hidden" name="name" value="<%=memId%>">
        </form>
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
<script>

function check() {
    if (document.postFrm.content.value == ""||document.postFrm.pass.value == "" ) {
  alert("모든 문항을 입력해주세요.");
  document.postFrm.content.focus();
  return;
    }
 document.postFrm.submit();
}

</script>