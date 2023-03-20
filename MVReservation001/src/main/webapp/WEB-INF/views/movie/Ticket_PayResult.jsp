<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>결제 처리 확인 페이지</h2>
	<script type="text/javascript">
		window.addEventListener('load', function(){
			window.opener.pay_Result('${reserveResult }');
			window.close();
		})
		
/* 		
		window.onunload = function(){	
		}
 */
	</script>
</body>

</html>