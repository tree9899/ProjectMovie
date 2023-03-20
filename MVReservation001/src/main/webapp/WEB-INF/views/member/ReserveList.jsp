<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html lang="ko-KR">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>MVRESERVATION - 예매내역 조회 페이지</title>
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
			<h1>ReserveList.jsp</h1>

		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row mx-auto" style="max-width: 1200px;min-width: 700px; "  >
				<c:set var="nowDate" value="<%=new Date() %>"></c:set>
				<c:forEach items="${reList }" var="reInfo" >
				<fmt:parseDate value="${reInfo.REDATE }" pattern="yyyy-MM-dd HH:mm" var="reserveDate" ></fmt:parseDate>
				<div class="col-12">
					<div class="card mb-3">
            			<div class="row g-0">
              				<div class="col-2 p-3" style="text-align: center;">
              				<a href="${pageContext.request.contextPath }/movieInfo?mvcode=${reInfo.MVCODE }">
                				<img style="max-width: 120px;" src="${reInfo.MVPOS }" class="img-fluid rounded-start" alt="...">
                			</a>
              				</div>
             				<div class="col p-3 px-1">
                				<div class="card-body pb-0">
                  					<h5 class="card-title pb-2" style="font-size: 20px; font-weight: bold;" >
                  						<a href="${pageContext.request.contextPath }/movieInfo?mvcode=${reInfo.MVCODE }">
                  						${reInfo.MVTITLE }
                  						</a>
                  					</h5>
                  					<p class="card-text mb-1">예매번호
                  						<span style="font-weight: bold; color: black;">${reInfo.RECODE }</span>
                  					</p>
                  					<p class="card-text mb-1">관람극장
                  						<span style="font-weight: bold; color: black;">${reInfo.THNAME } ${reInfo.REROOM }</span>
                  					</p>
                  					<p class="card-text mb-1">관람일시
                  						<span style="font-weight: bold; color: black;">${reInfo.REDATE }</span>
                  					</p>
                  					<p class="card-text mb-1">예매인원
                  						<span style="font-weight: bold; color: black;">${reInfo.RENUMBER } 명</span>
                  					</p>                  					
                				</div>
              				</div>
             				<div class="col-auto p-3 d-flex align-items-center" style="width: 180px; text-align: center;">
                				<div class="card-body p-0">
                					<c:choose>
                						<c:when test="${nowDate < reserveDate }">
	                					<a class="btn btn-light btn-outline-dark"  
	                					   href="${pageContext.request.contextPath }/reserveCancel?recode=${reInfo.RECODE }">예매취소</a>
                						</c:when>
                						<c:otherwise>
                							<c:choose>
                								<c:when test="${reInfo.RVRECODE == null }">
				                					<a class="btn btn-outline-primary " 
				                					   href="javascript:writeReview('${reInfo.RECODE }','${reInfo.MVTITLE }')">
				                					   관람평작성</a>
                								</c:when>
                								<c:otherwise>
                									<a class="btn btn-outline-success " 
				                					   href="javascript:viewReview('${reInfo.RVRECODE }','${reInfo.MVTITLE }','${reInfo.MVPOS }')">관람평확인</a>
                								</c:otherwise>
                							</c:choose>	
                						</c:otherwise>
                					</c:choose>
                					
	<script type="text/javascript">
		function writeReview(recode,mvtitle){
			window.open('${pageContext.request.contextPath }/reviewForm?recode='+recode+"&mvtitle="+mvtitle,'reviewFormPage',"width=750, height=450, top=100, left=500");
		}
		function viewReview(rvrecode,mvtitle,mvpos){
			window.open('${pageContext.request.contextPath }/reviewView?rvrecode='+rvrecode+"&mvtitle="+mvtitle+"&mvpos="+mvpos,'reviewViewPage',"width=750, height=350, top=100, left=500");
		}		
	</script>
	
                				</div>
              				</div>              				
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