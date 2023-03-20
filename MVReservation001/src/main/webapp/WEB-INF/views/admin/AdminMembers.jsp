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

    <title>MVRESERVATION - 관리자 회원관리 페이지</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath }/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath }/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

	<!-- DATA TABLES CSS -->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.13.1/datatables.min.css"/>
	
	<style type="text/css">
		#memList_Tbl > tbody > tr:hover{
			background-color: aliceblue;
		}
		
	</style>

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
                        <h1 class="h3 mb-0 text-gray-800">AdminMembers.jsp</h1>
                    </div>
                    <table id="memList_Tbl"  class="row-border stripe">
                    <thead>
                    	<tr>
                    		<th>아이디</th>
                    		<th>이름</th>
                    		<th>생년월일</th>
                    		<th>회원상태</th>
                    	</tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${memberList}" var="member">
                    		<tr >
                    			<td><button class="btn btn-primary w-100"  onclick="memberDetailView('${member.mid}')">${member.mid}</button></td>
                    			<td>${member.mname}</td>
                    			<td>${member.mbirth}</td>
                    			<td>
                    			<c:choose>
									<c:when test="${member.mstate == '0' }">
										<button class="btn btn-success" onclick="modifyMstate('${member.mid}','${member.mstate}')">사용중</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-danger" onclick="modifyMstate('${member.mid}','${member.mstate}')">이용중지계정</button>
									</c:otherwise>                    			
                    			</c:choose>
                    			</td>
                    		</tr>
                    	</c:forEach>
                    </tbody>	
                    </table>

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
    
    <!-- DATA TABLE JS -->
	<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.13.1/datatables.min.js"></script>
		
	<script type="text/javascript">
	$(document).ready( function () {
	    $('#memList_Tbl').DataTable({
	    	"order": []
	    });
	} );	
	
	function modifyMstate(mid,mstate){
		location.href = 'adminModifyMstate?mid='+mid+"&mstate="+mstate;
	}
	
	function memberDetailView(mid){
		var url = '${pageContext.request.contextPath }/adminDatailMemberView?mid='+mid
		window.open(url,'detailMemberView',"width=750, height=450, top=100, left=500");
	}
	
	</script>

</body>

</html>