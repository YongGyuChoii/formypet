<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>    
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
    	String userID = null;
    	if (session.getAttribute("idKey") != null){
            userID = (String) session.getAttribute("idKey");
    	}
    	if (userID == null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인하세요.')");
            script.println("location.href = 'login.jsp'");    // 메인 페이지로 이동
            script.println("</script>");
    	}
    	int bbsID = 0;
    	if (request.getParameter("bbsID") != null){
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
        
		String realFolder="";
		String saveFolder = "bbsUpload";
		String encType = "utf-8";
		String map="";
		int maxSize=5*1024*1024;
		
		ServletContext context = this.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		
		MultipartRequest multi = null;
		
		multi = new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());		
		String fileName = multi.getFilesystemName("fileName");
		String bbsTitle = multi.getParameter("bbsTitle");
		String bbsContent = multi.getParameter("bbsContent");
		bbs.setBbsTitle(bbsTitle);
		bbs.setBbsContent(bbsContent);
        
        if (!userID.equals(bbs.getUserID())){
        	PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('권한이 없습니다.')");
            script.println("location.href = 'list.jsp'");
            script.println("</script>");
        }else{
    		if (request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals("")){
        		PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('모든 문항을 입력해주세요.')");
                script.println("history.back()");    // 이전 페이지로 사용자를 보냄
                script.println("</script>");
        	}else{
        		BbsDAO bbsDAO = new BbsDAO();
                int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
                if (result == -1){ // 글수정 실패시
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('글수정에 실패했습니다.')");
                    script.println("history.back()");    // 이전 페이지로 사용자를 보냄
                    script.println("</script>");
                }else{ // 글쓰기 성공시
					PrintWriter script = response.getWriter();
					if(fileName != null){
						String real = "C:\\Users\\Administrator\\git\\formypet\\formypet\\src\\main\\webapp\\bbsUpload";
						File delFile = new File(real+"\\"+bbsID+"사진.jpg");
						if(delFile.exists()){
							delFile.delete();
						}
						File oldFile = new File(realFolder+"\\"+fileName);
						File newFile = new File(realFolder+"\\"+bbsID+"사진.jpg");
						oldFile.renameTo(newFile);
					}
					script.println("<script>");
					script.println("location.href = 'list.jsp'");
					script.println("</script>");
                }
        	}	
    	}
    %>
 
</body>
</html>