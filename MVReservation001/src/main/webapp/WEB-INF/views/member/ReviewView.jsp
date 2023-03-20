<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko-KR">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>MVRESERVATION - 관람평 확인 페이지</title>
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
	
	<style type="text/css">
	.recommendBtn{
		border: 3px #6c757d solid; 
	}
	.recommendBtn:focus, .recommendBtn:hover{
		border-color: #dc3545 ; 
	} 
	.recommendBtn:active {
		border-color: #dc3545
	}
	</style>
	
  <script type="text/javascript">
  		var reMsg = '${redirectMsg}';
  		if(reMsg.length > 0){
  			alert(reMsg);
  		}
  </script>
</head>

<body>
	<main id="main" class="main mt-2 mx-0">
		<div class="pagetitle">
			<h1>ReviewView.jsp</h1>
		</div>
		<!-- End Page Title -->
		<section class="section">
			<div class="row mx-auto" style="width: 700px;">
				<div class="col-12">
					<div class="card mb-3">
						<div class="row g-0">
							<div class="col p-3" style="text-align: center; max-width: 150px;" >
								<img 
									src="${param.mvpos }"
									class="img-fluid rounded-start" alt="...">
							</div>
							<div class="col p-3 px-1">
								<div class="card-body pb-0">
									<h5 class="card-title p-1"
										style="font-size: 20px; font-weight: bold;">${param.mvtitle }</h5>
									<p class="card-text mb-1">
										예매번호 <span style="font-weight: bold; color: black;">${review.rvrecode }</span>
									</p>
									<p class="card-text mb-1">
									<c:choose>
										<c:when test="${review.rvrecommend == '1' }">
											<span style="font-weight: bold; color: black;">
												<i class="bi bi-hand-thumbs-up "></i> 좋았어요~!
											</span>
										</c:when>
										<c:otherwise>
											<span style="font-weight: bold; color: black;">
												<i class="bi bi-hand-thumbs-down "></i>별로에요...
											</span>										
										</c:otherwise>									
									</c:choose>
									</p>									
									<p class="card-text mb-1">
										관람평 <span style="font-weight: bold; color: black;">${review.rvcomment }</span>
									</p>
									<p class="card-text mb-1">
										작성자 <span style="font-weight: bold; color: black;">${review.rvmid }</span>
									</p>
									<p class="card-text mb-1">
										작성일 <span style="font-weight: bold; color: black;">${review.rvdate }</span>
									</p>
									<button type="button" class="mt-3 btn btn-secondary " onclick="window.close()">창닫기</button>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>

		</section>
	</main>
	<!-- End #main -->

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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	
	<script type="text/javascript">
		function selectRecommend(checkVal){
			
			if(checkVal == '1'){
				$("#recommendGood").removeClass('btn-outline-primary').addClass('btn-primary');
				$("#recommendBad").removeClass('btn-danger').addClass('btn-outline-danger');
			} else {
				$("#recommendGood").removeClass('btn-primary').addClass('btn-outline-primary');
				$("#recommendBad").removeClass('btn-outline-danger').addClass('btn-danger');
			}
			
		}
	
		function reviewForm(formObj){
			var rvrecode = formObj.rvrecode.value;
			var rvrecommend = formObj.rvrecommend.value;
			var rvcomment = formObj.rvcomment.value;
			if(rvrecommend.length == 0){
				alert('관람평 추천을 선택해주세요');
				return false;
			}			
			
			
			$.ajax({
				url :"${pageContext.request.contextPath }/reviewWrite",
				type : "post",
				data : { "rvrecode" : rvrecode, "rvrecommend" : rvrecommend, "rvcomment" : rvcomment  },
				async:false,
				success : function(result){
					if(result == "N_login"){
						alert('로그인 후에 다시 작성해주세요!');
						window.opener.location.reload();
					} else if(result == '1'){
						alert('관람평이 등록 되었습니다.');
						window.opener.location.reload();
					} else {
						alert('관람평이 등록에 실패하였습니다.\n다시 확인해주세요!');
					}
				}
				
			})
			window.close();
			return false;
		}
		
	
	</script>
	
	
	
</body>

</html>