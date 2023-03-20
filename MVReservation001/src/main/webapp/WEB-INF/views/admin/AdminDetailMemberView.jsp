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

        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content" class=" bg-white">

                <!-- Topbar -->

                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid mt-3"">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">AdminDetailMemberView.jsp</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
						<div class="col-auto px-1" style="max-width: 150px;">
							<div class="card shadow mb-4">
	                            <div class="card-header py-2">
	                            	<h6 class="m-0 font-weight-bold text-primary">프로필</h6>
	                            </div>
	                            <div class="card-body p-3">
									<img class="img-fluid" src="${pageContext.request.contextPath }/resources/assets/img/profile01.jpg" >
	                            </div>
	                         </div>
						</div>
						<div class="col px-1">
							<div class="card shadow mb-4">
                                <div class="card-header py-2">
                                    <h6 class="m-0 font-weight-bold text-primary">회원 상세 정보</h6>
                                </div>
                                <div class="card-body">
									<div class="row gx-3 mb-3">
                                    	<div class="col-md-6 col-sm-6">
                                        	<label class="small mb-1" >아이디</label>
                                            <input class="form-control border-0" type="text" readonly="readonly" value="${member.MID }">
                                    	</div>
                                    	<div class="col-md-6 col-sm-6">
                                        	<label class="small mb-1" for="inputLastName">비밀번호</label>
                                        	<input class="form-control border-0" type="text" readonly="readonly" value="${member.MPW }">
                                    	</div>
                                	</div>									
                                </div>
                            </div>
						</div>

                    </div>

                    <div class="row">
						<div class="col">
							<div class="card shadow mb-4">
	                            <div class="card-header py-2">
	                            	<h6 class="m-0 font-weight-bold text-primary">활동내역</h6>
	                            </div>
	                            <div class="card-body p-3">
									<div class="row gx-3 mb-3">
                                    	<div class="col-auto">
                                            <button class="btn btn-primary me-2">
                                            예매수 <span class="badge bg-white text-dark ms-2">${member.RECOUNT }</span>
                                            </button>
                                    	</div>
                                    	<div class="col-auto">
                                            <button class="btn btn-success me-2">
                                            관람평 <span class="badge bg-white text-dark ms-2">${member.RVCOUNT }</span>
                                            </button>
                                    	</div>                                    	
                                	</div>
	                            
	                            </div>
	                         </div>
						</div>


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

</body>

</html>