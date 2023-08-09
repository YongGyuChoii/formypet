<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%     
    String memId = (String)session.getAttribute("idkey2");   
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
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <style>
    	h2 {
        font-weight: bold;
    	color: #2b2b2b;
  		font-size: 30px;
  		text-decoration: underline;
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
		<form name="postFrm" method="post" action="boardPost" enctype="multipart/form-data">
		<div>
		<h2>INQUIRY</h2>
		</div>
        <table  style="padding-top:50px" align=center width=1200 border=0 cellpadding=2 >
                <tr>
                <td bgcolor=white>
                <table class = "table2">             
                        <tr>
                        <td>제  목</td>
                        <td><select name="subject" onchange="subDisplay(this.form)" width="390px";>
                        <option value="[상품] 상품관련 문의">[상품] 상품관련 문의</option>
                        <option value="[배송] 배송관련 문의">[배송] 배송관련 문의</option>
                        <option value="[주문취소] 주문취소 문의">[주문취소] 주문취소 문의</option>
                        <option value="[주소변경] 주소변경 문의">[주소변경] 주소변경 문의</option>  
                        <option value="[반품/환불] 반품/환불 문의">[반품/환불] 반품/환불 문의</option>        
                        <option value="[기타] 기타 문의">[기타] 기타 문의</option>                                                                                                                    
                        </select>
                        </td>
                        </tr>
 
                        <tr>
                        <td>내  용</td>
                        <td><textarea name="content" cols=150 rows=15 placeholder="궁금한 점이 있으시다면 문의를 남겨주세요."></textarea></td>
                        </tr>
 							           
           				<tr>
	    	 			<td>파일찾기</td> 
	     				<td><input type="file" name="filename" size="50" maxlength="50"></td>
	    				</tr>
	    				
	 					<tr>
		 				<td>내용타입</td>
		 				<td> HTML<input type=radio name="contentType" value="HTTP" >&nbsp;&nbsp;&nbsp;
		  			 	TEXT<input type=radio name="contentType" value="TEXT" checked>
		  			 	</td>
	 					</tr>
	 	
	 	                <tr>
                        <td>비밀번호</td>
                        <td><input type="password" name="pass" size=20 maxlength=10></td>
                        </tr>
                        
					<tr>
					<td><input type="button" class="btn btn-dark" value="리스트" onClick="javascript:location.href='list.jsp'"></td>
					<td align="right"><input type="submit" class="btn btn-dark" value="등록"></td>
					</tr>	    				
  
                </table>
                </td>
                </tr>
        </table>
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