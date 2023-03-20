<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입 페이지</h1>
	<form action="${pageContext.request.contextPath }/memJoin" 
	      method="post">
		아이디 : <input type="text" name="mid"><br>
		비밀번호 : <input type="text" name="mpw"><br>
		이름 : <input type="text" name="mname"><br>
		생년월일 : <input type="text" name="mbirth"><br>
		<input type="submit" value="회원가입">
	</form>
	
	
</body>
</html>