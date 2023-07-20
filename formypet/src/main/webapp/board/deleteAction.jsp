<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
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
        if (!userID.equals(bbs.getUserID())){
        	PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('권한이 없습니다.')");
            script.println("location.href = 'list.jsp'");
            script.println("</script>");
        }else{
    		
      		BbsDAO bbsDAO = new BbsDAO();
            int result = bbsDAO.delete(bbsID);
            if (result == -1){ // 글삭제 실패시
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('글삭제에 실패했습니다.')");
                script.println("history.back()");    // 이전 페이지로 사용자를 보냄
                script.println("</script>");
            }else{ // 글삭제 성공시
				PrintWriter script = response.getWriter();
				String real = "C:\\Users\\Administrator\\git\\formypet\\formypet\\src\\main\\webapp\\bbsUpload";
				String commentReal = "C:\\formypet\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\formypet\\commentUpload";
				
				File delFile = new File(real+"\\"+bbsID+"사진.jpg");
				if(delFile.exists()){
					delFile.delete(); 
            	}
				//삭제할 게시판에 작성되어있는 댓글의 사진 삭제
				File FileList = new File(commentReal);
				String fileList[] = FileList.list();
				for(int i=0; i<fileList.length; i++){
					String FileName = fileList[i];
					if(FileName.contains(bbsID+"사진")){
						File deleteFile = new File(commentReal+"\\"+FileName);
						deleteFile.delete();
					}
				}
				
				script.println("<script>");
				script.println("location.href = 'list.jsp'");
				script.println("</script>");
				
            }	
        }	
    %>
</body>
</html>