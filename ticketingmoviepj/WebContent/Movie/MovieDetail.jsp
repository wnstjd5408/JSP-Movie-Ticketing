<%@ include file ="../nav.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>

<jsp:useBean id="dao" class="movie.MovieDAO"></jsp:useBean>	
<c:set var ="moviedetail" value="${dao.movieSelectOne(param.id)}"></c:set>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${cpath }/assets/bootstrap.min.css">
<title>${moviedetail.title }</title>
</head>
<body>
	<div class ="container">
		<h1>${moviedetail.title }</h1>
		<div class ="row">
			<div class ="col-3">
				<img src="${moviedetail.img}" class='img-fluid ' alt="a">
			</div>
			<div class ="col-8 text-justify">
				<div>개봉날짜 : ${moviedetail.openMovie}</div>
				<div>감독 :${moviedetail.director }</div>
				<div>배우 :${moviedetail.actor }</div>
				<div class="row text-center">
					<div class="col-md-3">장르 : ${moviedetail.genre}</div>
					<div class="col-md-3">나라 : ${moviedetail.country}</div>
					<div class="col-md-3">등급 : ${moviedetail.age }</div>
				</div>
				<div>런닝 타임 : ${moviedetail.runningtime }</div>
			</div>
			
		</div>
	<p class="lead">${moviedetail.content }</p>
	</div>
</body>
</html>