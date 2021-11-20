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
	<p>${moviedetail.title }</p>
	<img src="${moviedetail.img}" class='img-fluid ' alt="a">
	<p>${moviedetail.content }</p>
</body>
</html>