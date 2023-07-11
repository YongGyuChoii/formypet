<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Pet</title>
   <link rel="stylesheet"  href="../css/base.css">
    <link rel="stylesheet"  href="../css/adminStyle.css">
   	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
    <div id="wrap">
    <!-- header 시작-->
    <header>
        <%@include file="../admin/adminHeader.jsp"%>
      </header>
    <!--header 끝-->

    <!-- table 시작 -->
    <div class="container">
        <table class="table-body">
            <h2>매출 관리</h2>
            <thead>
            <tr>
                <th>매출 날짜</th>
                <th>매출 구분</th>
                <th>매출 내용</th>
                <th>매출 금액</th>
                <th>회원 식별키</th>        
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>James</td>
                <td>Matman</td>
                <td>(713) 123-8965</td>
                <td><a href="mailto:jmatman@stewart.com">jmatman@stewart.com</a></td>
                <td>01/13/1979</td>
            </tr>
            <tr>
                <td>Johnny</td>
                <td>Smith</td>
                <td>(713) 584-9614</td>
                <td><a href="mailto:jsmith@stewart.com">jsmith@stewart.com</a></td>
                <td>06/09/1971</td>              
            </tr>
            <tr>
                <td>Susan</td>
                <td>Johnson</td>
                <td>(713) 847-1124</td>
                <td><a href="mailto:sjohnson@stewart.com">sjohnson@stewart.com</a></td>
                <td>08/25/1965</td>
            </tr>
            <tr>
                <td>Tracy</td>
                <td>Richardson</td>
                <td>(713) 245-4821</td>
                <td><a href="mailto:trichard@stewart.com">trichard@stewart.com</a></td>
                <td>03/13/1980</td>
            </tr>
            <tr>
                <td>Tracy</td>
                <td>Richardson</td>
                <td>(713) 245-4821</td>
                <td><a href="mailto:trichard@stewart.com">trichard@stewart.com</a></td>
                <td>03/13/1980</td>
            </tr>
            <tr>
                <td>Tracy</td>
                <td>Richardson</td>
                <td>(713) 245-4821</td>
                <td><a href="mailto:trichard@stewart.com">trichard@stewart.com</a></td>
                <td>03/13/1980</td>
            </tr>
            <tr>
                <td>Tracy</td>
                <td>Richardson</td>
                <td>(713) 245-4821</td>
                <td><a href="mailto:trichard@stewart.com">trichard@stewart.com</a></td>
                <td>03/13/1980</td>
            </tr>
            <tr>
                <td>Tracy</td>
                <td>Richardson</td>
                <td>(713) 245-4821</td>
                <td><a href="mailto:trichard@stewart.com">trichard@stewart.com</a></td>
                <td>03/13/1980</td>
            </tr>
            <tr>
                <td>Tracy</td>
                <td>Richardson</td>
                <td>(713) 245-4821</td>
                <td><a href="mailto:trichard@stewart.com">trichard@stewart.com</a></td>
                <td>03/13/1980</td>
            </tr>
            <tr>
                <td>Tracy</td>
                <td>Richardson</td>
                <td>(713) 245-4821</td>
                <td><a href="mailto:trichard@stewart.com">trichard@stewart.com</a></td>
                <td>03/13/1980</td>
            </tr>
            </tbody>
        </table>
    </div>
    <!--table 끝-->
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