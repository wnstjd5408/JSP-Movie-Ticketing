<%@page import="java.util.ArrayList"%>
<%@page import="seat.SeatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:useBean id="dao" class="seat.SeatDAO"></jsp:useBean>
<c:set var="seatList" value="${dao.seatSelectAll(param.id) }"></c:set>
<!DOCTYPE html>	
<html>
<head>
<link rel="stylesheet" href="${cpath}/assets/bootstrap.min.css">
<style>
.seatClick {
	background-color: gray;
	color: white;
}
</style>
<meta charset="UTF-8">
<title>좌석선택</title>
<script src="${cpath }/assets/jquery-3.6.0.min.js"></script>

</head>
<body>
	<c:if test="${login == null }">
	
		<c:redirect url ="${cpath}/Movie/MainUI.jsp"></c:redirect>
	</c:if>


	<div class="container-fluid my-2">
		<div class="row my-3">
			<div class="col-4">
				<h4>좌석선택</h4>
			</div>
		</div>

		<div class="row">
			<c:forEach var="seat" items="${seatList }" varStatus="status">
				<c:choose>

					<c:when test="${seat.seatCheck == true }">
						<div class="col-2 btn-group">
							<button id=${status.count } class="btn btn-default seatClick "
								name="seats" disabled="disabled">${status.count }</button>
						</div>
					</c:when>
					<c:otherwise>
						<div class="col-2 btn-group">
							<button id=${status.count }
								class="btn btn-primary btn-toggle seatUnClick"
								onclick="buttonClick(${seat.seatNum})" name="seats">${status.count }</button>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<div>
			<br> <br>
			<form method="post" class="post-form" action="TicketingCheck.jsp">
				<input type="hidden" class=form-control  name="seatNum"
					id="seatNum">
				<input type="hidden" class=form-control  name="userId"
					id="userId">
				<button id="bTicketing" type="submit"
					class="form-control btn btn-danger" disabled="disabled">예매하기</button>
			</form>
		</div>

	</div>

	<script>
	function buttonClick(s){
		const login = '${login}';
		$("#bTicketing").attr('disabled', false);
		$("#userId").val(login);
		$("#seatNum").val(s);
		console.log(s);
	};
</script>

</body>
</html>