<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${cpath }/assets/bootstrap.min.css">
<link rel="shortcut icon" type="image/x-icon" href="https://img.cgv.co.kr/theater_img/favicon.ico">
<title>회원가입</title>
</head>
<body>
	<c:if test="${login != null }">
		<c:redirect url="${cpath }/Movie/MainForm.jsp"></c:redirect>
	</c:if>

	
	<div class="container my-3">
		<div class="row my-3">
			<div class="col-4">
				<h4>계정 생성</h4>	
			</div>
		</div>
		<form method="post" class="post-form" name="joinform" onsubmit="return check()" action="registerProcess.jsp">
			<div class="form-group">
				<label for ="userid">아이디</label>
				<div class="row">
					<div class ="col-md-8">
						<input type="text" class="form-control" id="userid" name="userid" required autofocus>
					</div>
					<div class ="col-md-2">	
						<input type="button" class ="btn btn-danger" value="중복확인" onclick="idcheck()">
					</div>
				</div>
			</div>
			<div class="form-group">
            	<label for="password">비밀번호</label>
            	<input type="password" class="form-control" id="password" name="password" required >
       	 	</div>
       	 	 <div class="form-group">
            	<label for="username">이름</label>
            	<input type="text" class="form-control" id="username" name="username">
        	</div>
        	<div class="form-group">
            	<label for="age">나이</label>
            	<input type="number" min=1 class="form-control" id="age" name="age">
       	 	</div>
       	 	 <div class="form-group">
            	<label for="phoneNum">핸드폰번호</label>
            	<input type="text" class="form-control" id="phoneNum" name="phoneNum">
        	</div>
			<button type="submit" class="form-control btn btn-danger">생성하기</button>
	
	
			
		</form>	
	</div>
	
	<script>
	function check() {
		if(!document.joinform.userid.value){
			alert("ID를 입력하세요");
			return false;
		}
		if(!document.joinform.password.value){
			alert("password를 입력해주세요");
			return false;
		}
		if(!document.joinform.username.value){
			alert("이름을 입력해주세요");
			return false;
		}
	}
	
	
	function idcheck(){
		var userid = document.joinform.userid.value;
		if(userid.length < 1 || userid == null){
			alert("중복체크할 아이디를 입력하십시오");
			return false;
		}
		
		var url = "idCheck.jsp?userid=" + userid;
		open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbar=no,resizable=no,width=300,height=200");
	}
	
	
	</script>
</body>
</html>