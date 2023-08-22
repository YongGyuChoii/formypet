<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="admin.BuyManagementBean"%>
<%@page import="board.BoardBean"%>
<jsp:useBean id="bmgr" class="admin.BuyManagementMgr" />    
    
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
		
		int brKey = Integer.parseInt(request.getParameter("brKey"));

			//session에 저장된 bean 객체를 가져옴.
			BuyManagementBean bean = (BuyManagementBean) session.getAttribute("bean");

				bmgr.delbuy(brKey);	//BoardMgr 클래스의 deleteBoard() 메서드 호출하여 해당 게시물 삭제.
				
				String url = "buyManagement.jsp?nowPage=" + nowPage;
				
				response.sendRedirect(url);
		%>		
	<script type="text/javascript">

			document.delFrm.submit();

	</script>
</head>
<body>
    <div id="wrap">
    <!-- header 시작-->
    <header>
        <%@include file="../admin/adminHeader.jsp"%>
    </header>
    <!--header 끝-->

    <!--main 시작-->
    <div class="container">
      <section>
	<div align="center">
			<br/><br/>
			<table width="600" cellpadding="3">
				<tr>
				</tr>
			</table>
			<!-- 비밀번호를 화면에서 input 태그에 입력 받은뒤 삭제완료 버튼을 누르면 check() 자바스크립트 함수 호출 한 다음
				다시 자신 페이지인(delete.jsp)로 파라미터를 갖고 이동.(입력 받은 파라미터를 갖고 페이지를 새로고침 한다고 생각하면 됨)   -->
			<form name="delFrm" method="post" action="buyDelete.jsp">
				<table width="600" cellpadding="2">
					<tr>
						<td align="center">
							<table>
								<tr>
									<td><hr size="1" color="#eeeeee"/></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
				<input type="hidden" name="num" value="<%=brKey%>">
			</form>
		</div>
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
    