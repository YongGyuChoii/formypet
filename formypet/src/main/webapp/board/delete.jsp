<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="board.BoardBean"%>
<jsp:useBean id="bMgr" class="board.BoardMgr" />    
    
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
    	<%
	request.setCharacterEncoding("UTF-8");
	
	//이동된 파라미터 nowPage 와 num 을 받아서 각 변수에 대입.
		String nowPage = request.getParameter("nowPage");
	
		int num = Integer.parseInt(request.getParameter("num"));
		
		//pass 파라미터를 갖고 새로고침 한 후 pass 파라미터 가 null이 아니면
		if(request.getParameter("pass")!=null) {
			
			//pass 파라미터 변수에 저장.
			String inPass = request.getParameter("pass");
			
			//session에 저장된 bean 객체를 가져옴.
			BoardBean bean = (BoardBean) session.getAttribute("bean");
			
			//bean 객체에서 pass 값을 받아서 변수에 저장.
			String dbPass = bean.getPass();
			
			//화면에서 입력받은 pass 파라미터 와 session에서 가져온 pass 파라미터가 같으면
			if(inPass.equals(dbPass)) {				

				bMgr.deleteBoard(num);	//BoardMgr 클래스의 deleteBoard() 메서드 호출하여 해당 게시물 삭제.

				String url = "list.jsp?nowPage=" + nowPage;
				
				response.sendRedirect(url);

			} else { //두 pass가 서로 같지 않다면 아래 script 내용 실행.
		%>		
	<script type="text/javascript">
		alert("입력하신 비밀번호가 아닙니다.");
		history.back();
	</script>
		<% }
			} else {
		%>	
	<script type="text/javascript">
		function check() {
			if (document.delFrm.pass.value == "") {
				alert("패스워드를 입력하세요.");
				document.delFrm.pass.focus();
				return false;
			}
			document.delFrm.submit();
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
    <div class="container">
      <section>
	<div align="center">
			<br/><br/>
			<table width="600" cellpadding="3">
				<tr>
					<td bgcolor=#dddddd height="21" align="center">
						사용자의 비밀번호를 입력해주세요.
					</td>
				</tr>
			</table>
			<br/>
			<!-- 비밀번호를 화면에서 input 태그에 입력 받은뒤 삭제완료 버튼을 누르면 check() 자바스크립트 함수 호출 한 다음
				다시 자신 페이지인(delete.jsp)로 파라미터를 갖고 이동.(입력 받은 파라미터를 갖고 페이지를 새로고침 한다고 생각하면 됨)   -->
			<form name="delFrm" method="post" action="delete.jsp">
				<table width="600" cellpadding="2">
					<tr>
						<td align="center">
							<table>
								<tr>
									<td align="center">
										<input type="password" name="pass" size="17" maxlength="15">
									</td>
								</tr>
								<tr>
									<td><hr size="1" color="#eeeeee"/></td>
								</tr>
								<tr>
									<td align="center">
										<input type="button" value="삭제완료" class="btn btn-outline-primary" onClick="check()"> 
										<input type="button" value="뒤로" class="btn btn-outline-primary" onClick="history.go(-1)">
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
				<input type="hidden" name="num" value="<%=num%>">
			</form>
		</div>
		<%}%>
      </section>
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
    