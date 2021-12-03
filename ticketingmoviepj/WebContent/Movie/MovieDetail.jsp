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
<style>
	.box{
	
		border : 1px solid black;
	}
</style>
</head>
<body>
	<div class ="container box">
		<h1>${moviedetail.title }</h1>
		<div class ="row">
			<div class ="col-3">
				<img src="${moviedetail.img}" class='img-fluid ' alt="a">
			</div>
			<div class ="col-8 text-justify box">
				<div class="m-2">개봉날짜 : ${moviedetail.openMovie}</div>
				<div class="m-2">감독 :${moviedetail.director }</div>
				<div class="m-2">배우 :${moviedetail.actor }</div>
				<div class="row text-center">
					<div class="col-md-3 m-1">장르 : ${moviedetail.genre}</div>
					<div class="col-md-3 m-1">나라 : ${moviedetail.country}</div>
					<div class="col-md-3 m-1">등급 : ${moviedetail.age }</div>
				</div>
				<div class="m-2">런닝 타임 : ${moviedetail.runningtime }</div>
			</div>
			
		</div>
	<div class="m-2 box">
	<p class="lead">${moviedetail.content }</p>
	</div>
	</div>
</body>
</html>