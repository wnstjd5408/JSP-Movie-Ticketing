<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
<link rel="stylesheet" href="../assets/bootstrap.min.css">

<link rel="shortcut icon" type="image/x-icon" href="https://img.cgv.co.kr/theater_img/favicon.ico">
  <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
  </style>
  <link href="../assets/singin.css" rel="stylesheet">
</head>
<body class="text-center">
	<main class="form-signin">
		<form action="#" method="post">
			<a href = "../Movie/MainForm.jsp"><img src="https://img.cgv.co.kr/R2014/images/title/h1_cgv.png" class="mb-4" alt="" width="291" height="56"></a>
			<label for ="inputEmail" class="visually-hidden">ID</label></br>
			<input name = "userid" id="inputEmail" class="form-control"placeholder="아이디" required autofocus>
			<label for="inputPassword" class="visually-hidden">Password</label></br>
    		<input name ="userpw" type="password" id="inputPassword" class="form-control" placeholder="비밀번호" required>
			<button class="w-100 btn btn-lg btn-danger" type="submit">로그인</button>
		
		</form>
	</main>
</body>
</html>