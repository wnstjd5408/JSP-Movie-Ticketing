<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="cpath">${pageContext.request.contextPath }</c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="https://img.cgv.co.kr/theater_img/favicon.ico">
</head>
<body>
	<nav class= "navbar navbar-expand-lg navbar-light bg-light border-bottom">
		<a class="navbar-brand"style=" color: #e71a0f;" href="${cpath }/Movie/MainForm.jsp"><strong>CGV</strong></a>
	    <button
	    class="navbar-toggler ml-auto"
	    type="button"
	    data-toggle="collapse"
	    data-target="#navbarNav"
	    aria-controls="navbarNav"
	    aria-expanded="false"
	    aria-label="Toggle navigation"
    	>
    		<span class="navbar-toggler-icon"></span>
  		</button>
  		
  		<div class ="collapse navbar-collapse flex-grow-0" id ="navbarNav">
  			<ul class="navbar-nav">
  			<c:choose>
  				<c:when test="${empty login }">
  					<li class="nav-item">
	  					<a class="nav-link" href="${cpath }/User/loginform1.jsp">로그인</a>
	  				</li>
	  				<li>
	  					<a class="nav-link" href="${cpath }/User/registerform.jsp">회원가입</a>
	  				</li>
  				
  				</c:when>
  				<c:otherwise>
  					<li class="nav-item">
	  					<a class="nav-link" href="${cpath }/User/logout.jsp">로그아웃</a>
	  				</li>
  					<li>
	  					<a class="nav-link" href="${cpath }/User/myPage.jsp">마이페이지</a>
	  				</li>
	  				<li>
	  					<a class="nav-link" href="${cpath }/Ticketing/ticketingForm.jsp">영화예매</a>
	  				</li>
  				</c:otherwise>	
	  				
  			</c:choose>
  				
  			</ul>
  		</div>
  		
		
		
	
	
	
	
	</nav>
</body>
</html>