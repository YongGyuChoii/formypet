<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
 
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"></jsp:useBean>
<jsp:setProperty name="bbs" property="bbsTitle"/>
<jsp:setProperty name="bbs" property="bbsContent"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
<title>For My Pet</title>
</head>
<body>
    <%
     
    	String userID = null;
    	if (session.getAttribute("idKey") != null){
    		userID = (String) session.getAttribute("idKey");
    	}
    	
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
        
    	
    	if (userID == null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인하세요.')");
            script.println("location.href = '../login/login.jsp'");    // 메인 페이지로 이동
            script.println("</script>");
    	}else{
    		if (bbs.getBbsTitle().equals("") || bbs.getBbsContent().equals("")){
        		PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('모든 문항을 입력해주세요.')");
                script.println("history.back()");    // 이전 페이지로 사용자를 보냄
                script.println("</script>");
        	}else{
        		BbsDAO bbsDAO = new BbsDAO();
                int bbsID = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
                if (bbsID == -1){ // 글쓰기 실패시
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('글쓰기에 실패했습니다.')");
                    script.println("history.back()");    // 이전 페이지로 사용자를 보냄
                    script.println("</script>");
                }else{ // 글쓰기 성공시
                	PrintWriter script = response.getWriter();
					if(fileName != null){
						File oldFile = new File(realFolder+"\\"+fileName);
						File newFile = new File(realFolder+"\\"+(bbsID)+"사진.jpg");
						oldFile.renameTo(newFile);
					}
                    script.println("<script>");
                    script.println("location.href = 'list.jsp'");    // 메인 페이지로 이동
                    script.println("</script>");    
                }
            }	
    	}
    %>
 
</body>
</html>