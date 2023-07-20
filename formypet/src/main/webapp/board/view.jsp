<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="comment.Comment" %>
<%@ page import="comment.CommentDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList"%>

<%
    String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("idKey") != null)
    {
        userID = (String)session.getAttribute("idKey");
    }
    int bbsID = 0;
    if (request.getParameter("bbsID") != null)
    {
        bbsID = Integer.parseInt(request.getParameter("bbsID"));
    }
    if (bbsID == 0)
    {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 글입니다')");
        script.println("location.href = 'list.jsp'");
        script.println("</script>");
    }
    Bbs bbs = new BbsDAO().getBbs(bbsID);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
    <link rel="stylesheet"  href="../css/base.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <style type="text/css">
	a, a:hover{
		color: #000000;
		text-decoration:none;
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
    <br/>
    <div class="container">
        <div>
            <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
                <thead>
                    <tr>
                        <th colspan="3" style="background-color:#eeeeee; text-align:center;">게시판 글 보기</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width:20%;">글 제목</td>
                        <td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></td>                  
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td colspan="2"><%= bbs.getUserID().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></td>
                    </tr>
                    <tr>
                        <td>작성일자</td>
                        <td colspan="2"><%= bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11, 13) + "시" 
                                + bbs.getBbsDate().substring(14,16) + "분"  %></td>
                    </tr>
                    <tr>
                        <td>내용</td>
                 <% 	
					String real = "C:\\Users\\Administrator\\git\\formypet\\formypet\\src\\main\\webapp\\bbsUpload";
					File viewFile = new File(real+"\\"+"bbsID"+"사진.jpg");
					if(viewFile.exists()){
				 %>		<td colspan="6"><br><br><img src ="../bbsUpload/<%=bbsID%>사진.jpg" border="300px" width="300px" height="300px"><br><br>
				 <% } else {%>
                        <td colspan="2" style="min-height:200px; text-align:left;"><%} %>
                        <!-- 특수문자를 제대로 출력하기위해 & 악성스크립트를 방지하기위해 -->
                        <%= bbs.getBbsContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></td>    
                    </tr>
                </tbody>
            </table>
            <a href="list.jsp" class="btn btn-primary" style="background-color:sky-blue; border:0;" >목록</a>
            <%
                if(userID != null && userID.equals(bbs.getUserID()))
                {
            %>
                <a href="update.jsp?bbsID=<%=bbsID %>" class="btn btn-primary" style="background-color:green; border:0;">수정</a>
                <a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%=bbsID %>" class="btn btn-primary" style="background-color:red; border:0;">삭제</a>
            <% } %>

            <br/><br/><br/>
        <div class="container">
    	<div>
    		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
    			<tbody>
    				<tr>
						<td align="left" bgcolor="beige">댓글</td>
					</tr>
					<tr>
					<%
						CommentDAO commentDAO = new CommentDAO();
						ArrayList<Comment> list = commentDAO.getList(bbsID);
						for(int i=0; i<list.size(); i++) {					
					%>

						<div>
							<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
								<tbody>
								<tr>
								<td align="left"><%= list.get(i).getUserID() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=list.get(i).getCommentDate().substring(0,11) + list.get(i).getCommentDate().substring(11,13) + "시" + list.get(i).getCommentDate().substring(14,16) + "분" %></td>
								<td colspan="2"></td>
								<td align="right">												
								<%
									if(list.get(i).getUserID() != null && list.get(i).getUserID().equals(userID)) {
								%>
								<form name = "p_search">
									<a type="button" onclick="nwindow(<%=bbsID %>,<%=list.get(i).getCommentID() %>)" class="btn=primary">수정</a>
								</form>
									<a onclick="return confirm('정말로 삭제하시겠습니까?')" href = "commentDeleteAction.jsp?bbsID=<%=bbsID %>&commentID=<%= list.get(i).getCommentID() %>" class="btn-primary">삭제</a>
								<% } %>
								</td>
								</tr>
								<tr><td colspan="1" align="left"><%= list.get(i).getCommentText()%>											 	
								<%				
								String commentReal = "C:\\formypet\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\formypet\\commentUpload";
								File commentFile = new File(commentReal+"\\"+bbsID+"사진"+list.get(i).getCommentID()+".jpg");
								if(commentFile.exists()){
								%>	
								<br><br><img src = "commentUpload/<%=bbsID %>사진<%=list.get(i).getCommentID() %>.jpg" border="300px" width="300px" height="300px"><br><br></td></tr>								
								<% } %>									
								</tbody>
							</table>
						</div>
					<% } %>			
    			</tbody>
    			<br/>
    		</table>
    		
 <!-- 댓글 작성 시작 -->   		

    	<div class="from-group">
    		<form method="post" encType = "multipart/form-data" action="commentAction.jsp?bbsID=<%= bbsID %>">
    			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
    				<tr>
						<td style="border-bottom:none;" valign="middle"><br><br><%=userID %></td>
						<td><input type="text" style="height:100px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name="commentText"></td>
						<td><br><br><input type="submit" class="btn btn-primary" value="댓글 작성"></td>
					</tr>
					<tr>
							<td colspan="3"><input type="file" name="fileName"></td>
					</tr>
				</table>
    		</form>
       	</div>
    	</div>
       </div>
      </div>
    </div>


    <script type="text/javascript">
	function nwindow(bbsID,commentID){
		window.name = "commentParant";
		var url= "commentUpdate.jsp?bbsID="+bbsID+"&commentID="+commentID;
		window.open(url,"","width=600,height=230,left=300");
	}
	</script>
    
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
    