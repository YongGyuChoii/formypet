<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 이곳에 Mgr or Bean 연결 -->
<%@page import = "java.util.*,admin.*" %>
<jsp:useBean id = "pMMgr" class = "admin.ProductManagementMgr" scope = "page" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<!-- form 태그를 통해 파일 업로드 합니다. 
		파일을 전송 하기 위해서는 form태그 속성 method 와 enctype을 다음과 같이 지정 합니다. -->
	<form name="frmName" method="post" enctype="multipart/form-data" 
	action="viewPage.jsp">
		user<br/> 
		<input name="user"><br/>
		title<br/> 
		<input name="title"><br/>
		file<br/> 
		<!-- 파일 전송 input 태그는 아래와 같이 type 속성을 file로 합니다. -->
		<input type="file" name="uploadFile"><br/>
		<input type="submit" value="UPLOAD"><br/>
	</form>
	
	
	
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
</body>
</html>