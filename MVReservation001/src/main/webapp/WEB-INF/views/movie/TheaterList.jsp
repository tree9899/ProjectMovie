<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<!DOCTYPE html>
<html lang="ko-KR">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>MVRESERVATION - 극장 페이지</title>
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
	.sctimeList{
		border: 2px solid lightgrey;
	}
	.sctimeList:hover {
		cursor: pointer;
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
			<h1>TheaterList.jsp</h1>

		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="mx-auto" style="min-width: 700px;max-width: 1200px;">
				<div class="card mx-auto px-4 py-2 mb-2" >
					<div class="row" >
						<c:forEach items="${thList }" var="theater">
						<div class="col-auto m-1 p-0">
						<a href="${pageContext.request.contextPath }/theaterList?thcode=${theater.thcode }" class="btn btn-dark btn-sm">
							${theater.thname }
						</a>
						</div>
						</c:forEach>
					</div>
				</div>
				
				<div class="card mx-auto mb-2 px-4 py-2" >
            		<div class="card-header">
						<h1><span class="badge bg-dark">${thInfo.thname }</span></h1>
						<div class="row">	
						<c:choose>
							<c:when test="${dateList.size() > 0 }">
								<c:forEach items="${dateList }" var="scDate" varStatus="status">
									<div class="col-auto" id="dateSelectArea">
									<button id="dateBtn${status.index }" onclick="selectScDate(this,'${thInfo.thcode }','${scDate.scdate }')" class="btn btn-outline-secondary">
										${fn:split(scDate.scdate,'-')[1] }월 ${fn:split(scDate.scdate,'-')[2] }일
									</button>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<h2>상영스케쥴이 없습니다.</h2>
							</c:otherwise>
						</c:choose>
						</div>
            		</div>
	            		<div class="card-body pb-1" id="movieScheduleArea">
          <!-- 상영스케쥴 반복 시작 -->
	              			<!-- <h5 class="card-title py-1">
	              				더 퍼스트 슬램덩크
	              				<span class="text-black">애니메이션</span>
	              				<span class="text-black">124분</span>
	              				<span class="text-black">2023.01.04 개봉</span>
	              			</h5>
	              			<h6 class="my-2">3관 (리클라이너)</h6>
	              			<button class="sctimeList p-3 bg-white">17:50</button> 
	              			<button class="sctimeList p-3 bg-white">17:50</button> 
	              			<button class="sctimeList p-3 bg-white">17:50</button> 
	              			
	              			<h6 class="my-2">5관</h6>
	              			<button class="sctimeList p-3 bg-white">17:50</button> 
	              			<button class="sctimeList p-3 bg-white">17:50</button> 
	              			<button class="sctimeList p-3 bg-white">17:50</button> 	           
	              			<hr class="my-3"> 
	              			
	              			<h5 class="card-title py-1">
	              				더 퍼스트 슬램덩크
	              				<span class="text-black">애니메이션</span>
	              				<span class="text-black">124분</span>
	              				<span class="text-black">2023.01.04 개봉</span>
	              			</h5>
	              			<h6 class="my-2">3관 (리클라이너)</h6>
	              			<button class="sctimeList p-3 bg-white">17:50</button> 
	              			<button class="sctimeList p-3 bg-white">17:50</button> 
	              			<button class="sctimeList p-3 bg-white">17:50</button> 
	              			
	              			<h6 class="my-2">5관</h6>
	              			<button class="sctimeList p-3 bg-white">17:50</button> 
	              			<button class="sctimeList p-3 bg-white">17:50</button> 
	              			<button class="sctimeList p-3 bg-white">17:50</button> 	           
	              			<hr class="my-3">	              			          	 -->		
		<!-- 상영스케쥴 반복 끝 -->
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
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#dateBtn0").click();
		})
	
	
		function selectScDate(selObj, selthcode ,selectDate){
			
			$("#dateSelectArea > button").removeClass('btn-outline-secondary').removeClass('btn-secondary');
			$("#dateSelectArea > button").addClass('btn-outline-secondary');
			$(selObj).removeClass('btn-outline-secondary').addClass('btn-secondary');
			
			console.log("극장코드 : " + selthcode);
			console.log("선택 날짜 : " + selectDate);
			$.ajax({
				url : "${pageContext.request.contextPath }/getTheaterMovieSchedule",
				type : "get",
				data : { "scthcode" : selthcode , "scdate" : selectDate },
				async:false,
				dataType : "json",
				success : function(scList){
					console.log(scList);
					var output = "";
					var prevMvCode = "";
					var prevScRoom = "";
					var checkLine =false;
					for(var movSchedule of scList){
						console.log(movSchedule.SCROOM);
						var nowMvCode = movSchedule.MVCODE;
						var nowScRoom = movSchedule.SCROOM;
						if(nowMvCode != prevMvCode){
							if(prevMvCode.length > 0){
								output += "<hr>";
							}
							output += "<h5 class=\"card-title py-1\">";
							output += movSchedule.MVTITLE;
							output += " <span class=\"text-black\">"+movSchedule.MVGENRE+"</span>";
							output += " <span class=\"text-black\">"+movSchedule.MVINFO.split(',')[1]+"</span>";
							output += " <span class=\"text-black\">"+movSchedule.MVDATE+" 개봉</span>";
							output += "</h5>";
							
						}
						if(nowMvCode+nowScRoom != prevMvCode+prevScRoom){
							output += "<h6 class=\"my-2\">"+nowScRoom+"</h6>";
						}
						
						output += "<button class=\"sctimeList p-3 bg-white\" onclick=\"movieReservePage('"+movSchedule.MVCODE+"','"+movSchedule.SCTHCODE+"','"+movSchedule.SCDATE+"','"+movSchedule.SCROOM+movSchedule.SCTIME+"')\">"+movSchedule.SCTIME+"</button> ";
						

						prevMvCode = nowMvCode;
						prevScRoom = nowScRoom;
						
					}
					$("#movieScheduleArea").html(output);
				}
				
			});
		}
		
		function movieReservePage(mvcode, thcode, scdate, scroomtime){
			console.log(mvcode);
			console.log(thcode);
			console.log(scdate);
			console.log(scroomtime);
			alert('예매 페이지로 이동합니다.');
			
			location.href="${pageContext.request.contextPath }/ticketPage?selectmovie="+mvcode
					     +"&selecttheater="+thcode+"&selectdate="+scdate+"&selectroomtime="+scroomtime.replace(':','');
		}
		
		
	</script>
<!-- 
	              			<h5 class="card-title py-1">
	              				더 퍼스트 슬램덩크
	              				<span class="text-black">애니메이션</span>
	              				<span class="text-black">124분</span>
	              				<span class="text-black">2023.01.04 개봉</span>
	              			</h5>
	              			<h6 class="my-2">3관 (리클라이너)</h6>
	              			<button class="sctimeList p-3 bg-white">17:50</button> 
	              			<button class="sctimeList p-3 bg-white">17:50</button> 
	              			<button class="sctimeList p-3 bg-white">17:50</button> 
	              			
	              			<h6 class="my-2">5관</h6>
	              			<button class="sctimeList p-3 bg-white">17:50</button> 
	              			<button class="sctimeList p-3 bg-white">17:50</button> 
	              			<button class="sctimeList p-3 bg-white">17:50</button> 	           
	              			<hr class="my-3"> 
 -->

</body>

</html>