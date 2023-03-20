<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko-KR">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>MVRESERVATION - 예매페이지</title>
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
  <style type="text/css">
  	.reserveArea{
  		height:350px;
  		overflow: scroll;
  	}
  	
  	.selObj{
  		background-color: blue;
  		color: white;
  	}
  	.font-bold{
  		font-weight: bold;
  	}
  	.listTitle{
  		overflow: hidden;
  		text-overflow: ellipsis;
  		white-space: nowrap;
  		width: 100%;
  		display: inline-block;
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
			<h1>movie/Ticket.jsp</h1>

		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row" style="min-width: 565px;" >
				
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">영화</h5>
							
							<div class="list-group reserveArea" id="mvListArea"  >
								<c:forEach items="${mvList }" var="movie" >
								<button type="button" class="list-group-item list-group-item-action" 
								        onclick="selectMovie(this, '${movie.mvcode }' )"><span class="listTitle font-bold" title="${movie.mvtitle }">${movie.mvtitle }</span></button>
								</c:forEach>
							</div>
							
						</div>
					</div>

				</div>
				
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">극장</h5>
							<div class="list-group reserveArea" id="thListArea">
								<c:forEach items="${thList }" var="theater" >
								<button type="button" class="list-group-item list-group-item-action" 
								        onclick="selectTheater(this, '${theater.thcode }' )"><span class="listTitle font-bold" title="${theater.thname }">${theater.thname }</span></button>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-2 col-md-4 col-sm-4">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">날짜</h5>
							<!-- List group with Links and buttons -->
							<div class="list-group reserveArea" id="scDateListArea">
																																			
							</div>
							<!-- End List group with Links and buttons -->
						</div>
					</div>
				</div>
				
				<div class="col-lg-4 col-md-8 col-sm-8">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">상영관 및 시간</h5>
							<!-- List group with Links and buttons -->
							<div class="list-group reserveArea" >
								<!-- list-group-item-warning -->
								<div id="scTimeListArea">							
									
								</div>									
							</div>	
							<!-- End List group with Links and buttons -->
						</div>
					</div>
				</div>
				
				
				<div class="col-12">
					<div class="card">
						<div class="card-body p-3">
							<div class="row" style="min-width: 565px; height: 200px;">
								<div class="col-4">
									<h5>선택 영화 정보 출력</h5>
								</div>
																					
								<div class="col-6">
									<h5>선택 극장정보 출력 및 예매 인원수 선택</h5>
									예매인원수 : <input type="number" id="selectNumber" min="1" >
								</div>
								
								<div class="col-2" style="text-align: center;">
									<button class="btn btn-danger font-bold mb-1" 
									        onclick="reserveMovie()">예매하기</button>
									<button class="btn btn-danger font-bold mb-1" 
									        onclick="reserveMovie_kakaoPay()">예매하기_결제</button>									        
								</div>
							</div>
						
						</div>
					</div>
				</div>
								
			</div>
			
			<hr>

			
			
			
			
			
			
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

		function getMoviesList(){
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath }/getAllMovieList",
				dataType : "json",
				async:false,
				success:function(movieList){
					var output = "";
					for(var mvinfo of movieList){
						if(mvinfo.mvcode == selectedMvCode){
							console.log("확인")
							output += "<button type='button' id='selectMovie' class='list-group-item list-group-item-action' onclick='selectMovie(this, "+"\""+mvinfo.mvcode+"\""+" )'><span class='listTitle font-bold' title='"+mvinfo.mvtitle+"'>"+mvinfo.mvtitle+"</span></button>";
						} else {
							output += "<button type='button' class='list-group-item list-group-item-action' onclick='selectMovie(this, "+"\""+mvinfo.mvcode+"\""+" )'><span class='listTitle font-bold' title='"+mvinfo.mvtitle+"'>"+mvinfo.mvtitle+"</span></button>";
						}
					}
					$("#mvListArea").html(output);
					$("#selectMovie").focus();
					$("#selectMovie").click();
				}
			});				
			
		}
		function getTheaterList(){
			console.log("getTheaterList().selectedThCode : " + selectedThCode)
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath }/getAllTheaterList",
				dataType : "json",
				async:false,
				success:function(theaterList){
					var output = "";
					for(var thinfo of theaterList){
						if(thinfo.thcode == selectedThCode){
							console.log("확인")
							output += "<button type='button' id='selectTheater' class='list-group-item list-group-item-action' onclick='selectTheater(this, "+"\""+thinfo.thcode+"\""+" )'><span class='listTitle font-bold' title='"+thinfo.thname+"'>"+thinfo.thname+"</span></button>";
						} else {
							output += "<button type='button' class='list-group-item list-group-item-action' onclick='selectTheater(this, "+"\""+thinfo.thcode+"\""+" )'><span class='listTitle font-bold' title='"+thinfo.thname+"'>"+thinfo.thname+"</span></button>";
						}
					}
					$("#thListArea").html(output);
					$("#selectTheater").focus();
					$("#selectTheater").click();
					
				}
			});				
			
		}		
		
		
	</script>
	
	<script type="text/javascript">
	
		function reserveMovie_kakaoPay(){
			console.log("reserveMovie() 호출");
			console.log("선택한 영화코드 : " + selectedMvCode);
			console.log("선택한 극장코드 : " + selectedThCode);
			console.log("선택한 날짜 : " + selectedDate);
			console.log("선택한 상영관 : " + selectedRoom);
			console.log("선택한 시간 : " + selectedTime);
			
			var selectNumber = $("#selectNumber").val();//예매 인원수
			console.log("선택한 예매인원수 : " + selectNumber);
			
			if(selectedMvCode.length == 0){
				alert("영화가 선택되지 않았습니다.\n영화를 선택해주세요");
				return;
			}
			if(selectedThCode.length == 0){
				alert("극장이 선택되지 않았습니다.\n극장을 선택해주세요");
				return;				
			}
			if(selectedDate.length == 0){
				alert("날짜가 선택되지 않았습니다.\n날짜를 선택해주세요");
				return;				
			}
			if(selectedRoom.length == 0 || selectedTime.length == 0){
				alert("상영관 및 시간이 선택되지 않았습니다.\n상영관 및 시간을 선택해주세요");
				return;				
			}			
			if(selectNumber == 0){
				alert("예매인원수를 확인해주세요.");
				$("#selectNumber").focus();
				return;
			}
			
			var selectNumber = $("#selectNumber").val();
			// 선택 정보가 모두 확인 되면 CONTROLLER에 예매 처리 요청
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath }/reserveMovie_PayReady",
				data : { "rethcode" : selectedThCode, 
					     "reroom" : selectedRoom,
					     "redate" : selectedDate + " " + selectedTime,
					     "remvcode" : selectedMvCode,
					     "renumber" : 1
					   },				
				async:false,
				success:function(popUpUrl){ // 결제QR코드 페이지 URL
					console.log(popUpUrl);
					window.open(popUpUrl, "payPopUp","width=400, height=800, top=10, left=100");
				}
			});			
		}
	
	function pay_Result(payResult){
		console.log(payResult);
		switch(payResult){
		case 'Approval':
			alert("예매 되었습니다.");
			//예매정보 insert 기능 실행
			location.href="${pageContext.request.contextPath }/";
			break;
		case 'Cancel':
			alert('예매처리중 결제가 취소 되었습니다.');
			break;
		case 'Fail':
			alert('예매처리중 결제를 실패 하였습니다.')
			break;
		}
		
	}	
	
	
	function reserveMovie(){
		console.log("reserveMovie() 호출");
		console.log("선택한 영화코드 : " + selectedMvCode);
		console.log("선택한 극장코드 : " + selectedThCode);
		console.log("선택한 날짜 : " + selectedDate);
		console.log("선택한 상영관 : " + selectedRoom);
		console.log("선택한 시간 : " + selectedTime);
		
		var selectNumber = $("#selectNumber").val();//예매 인원수
		console.log("선택한 예매인원수 : " + selectNumber);

		
		if(selectedMvCode.length == 0){
			alert("영화가 선택되지 않았습니다.\n영화를 선택해주세요");
			return;
		}
		if(selectedThCode.length == 0){
			alert("극장이 선택되지 않았습니다.\n극장을 선택해주세요");
			return;				
		}
		
		if(selectNumber == 0){
			alert("예매인원수를 확인해주세요.");
			$("#selectNumber").focus();
			return;
		}
		
		return;
		// 선택 정보가 모두 확인 되면 CONTROLLER에 예매 처리 요청
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath }/reserveMovie",
			data : { "rethcode" : selectedThCode, 
				     "reroom" : selectedRoom,
				     "redate" : selectedDate + " " + selectedTime,
				     "remvcode" : selectedMvCode,
				     "renumber" : selectNumber
				   },				
			async:false,
			success:function(reserveResult){
				console.log(reserveResult);
				if(reserveResult == '1'){
					alert("예매처리 되었습니다.");
					location.href="${pageContext.request.contextPath }/";
				}
			}
		});			
	}	
	
	
	
	</script>
	
	
	
	<script type="text/javascript">
	
	var selectedMvCode = ""; // 'MV001'
	var selectedThCode = ""; // 'T0001'
	var selectedDate = "";   // '2022-12-21'
	var selectedTime = "";   // '18:40'
	var selectedRoom= "";    // '1관'
	
	function selectMovie(selBtn,mvcode){ //영화 목록에서 영화 선택 할 경우 호출 
		console.log("선택한 영화코드 : " + mvcode);
		//선택된 영화 스타일 변경
		$("#mvListArea > button").removeClass("active");
		$(selBtn).addClass("active");
		
		selectedMvCode = mvcode; // 선택한 영화 코드 저장
		
		getReserveTheaterList(mvcode); // 예매가능한,예매불가능한 극장 목록 출력
		
		if(selectedMvCode.length > 0 && selectedThCode.length > 0){
			console.log("영화 극장 모두 선택됨");
			getReserveScheduleDateList(selectedMvCode, selectedThCode);
		}
	
		
	}
	
	function selectTheater(selBtn,thcode){
		console.log("selectTheater().선택한 극장코드 : " + thcode);
		
		//선택된 극장 스타일 변경
		$("#thListArea > button").removeClass("active");
		$(selBtn).addClass("active");
		
		selectedThCode = thcode; // 선택한 극장 코드 저장

		getReserveMovieList(selectedThCode);  // 예매가능한,예매불가능한 영화 목록 출력
		
		if(selectedMvCode.length > 0 && selectedThCode.length > 0){
			console.log("영화 극장 모두 선택됨");
			getReserveScheduleDateList(selectedMvCode, selectedThCode);//예매가능한 날짜 목록 출력
		}
		
		$("#scTimeListArea").html(""); //상영관 시간 목록 해제
		selectedTime = "";   // 
		selectedRoom= "";    // 
		
		
		$("#selThcode").val(thcode);
		
		
	}
	
	function selectDate(selBtn,selDate){
		console.log("selectDate().선택한 날짜 : " + selDate);
		//선택된 날짜 스타일 변경
		$("#scDateListArea > button").removeClass("active");
		$(selBtn).addClass("active");
		
		selectedDate = selDate;
		if(selectedMvCode.length > 0 && selectedThCode.length > 0){
			//예매가능한 상영관 및 시간 목록 출력
			getReserveScheduleRoomTimeList(selectedMvCode, selectedThCode, selectedDate);
		}
		
		selectedTime = "";   // 
		selectedRoom= "";    // 
		
	}
	
	function selectRoomTime(selBtn,selRoom, selTime){
		console.log("selectRoomTime().선택한 상영관 :" + selRoom+", 선택한 시간 : " + selTime);
		//선택된 상영관 시간 스타일 변경
		$("#scTimeListArea > button").removeClass("btn-primary");
		$(selBtn).removeClass("btn-light");	
		$(selBtn).addClass("btn-primary");
		
		selectedTime = selTime;   // 선택한 시간 저장
		selectedRoom= selRoom;    // 선택한 상영관 저장				
		
	}
	
	
	function getReserveTheaterList(mvcode){
		console.log("예매 가능한 극장 목록 조회");
		var thMsgCheck = true;
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath }/getReTheaterList",
			data : { "mvcode" : mvcode },
			dataType : "json",
			async:false,
			success:function(theaterList){
				console.log(theaterList);
				var selectCheck = false;
				var output = "";
				for(var thinfo of theaterList){
					if(thinfo.checkth == null){
						output += "<button type='button' class='list-group-item list-group-item-secondary list-group-item-action'onclick='resetMovieDate("+"\""+thinfo.thcode+"\""+" )'><span class='listTitle' title='"+thinfo.thname+"'>"+thinfo.thname+"</span></button>";
					} else if(thinfo.thcode == selectedThCode) {
						output += "<button type='button' id='select-Theater' class='list-group-item list-group-item-action active' onclick='selectTheater(this, "+"\""+thinfo.thcode+"\""+" )'><span class='listTitle font-bold' title='"+thinfo.thname+"'>"+thinfo.thname+"</span></button>";
						selectCheck = true;
						console.log("이전에 선택된 극장 있음");
					} else {
						output += "<button type='button' class='list-group-item list-group-item-action' onclick='selectTheater(this, "+"\""+thinfo.thcode+"\""+" )'><span class='listTitle font-bold' title='"+thinfo.thname+"'>"+thinfo.thname+"</span></button>";
					}
				}
				$("#thListArea").html(output);
				if(selectCheck){
					$("#select-Theater").focus();
				}
				
			}
		});

	}

	function getReserveMovieList(thcode){
		console.log("예매 가능한 영화 목록 조회");
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath }/getReMovieList",
			data : { "thcode" : thcode },
			dataType : "json",
			async:false,
			success:function(movieList){
				console.log(movieList);
				var output = "";
				var selectCheck = false;
				for(var mvinfo of movieList){
					if(mvinfo.checkmv == null){
						output += "<button type='button' class='list-group-item list-group-item-secondary list-group-item-action' onclick='resetTheaterDate("+"\""+mvinfo.mvcode+"\""+")'><span class='listTitle' title='"+mvinfo.mvtitle+"'>"+mvinfo.mvtitle+"</span></button>";
					} else if(mvinfo.mvcode == selectedMvCode ){
						output += "<button type='button' id='select-Movie' class='list-group-item list-group-item-action active' onclick='selectMovie(this, "+"\""+mvinfo.mvcode+"\""+" )'><span class='listTitle font-bold' title='"+mvinfo.mvtitle+"'>"+mvinfo.mvtitle+"</span></button>";
						selectCheck = true;
						console.log("이전에 선택된 극장 있음");
					} else {
						output += "<button type='button' class='list-group-item list-group-item-action' onclick='selectMovie(this, "+"\""+mvinfo.mvcode+"\""+" )'><span class='listTitle font-bold' title='"+mvinfo.mvtitle+"'>"+mvinfo.mvtitle+"</span></button>";
						
					}
				}

				$("#mvListArea").html(output);
				if(selectCheck){
					$("#select-Movie").focus();
				}				
			}
		});		
	}	
	
	function resetMovieDate(thCode){
		console.log(thCode);
		var resetCheck = confirm("선택한 극장에 원하시는 상영스케쥴이 없습니다. \n계속 하시겠습니까? (선택한 영화 및 날짜가 해제됩니다.)");
		if(resetCheck){
			selectedThCode = thCode;
			selectedMvCode = ""; //선택한 영화 해제
			selectedDate = "";   //선택한 날짜 해제
			selectedTime = "";	 //선택한 시간 해제
			selectedRoom = "";	 //선택한 상영관 해제			
			getReserveMovieList(selectedThCode);
			getTheaterList();
			$("#scDateListArea").html("");
		}
		
	}
	
	function resetTheaterDate(mvCode){
		console.log(mvCode);
		var resetCheck = confirm("선택한 영화에 원하시는 상영스케쥴이 없습니다. \n계속 하시겠습니까? (선택한 극장 및 날짜가 해제됩니다.)");
		if(resetCheck){
			selectedMvCode = mvCode; 
			selectedThCode = ""; //선택한 극장 해제
			selectedDate = "";   //선택한 날짜 해제
			selectedTime = "";	 //선택한 시간 해제
			selectedRoom = "";	 //선택한 상영관 해제
			getReserveTheaterList(selectedMvCode);
			getMoviesList();
			$("#scDateListArea").html("");
		}
		
	}	
	
	
	function getReserveScheduleDateList(mvcode, thcode){
		console.log("예매가능한 날짜 목록 조회");
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath }/getScheduleDateList",
			data : { "scmvcode" : mvcode, "scthcode" : thcode },
			dataType : "json",
			async:false,
			success:function(dateList){
				console.log(dateList); // '2022-12-21', '2022-12-22', '2022-12-23'
				var output = "";
				var sc_year = "";
				var sc_month = "";
				for(var scinfo of dateList){
					var arrDate = scinfo.scdate.split("-"); // '2022' '12' '21'
					var nowYear = arrDate[0]; // 2022
					var nowMonth = arrDate[1];// 12
					var nowDay = arrDate[2];  // 21
					var checkYearMonth = sc_year + "-" + sc_month; 
					if( checkYearMonth != (nowYear + "-" +nowMonth ) ){
						output += "<h5 class='text-center m-2'>";
						output += "<span class='badge bg-secondary'>";
							if(nowYear != sc_year){
								output += nowYear+"년<br>";
							}
							output += nowMonth+"월";
						output += "</span>";
						output += "</h5>";
					}
					sc_year = nowYear;
					sc_month = nowMonth;
					output += "<button type='button' class='list-group-item' onclick='selectDate(this,"+"\""+scinfo.scdate+"\""+")'>";
					output += "<span class='listTitle font-bold' >"+nowDay+"일</span>"
					output +="</button>";
					console.log(sc_month);
				}				
				$("#scDateListArea").html(output);
				
			}
		});			
	}

	
	function getReserveScheduleRoomTimeList(mvcode, thcode, scdate){
		console.log("예매가능한 상영관 및 시간 목록 조회");
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath }/getScheduleRoomTimeList",
			data : { "scmvcode" : mvcode, "scthcode" : thcode, "scdate" :  scdate},
			dataType : "json",
			async:false,
			success:function(roomTimeList){
				console.log(roomTimeList);
				var sc_room = "";
				var output = "";
				for(var scinfo of roomTimeList){
					var checkRoom = sc_room;
					if(checkRoom != scinfo.scroom){
						if(checkRoom.length > 0 ){
							output += "<hr>";
						}
						output += "<h5 class='font-bold'>"+scinfo.scroom+"</h5>";
					}
					sc_room = scinfo.scroom;
					output += "<button type='button' class='btn btn-light mb-2' onclick='selectRoomTime(this, "+"\""+scinfo.scroom+"\","+"\""+scinfo.scdate+"\")'>";
					output += scinfo.scdate+"</button> "
				}
				$("#scTimeListArea").html(output);
				
			}
		});			
	}	

	</script>

</body>

</html>