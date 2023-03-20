<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko-KR">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>MVRESERVATION - 영화 상세 페이지</title>
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
	.reviewProfile{
		width: 50px;object-fit: cover;object-position: center;height: 50px; 
	}
	.reviewComment{
		outline: none;
		resize: none;
		border: none;
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

	<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<%@ include file="/WEB-INF/views/includes/sidebar.jsp"%>
	<!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>MovieInfo.jsp</h1>

		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="card mb-3 p-5 mx-auto" style="min-width: 600px; max-width: 1200px;">
            	<div class="row g-0">
              		<div class="col-md-4 " style="text-align: center;" >
                		<img src="${mvInfo.mvpos }" style="max-width: 200px;" 
                		     class="img-fluid rounded-start" alt="...">
              		</div>
              		<div class="col-md-8">
                		<div class="card-body">
                  			<h5 class="card-title" style="font-size: 30px;font-weight: bold;" >${mvInfo.mvtitle }</h5>
                  			<p class="card-text"><span style="font-size: 18px;font-weight: bold;" >예매율</span> ${mvInfo.recount }%
                  			| <span style="font-size: 18px;font-weight: bold;" ><i class="bi bi-hand-thumbs-up"></i></span>
                  			<span style="font-size: 18px;font-weight: bold;" ><i class="bi bi-hand-thumbs-down"></i></span>
                  			</p>
                  			<hr>
                  			<p class="card-text mb-1">감독 : ${mvInfo.mvdir }</p>
                  			<p class="card-text mb-1">배우 : ${mvInfo.mvact }</p>
                  			<p class="card-text mb-1">장르 : ${mvInfo.mvgenre } / 기본 : ${mvInfo.mvinfo }</p>
                  			<p class="card-text mb-1">개봉 : ${mvInfo.mvdate }</p>
                  			<a class="btn btn-sm btn-danger"
							   href="${pageContext.request.contextPath }/ticketPage?selectmovie=${mvInfo.mvcode }">예매하기</a>
                		</div>
              		</div>
            	</div>

           	
          	</div>
          	
          	<div class="card mb-3 p-5 mx-auto" style="min-width: 600px; max-width: 1200px;">
				<div class="row g-0">
              		<div class="col-12 " style="text-align: center;" >
                		<h2>관람평</h2>
              		</div>
              		<hr>
              		
              		<c:forEach items="${reviewList }" var="review">
              		<div class="col-6">
                		<div class="card-body">
                			<div class="row">
                				<div class="col-auto" >
                					<img class="rounded-circle reviewProfile" 
                					src="${pageContext.request.contextPath }/resources/assets/img/profile01.jpg" >
                				</div>
                				<div class="col">
									<h2 class="card-title p-0 mb-1"> 
                					<c:choose>
										<c:when test="${review.RVRECOMMEND == '1' }">
											<span style="font-weight: bold; color: black;">
												<i class="bi bi-hand-thumbs-up "></i>
											</span>
										</c:when>
										<c:otherwise>
											<span style="font-weight: bold; color: black;">
												<i class="bi bi-hand-thumbs-down "></i>
											</span>										
										</c:otherwise>									
									</c:choose>
									
										${review.RVMID} 
									</h2>
									<textarea class="reviewComment w-100" rows="5" readonly="readonly">${review.RVCOMMENT}</textarea>
									<h6>${review.RVDATE}</h6>
                				</div>
                			</div>
                		</div>
                		<hr>
              		</div>
					</c:forEach>
					
              		<div class="col-12 " style="text-align: center;" >
                		
                		<c:forEach begin="${pageInfo.startPageNum }" end="${pageInfo.endPageNum }" var="pageNum" step="1" >
                			<c:choose>
                				<c:when test="${pageNum == pageInfo.reviewPage }">
                					${pageNum }
                				</c:when>
                				<c:otherwise>
		                			<a href="${pageContext.request.contextPath }/movieInfo?mvcode=${mvInfo.mvcode }&reviewPage=${pageNum }">
		                				${pageNum }
		                			</a>
                				</c:otherwise>
                			</c:choose>
                			
                		</c:forEach>
                		
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

</body>

</html>