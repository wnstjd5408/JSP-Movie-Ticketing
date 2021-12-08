<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8"); %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dao" class="user.UserDAO"></jsp:useBean>
	<jsp:useBean id="login" class ="user.UserDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="login"/>
	<c:set var = "list" value = "${dao.userSelectOne(login)}"></c:set>
	
	<c:if test="${list != null }">
		<c:set var="login" scope="session">${login.userid }</c:set>
		<script>
			alert('로그인 성공했습니다');
			location.replace('${cpath}/Movie/MainUI.jsp');	
		</script>
	</c:if>
		<c:if test="${list == null }">
		<script>
			alert('로그인 실패했습니다');
			location.replace('loginUI.jsp');	
		</script>
	</c:if>
</body>
</html>