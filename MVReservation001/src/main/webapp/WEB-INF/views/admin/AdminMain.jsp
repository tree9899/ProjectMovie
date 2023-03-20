<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko-KR">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>MVRESERVATION - 관리자 페이지</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath }/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath }/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

   



</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
	<%@ include file="/WEB-INF/views/admin/Admin_sideBar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content" class=" bg-white">

                <!-- Topbar -->
	<%@ include file="/WEB-INF/views/admin/Admin_topBar.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">AdminMain.jsp</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
						<div class="col d-flex align-items-center ">
								<div id="chart_div2"></div>
						</div>
 
 						<div class="col d-flex align-items-center ">
							<div class="w-100" id="movieChart_div" style="min-width:500px;min-height: 500px;" ></div>
						</div>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/admin/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/resources/admin/js/sb-admin-2.min.js"></script>
 <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    		google.charts.load('current', {'packages':['corechart']});
    		google.charts.setOnLoadCallback(drawMovieChart);
    		//google.charts.setOnLoadCallback(drawReRatioChart);
    	})
    
    	function drawMovieChart(){
    		/* 영화 예매순위 차트 열그래프(세로막대) */
    		/*
    		      var data = google.visualization.arrayToDataTable([
        			["Element", "Density", { role: "style" } ],
        			["Copper", 8.94, "#b87333"],
        			["Silver", 10.49, "silver"],
        			["Gold", 19.30, "gold"],
        			["Platinum", 21.45, "color: #e5e4e2"]
      				]);
    		*/
    		
    		$.ajax({
    			url : "adminGetMovieRatio",
    			type : "post",
    			dataType : "json",
    			async:false,
    			success : function(mvRatioList){
    				console.log(mvRatioList);
    				var data_source = [ ];
    				var data_column = ['제목','예매수', { role: 'annotation' } ];
    				data_source.push(data_column);
    				for(var i = 0; i < 5; i++){
    					var data_row = [ mvRatioList[i].MVTITLE, mvRatioList[i].RECOUNT, mvRatioList[i].RECOUNT  ];
    					data_source.push(data_row);
    				}
    				console.log(data_source);
    				var data = google.visualization.arrayToDataTable(data_source);
    				
    				var chart = new google.visualization.ColumnChart(document.getElementById("movieChart_div"));
    				var options = {
			    	        title: "영화 별 예매수"}
    				
    				chart.draw(data,options);
    				
    				
    			}
    			
    		});    		
    		
    	}
    	
    	
    	
    	function drawMovieRankBarChart(){
    		
    		$.ajax({
    			url : "adminGetMovieRatio",
    			type : "post",
    			dataType : "json",
    			async:false,
    			success : function(mvRatioList){
    				console.log(mvRatioList);
    				var loopCount = 5;
    				var data_Scource = [ ['영화제목', '예매수', { role: 'annotation' } ] ];
    				
    				for(var i = 0; i < loopCount; i++){
    					var mvdata = [mvRatioList[i].MVTITLE, mvRatioList[i].RECOUNT , mvRatioList[i].RECOUNT ];
    					data_Scource.push(mvdata);
    				}
    				
    				console.log(data_Scource);
    				var data = google.visualization.arrayToDataTable(data_Scource)
    			    var options = {
    			    	        title: "영화 별 예매수",
    			    	        width: 600,
    			    	        height: 700,
    			    	        bar: {groupWidth: "95%"},
    			    	        legend: { position: "none" },
    			    	      };
    			    	      var chart = new google.visualization.BarChart(document.getElementById("chart_div"));
    			    	      chart.draw(data, options);
    			}
    			
    		});
    		
    		
    	}

    
    </script>

</body>

</html>