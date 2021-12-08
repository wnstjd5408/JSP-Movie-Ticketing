<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:remove var="login" scope="session"/>
	
	<script>
		alert("로그아웃되었습니다!!!");
		location.href="${cpath}/Movie/MainUI.jsp"
	
	</script>
</body>
</html>