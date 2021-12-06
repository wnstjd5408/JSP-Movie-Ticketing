<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<% request.setCharacterEncoding("utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID check</title>
</head>
<body>
	<jsp:useBean id="dao" class="user.UserDAO"></jsp:useBean>
	<jsp:useBean id="check" class="user.UserDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="check"/>
	<c:set var = "idcheck" value="${dao.idCheck(check) }"></c:set>
	
	
	
	<c:if test="${idcheck == 1 }">
		
		<br><br>
		<p>${check.userid } 는 사용 불가능한 아이디입니다!!!</p>
	</c:if>
	<c:if test="${idcheck != 1 }">
	
		<br><br>
		<p>${check.userid } 는 사용 가능한 아이디입니다!!!</p>
	</c:if>
</body>
</html>