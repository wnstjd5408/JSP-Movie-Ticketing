<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="join" class="user.UserDTO"></jsp:useBean>
<jsp:setProperty property="*" name="join"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="user.UserDAO"></jsp:useBean>

<c:set var = "join" value ="${dao.insertUser(join)}"></c:set>




<c:if test="${join >= 1 }">
	<script>
		alert('회원가입 성공!!!')
		location.replace('loginform1.jsp');		
	</script>
</c:if>
<c:if test="${join < 1 }">
	<script>
		alert('회원가입 실패입니다!! 다시입력해주세요~~~');
		location.replace('registerform.jsp');
	</script>
</c:if>
</body>
</html>