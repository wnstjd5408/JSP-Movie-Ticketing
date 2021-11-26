<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../nav.jsp" %>    
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:useBean id="moviedao" class="movie.MovieDAO"></jsp:useBean>
<c:set var="movielist" value="${moviedao.movieselectall() }"></c:set>
<jsp:useBean id="theaterdao" class="theater.TheaterDAO"></jsp:useBean>
<c:set var ="theaterlist" value="${theaterdao.theaterselectall() }"></c:set>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 페이지</title>
<link rel="stylesheet" href="${cpath}/assets/bootstrap.min.css">
<style>
.modal-dialog{
    overflow-y: initial !important
}
.modal-body{
    height: 100%;
    overflow-y: auto;
}

</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<%-- 	<jsp:useBean id="roomdao" class="room.RoomDAO"></jsp:useBean>
	<c:set var = "roomlist" value = "${roomdao.theaterSelectOne() }"></c:set> --%>
	<div class="container my-3">
		<div class="row">
			
			<div class="col-md-3" >
				<div>
					<h3>영화관</h3>
				</div>
				<ul class ="list-group">
				<!--<a href="#" onclick="theaterCheck(this)"  title="${Theater.tname}">${Theater.tname }</a>  -->
			<c:forEach var ="Theater" items="${theaterlist }">
					<li  class="list-group-item list-group-items-info -${Theater.tid}" id ="aThe"><a href="#" onclick="return false">${Theater.tname}</a></li>
			</c:forEach>
				</ul>
			</div>
			<div class="col-md-3 "  data-bs-spy="scroll">
				<div>
					<h3>영화</h3>
				</div>
				<ul id="theater"class="list-group ">
			<c:forEach var ="Movie" items="${movielist }">
					<li  class="list-group-item list-group-items-info -"><button id="btnMov" class="btn btn-primary" value="id" >${Movie.title}</button></li>
			</c:forEach>
				</ul>
			</div>
			<div class="col-md-3" >
				<div>
					<h3>상영관</h3>
				</div>
				<ul id="roomlist">	
				
					
				</ul>
			</div>
	</div>
	</div>

	<script type = "text/javascript">
	$(document).ready(function() {
			$("#aThe").click(function(){
				var theaterid = $(this).attr("class");
				theaterid = theaterid.split('-');
				console.log(theaterid[6]);
		
			$.ajax({
					type : 'get',
					url : '/TheaterController',
					data : {theatercheck : theaterid},
					dataType : "json",
					success : function(data){
						console.log(data)
					},
					error : () => {
		                console.log("실패");
		            }
				});
			
		});
	});
	</script>
	
 
	
	
	
	
	
</body>
</html>