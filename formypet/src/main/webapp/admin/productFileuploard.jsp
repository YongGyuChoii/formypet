<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*,admin.*" %>
<jsp:useBean id = "pMMgr" class = "admin.ProductManagementMgr" scope = "page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>uploard 공간 추가</p>
		<!-- 
				String saveFolder = "C:/jsp/formypet/src/main/webapp/filestorage"; //파일저장 db경로 따로 추가
				String encType = "UTF-8"; //인코딩 타입
				int maxSize = 10*1024*1024;//최대 용량 10Mb 로 설정
				
				ServletContext context = getServletContext();
				ArrayList fileSaveName = new ArrayList(); //product_file fileSaveName
				ArrayList fileOrignalName = new ArrayList(); //product_file fileOrignalName
				
				String productName= ""; 
				String productComment= ""; 
				String productInfo= "";
				String productDetail = "";
				String productCaution = "";
				int productPrice = 0;
				int productSalePrice = 0;
				String productKind = "";
				String productImg = "";
				int categoryKey = "";
				int size = "";
				int productKey = "";
				
				
				try{
					//MultipartRequest 객체를 이용하여 파일 업로드 처리를 합니다.
					//MultipartRequest 객체를 사용하려면 WEB-INF/lib 폴더 경로에 cos.jar 파일이 존재해야 합니다.
					MultipartRequest multi = new MultipartRequest( request,saveFolder,maxSize,encType,new DefaultFileRenamePolicy());
															   
					productName = multi.getParameter("productName");
					productComment = multi.getParameter("productComment");
					productPrice = multi.getParameter("productPrice");
					productSalePrice = multi.getParameter("productSalePrice");
					productKind = multi.getParameter("productKind");
					categoryKey = multi.getParameter("categoryKey");
					size = multi.getParameter("size ");
					productKey = multi.getParameter("productKey");
					
					Enumeration files = multi.getFileNames();
					while(files.hasMoreElements()){
					   String name = (String)files.nextElement();
					   fileSaveName.add(multi.getFilesystemName(name));
					   fileOrignalName.add(multi.getOriginalFileName(name));
			}
			-->
			<body bgcolor="#FFFFCC">
				<div align="center">
				<br/><br/>
				<table width="600" cellpadding="3">
					<tr>
						<td height="25" align="center">상품 추가</td>
					</tr>
				</table>
				<br/>
				<!-- form 태그의 action 이 BoardPostSevlet 클래스의 url 맵핑 을 찾아서 이동한다. -->
				<form name="postFrm" method="post" action="boardPost" enctype="multipart/form-data">
				<table width="600" cellpadding="3" align="center">
					<tr>
						<td align=center>
						<table align="center">
							<tr>
								<td>상품 이름</td>
								<td>
								<input name="productName" size="30" maxlength="30"></td>
							</tr>
							<tr>
								<td>상품 내용</td>
								<td>
								<input name="productComment" size="30" maxlength="30"></td>
							</tr>
							<tr>
								<td>상품 가격</td>
								<td><input name="productComment" size="30" maxlength="30"></td>
							</tr>
							<tr>
								<td>상품 할인 가격</td>
								<td><input type="password" name="pass" size="15" maxlength="15"></td>
							</tr>
							<tr>
							 <tr>
				     			<td>상품 개수</td> 
				     			<td><input type="file" name="filename" size="50" maxlength="50"></td>
				    		</tr>
				 			<tr>
				 				<td>애완동물 종 선택</td>
				 				<td> HTML<input type=radio name="contentType" value="HTTP" >&nbsp;&nbsp;&nbsp;
				  			 	TEXT<input type=radio name="contentType" value="TEXT" checked>
				  			 	</td>
				 			</tr>
				 			<tr>
				     			<td>상품 대표 이미지</td> 
				     			<td><input type="file" name="filename" size="50" maxlength="50"></td>
				    		</tr>
				    		<tr>
				     			<td>상품 카테고리</td> 
				     			<td><input type="file" name="filename" size="50" maxlength="50"></td>
				    		</tr>
				    		<tr>
				     			<td>상품 사이즈</td> 
				     			<td><input type="file" name="filename" size="50" maxlength="50"></td>
				    		</tr>
				    		<tr>
				     			<td>상품 키</td> 
				     			<td><input type="file" name="filename" size="50" maxlength="50"></td>
				    		</tr>
							<tr>
								<td colspan="2"><hr/></td>
							</tr>
							<tr>
								<td colspan="2">
									 <input type="submit" value="등록">
									 <input type="reset" value="다시쓰기">
									 <input type="button" value="리스트" onClick="javascript:location.href='list.jsp'">
								</td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				<!-- 게시물 작성자의 ip주소 를 getRemoteAddr() 메서드를 이용하여 가져와서 입력한다. -->
				<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
				</form>
				</div>
			
			
			
			
</body>
</html>