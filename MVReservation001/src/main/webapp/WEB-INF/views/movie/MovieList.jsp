<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko-KR">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>MVRESERVATION - 영화목록페이지</title>
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
	
	.listTitle{
  		overflow: hidden;
  		text-overflow: ellipsis;
  		white-space: nowrap;
  		width: 100%;
  		display: inline-block;
  	}
  	.mvgrade{
		line-height: 25px;
    	width: 25px;
    	position: absolute;
    	height: 25px;
    	left: 10px;
    	top: 55px;  	
  	}
	</style>
	
	
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
			<h1>MovieList.jsp</h1>

		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row mx-auto" style="min-width: 700px; max-width: 1200px;" >
				
			<c:forEach items="${mvList}" var="movie" varStatus="status">
				<div class="col-3">
					<div class="card">
						<div class="card-body p-2">
							<c:choose>
								<c:when test="${status.index  < 4 }">
									<h5 class="card-title py-2 mb-2 bg-danger text-white" style="text-align: center;" >No.${status.index + 1 }</h5>
								</c:when>
								<c:otherwise>
									<h5 class="card-title py-2 mb-2 bg-secondary text-white" style="text-align: center;" >No.${status.index + 1 }</h5>
								</c:otherwise>							
							</c:choose>
							
							<c:set value="${fn:split(movie.mvinfo,',')[0] }" var="mvgrade"></c:set>
							<c:choose>
								<c:when test="${mvgrade == '12' }">
									<span class="p-0 badge rounded-circle bg-info mvgrade" >${mvgrade }</span>
								</c:when>
								<c:when test="${mvgrade == '15' }">
									<span class="p-0 badge rounded-circle bg-warning mvgrade" >${mvgrade }</span>
								</c:when>
								<c:when test="${mvgrade == '18' }">
									<span class="p-0 badge rounded-circle bg-danger mvgrade" >${mvgrade }</span>
								</c:when>
								<c:otherwise>
									<span class="p-0 badge rounded-circle bg-success mvgrade" >${mvgrade }</span>
								</c:otherwise>
							</c:choose>
							
							<a href="${pageContext.request.contextPath }/movieInfo?mvcode=${movie.mvcode }">
							<img class="img-fluid" 
							     alt="" src="${movie.mvpos }">
							</a>
							<h6 class="listTitle mt-2 mb-0" style="color: #012970; font-weight: 700;" title="${movie.mvtitle }" >${movie.mvtitle }</h6>
							<p class="small mb-0">예매율&nbsp;
								<span class="text-success pt-1 fw-bold">${movie.recount }%</span>
							</p>
							<p class="small mb-1">${movie.mvdate } 개봉</p>
							<a class="btn btn-sm btn-danger"
							   href="${pageContext.request.contextPath }/ticketPage?selectmovie=${movie.mvcode }">예매하기</a>
						</div>
					</div>
				</div>
			</c:forEach>				

								
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