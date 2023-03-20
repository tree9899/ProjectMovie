<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="${pageContext.request.contextPath }/">
          <i class="bi bi-grid"></i>
          <span>메인페이지</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-heading">Movies  </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#movies-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i><span>영화메뉴</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="movies-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath }/movieList">
              <i class="bi bi-circle"></i><span class="">영화</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath }/theaterList">
              <i class="bi bi-circle"></i><span class="">극장</span>
            </a>
          </li>          
          <li>
            <a href="${pageContext.request.contextPath }/ticketPage">
              <i class="bi bi-circle"></i><span class="">예매</span>
            </a>
          </li>
        </ul>
      </li>
      <!-- End movies-nav -->

      <li class="nav-heading">Members</li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#members-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>회원메뉴</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="members-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
        <c:choose>
        	<c:when test="${sessionScope.loginId == null }">
	          <li>
	            <a href="${pageContext.request.contextPath }/memberLoginForm">
	              <i class="bi bi-circle"></i><span>로그인</span>
	            </a>
	          </li>
	          <li>
	            <a href="${pageContext.request.contextPath }/memberJoinForm">
	              <i class="bi bi-circle"></i><span>회원가입</span>
	            </a>
	          </li>
        	</c:when>
        	<c:otherwise>
	          <li>
	            <a href="${pageContext.request.contextPath }/reserveList">
	              <i class="bi bi-circle"></i><span>예매내역확인</span>
	            </a>
	          </li>
	          <li>
	            <a href="${pageContext.request.contextPath }/memberLogout">
	              <i class="bi bi-circle"></i><span>로그아웃</span>
	            </a>
	          </li>        	
        	</c:otherwise>
        </c:choose>
        </ul>
      </li>
      
      
      <!-- End members-nav -->

    </ul>

  </aside>