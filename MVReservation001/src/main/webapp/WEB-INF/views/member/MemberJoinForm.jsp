<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko-KR">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>MVRESERVATION - 회원가입페이지</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link
	href="${pageContext.request.contextPath }/resources/assets/img/favicon.png"
	rel="icon">
<link
	href="${pageContext.request.contextPath }/resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/assets/vendor/quill/quill.snow.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/assets/vendor/quill/quill.bubble.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/assets/vendor/simple-datatables/style.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link
	href="${pageContext.request.contextPath }/resources/assets/css/style.css"
	rel="stylesheet">

<!-- =======================================================
  * Template Name: NiceAdmin - v2.4.1
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <script type="text/javascript">
  		var reMsg = '${redirectMsg}';
  		if(reMsg.length > 0){
  			alert(reMsg);
  		}
  </script>
  
</head>

<body>

	<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<%@ include file="/WEB-INF/views/includes/sidebar.jsp"%>
	<!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>MemberJoinForm.jsp</h1>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row justify-content-center">
				<div class="col d-flex flex-column align-items-center justify-content-center" style="max-width:1000px;" >

					<div class="card mb-3">
						<div class="card-body">
							<div class="pt-4 pb-2">
								<h5 class="card-title text-center pb-0 fs-4">회원가입</h5>
								<p class="text-center small">회원 정보를 입력해주세요.</p>
							</div>

							<form class="row g-3" action="${pageContext.request.contextPath }/memberJoin" 
							      method="post" enctype="multipart/form-data" onsubmit="return joinFormCheck(this)">

								<div class="col-md-6">
									<label for="inputMid" class="form-label">아이디</label>
									<span class="small" id=idCheckMsg>중복확인 메세지</span>
									<input type="text" name="mid" class="form-control" id="inputMid">
								</div>
								<div class="col-md-6">
									<label for="inputMpw" class="form-label">비밀번호</label>
									<input type="password" name="mpw" class="form-control" id="inputMpw">
								</div>
								<div class="col-md-6">
									<label for="inputMname" class="form-label">이름</label>
									<input type="text" name="mname" class="form-control" id="inputMname">
								</div>
								<div class="col-md-6">
									<label for="inputMbirth" class="form-label">생년월일</label>
									<input type="date" name="mbirth" class="form-control" id="inputMbirth">
								</div>
								<div class="col-12">
									<label for="inputMaddr" class="form-label">주소</label>
									<input type="text" name="maddr" class="form-control" id="inputMaddr">
								</div>

								<div class="col-md-5">
									<label for="inputMemailId" class="form-label">이메일아이디</label>
									<input type="text" name="memailid" class="form-control" id="inputMemailId">
								</div>
								<div class="col-md-5">
									<label for="inputMemailDomain" class="form-label">이메일도메인</label>
									<input type="text" name="memaildomain" class="form-control" id="inputMemailDomain">
								</div>
								<div class="col-md-2">
									<label for="inputSelectDomain" class="form-label">도메인선택</label>
									<select id="inputSelectDomain" class="form-select" onchange="selectDomain(this)">
										<option selected>직접입력</option>
										<option value="naver.com">네이버</option>
										<option value="daum.net">다음</option>
										<option value="google.com">구글</option>
									</select>
								</div>

								<div class="col-12">
									<label for="inputMfile" class="form-label">프로필이미지</label>
									<input type="file" name="mfile" class="form-control" id="inputMfile">
								</div>

								<div class="text-center">
									<button type="submit" class="btn btn-primary">회원가입</button>
									<button type="reset" class="btn btn-secondary">다시작성</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<script src="${pageContext.request.contextPath }/resources/assets/vendor/tinymce/tinymce.min.js"></script>

	<!-- Template Main JS File -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/main.js"></script>
		
	<script type="text/javascript">
		function joinFormCheck(joinForm){
			var formMid = joinForm.mid;
			if(formMid.value == 0){
				alert('아이디를 입력 해주세요!');
				formMid.focus();
				return false;
			}
			var formMpw = joinForm.mpw;
			if(formMpw.value == 0){
				alert('비밀번호를 입력 해주세요!');
				formMpw.focus();
				return false;
			}
			var formMname = joinForm.mname;
			if(formMname.value == 0){
				alert('이름을 입력 해주세요!');
				formMname.focus();
				return false;
			}
		}
		
		function selectDomain(selDomain){
			var selectDomainVal = selDomain.value;
			document.getElementById('inputMemailDomain').value = selectDomainVal;
		}
		
		
	</script>	

</body>

</html>