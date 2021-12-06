<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${cpath}/assets/bootstrap.min.css">
<link rel="shortcut icon" type="image/x-icon" href="https://img.cgv.co.kr/theater_img/favicon.ico">

<style>
	a{
	 color: red;
	
	}

</style>
<script src="${cpath }/assets/jquery-3.6.0.min.js"></script>
</head>
<body>
	<c:if test="${login != null }">
			<c:redirect url ="../Movie/MainForm.jsp"></c:redirect>
	</c:if>
<div class ="container my-3">
    <div class = "row">
        <div class="col-4">
            <h4>로그인</h4>
        </div>
        <div class="col-8 text-right">
            <span>또는 <a href="#">관리자 계정으로</a></span>
        </div>
    </div>
    <form method="post" class="post-form" action="loginprocess.jsp">   
        <div class="form-group">
            <label for="userid">아이디</label>
            <input type="text" class="form-control" name="userid" id="userid"
            required >
        </div> 
        <div class="form-group">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" name="password" id="password" 
            required>
        </div>
        <button type = "submit" class="btn btn-danger">로그인</button>
    </form>
    
</div> 
</body>
</html>