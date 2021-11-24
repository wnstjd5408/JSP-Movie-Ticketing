<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../nav.jsp" %>    
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:useBean id="moviedao" class="movie.MovieDAO"></jsp:useBean>
<c:set var="movielist" value="${moviedao.movieselectall() }"></c:set>
<jsp:useBean id="theaterdao" class="theater.TheaterDAO"></jsp:useBean>
<c:set var ="theaterlist" value="${theaterdao.theaterselectall() }"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 페이지</title>
<link rel="stylesheet" href="${cpath}/assets/bootstrap.min.css">
<style>
.modal-dialog{
    overflow-y: initial !important
}
.modal-body{
    height: 100%;
    overflow-y: auto;
}

</style>
</head>
<body>

	<div class="container my-3">
		<div class="row">
			<div class="col-md-3 "  data-bs-spy="scroll">
				<div>
					<h3>영화</h3>
				</div>
				<ul class="list-group ">
			<c:forEach var ="Movie" items="${movielist }">
					<li class=" list-group-item list-group-items-info"><a href="#" onclick="return false" title="${Movie.title}">${Movie.title }</a></li>
			</c:forEach>
				</ul>
			</div>
			<div class="col-md-3" >
				<div>
					<h3>영화관</h3>
				</div>
				<ul class ="list-group">
			<c:forEach var ="Theater" items="${theaterlist }">
					<li class="list-group-item list-group-items-info"><a href="#" onclick="return false" title="${Theater.tname}">${Theater.tname }</a></li>
			</c:forEach>
				</ul>
			</div>
				<div class="col-md-3" >
				<div>
					<h3>상영관</h3>
				</div>
				<ul class ="list-group">
<%-- 			<c:forEach var ="Theater" items="${theaterlist }">
					<li class="list-group-item list-group-items-info"><a href="#" onclick="return false" title="${Theater.tname}">${Theater.tname }</a></li>
			</c:forEach> --%>
				</ul>
			</div>
	</div>
	</div>
	
	<script>

	
	
	</script>
	
	
	
	
	
</body>
</html>