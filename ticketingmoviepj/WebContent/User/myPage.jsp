<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:useBean id="dao" class="user.UserDAO" ></jsp:useBean>
<c:set var = "info" value="${dao.userInfo(login)}"></c:set>
<jsp:useBean id="dao1" class="ticketing.TicketingDAO" ></jsp:useBean>
<c:set var = "ticketList" value="${dao1.selectTicketOne(login) }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${info.userid } 페이지</title>
<link rel="stylesheet" href="${cpath}/assets/bootstrap.min.css">
</head>
<body>
	<div class="container my-5">
	
		<div class="row my-3">
			<div class="col-5">
				<h4>마이페이지</h4>	
			</div>
		</div>
	    <div class="form-group">
            <label for="email">아이디</label>
            <span class = "form-control">${info.userid}</span>
        </div>
        <div class="form-group">
            <label for="username">이름</label>
            <span class = "form-control">${info.username}</span>
        </div>
        <div class="form-group">
            <label for="age">나이</label>
            <span class = "form-control">${info.age}</span>
        </div>
         <div class="form-group">
            <label for="phoneNum">핸드폰번호</label>
            <span class = "form-control">${info.phoneNum}</span>
        </div>
	</div>
	
	<div class="container">
		<div class ="row">
			<div class="col-5">
				<h4>예약정보</h4>
			</div>
		 </div>
		 		 
		 <table class ="table">
		 	<thead>
		 		<tr>
		 			<th>티켓번호</th>
		 			<th>좌석번호</th>
		 			<th>날짜</th>
		 			<th>시간</th>		
		 			<th>제목</th>		
		 			<th>연령대</th>		
		 		</tr>
		 	
		 	</thead>
		 	<tbody>
		 		<c:forEach var="tikcetInfo" items="${ticketList }">
		 		<tr>
		 			<td>${tikcetInfo.ticketingId }</td>
		 			<td>${tikcetInfo.seatNum }</td>
		 			<td>${tikcetInfo.date }</td>
		 			<td>${tikcetInfo.time }</td>
		 			<td>${tikcetInfo.title }</td>
		 			<td>${tikcetInfo.age }</td>		 		
		 		</c:forEach>
		 	</tbody>
		 </table>
	</div>
	
</body>
</html>