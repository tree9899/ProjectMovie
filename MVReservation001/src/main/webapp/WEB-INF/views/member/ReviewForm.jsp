<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko-KR">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>MVRESERVATION - 관람평 작성 페이지</title>
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
			<h1>ReviewForm.jsp</h1>
		</div>
		<!-- End Page Title -->
		<section class="section">
		<div class="card mx-auto " style="width: 700px;" >
		<form onsubmit="return reviewForm(this)" >
			<input type="hidden" name="rvrecode" value="${param.recode }">
            <div class="card-header">
            	<h2 class="card-title mb-0 py-1" style="text-align: center;font-size: 30px;font-weight: bold;">${param.mvtitle }</h2>
            </div>
            <div class="card-body pb-1">
             	<div class="row p-3"  style="text-align: center;">
             		<div class="col d-flex align-items-center">
             			<label class="form-label btn btn-outline-primary btn-lg mx-auto p-3" 
             				   onclick="selectRecommend('1')" id="recommendGood" tabindex="-1">
             				<i class="bi bi-hand-thumbs-up "></i> 좋았어요~!
             				<input class="d-none"  type="radio" value='1' name="rvrecommend">
             			</label>
             		</div>
             		<div class="col">
             		<img src="${pageContext.request.contextPath }/resources/assets/img/profile01.jpg" 
	                style="width: 36px; object-fit: cover; object-position: center; " alt="Profile" class="rounded-circle">
             			<p class="mb-0">${sessionScope.loginId }</p>
             		</div>
             		<div class="col d-flex align-items-center">
             			<label class="form-label btn btn-outline-danger btn-lg  mx-auto p-3" 
             			       onclick="selectRecommend('0')" id="recommendBad" tabindex="-1">
             				<i class="bi bi-hand-thumbs-down"></i> 별로에요...
             				<input class="d-none" type="radio" value='0' name="rvrecommend">
             			</label>
             		</div>
	             	<div class="col-12 mt-2">
	             		<div>
	             			<textarea class="form-control" rows="5" name="rvcomment"></textarea>
	             		</div>
	             	</div>
	             	</div>
            </div>
            <div class="card-footer px-4 " style="text-align: center;">
              <button type="submit" class="btn btn-primary " >관람평 등록</button>
              <button type="button" class="btn btn-secondary " onclick="window.close()">창닫기</button>
            </div>
            </form>
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