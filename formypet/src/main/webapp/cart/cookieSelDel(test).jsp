<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	//��Ű ����� ���� ��ȸ�� ��ٱ���
		String[] value = null;
		int[] productKey = null;
		int[] cartCount = null;
		String[] optionText = null;
	
	Cookie[] cookies = request.getCookies(); //��Ű ��ü �ҷ���
	if(cookies != null) { // ��Ű�� ������� ������
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("noMemCart")){ //��Ű���� ã�ƿ�
				//ã�� value ,������ ������
				value = URLDecoder.decode(cookies[i].getValue(),"UTF-8").split(",");
				productKey = new int[value.length];
				cartCount = new int[value.length];
				optionText = new String[value.length];
			    for(int k=0; k<value.length; k++){ //-������ ��ǰŰ, ����, �ɼ� �迭 ����
					cartCount[k] = Integer.parseInt(value[k].split("-")[0]);
					productKey[k] = Integer.parseInt(value[k].split("-")[1]);
					optionText[k] = value[k].split("-")[2];
				}  
			}
		}
	} else {
		
	}
		
	%>
</body>
</html>