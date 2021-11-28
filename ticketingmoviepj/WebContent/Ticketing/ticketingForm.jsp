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
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
<link rel="stylesheet" href="${cpath}/assets/bootstrap.min.css">
<link rel="stylesheet" href="${cpath}/assets/style.css">
<style>
.modal-dialog{
    overflow-y: initial !important
}
.modal-body{
    height: 100%;
    overflow-y: auto;
}


</style>

<script src="${cpath }/assets/bootstrap.min.js"></script>
<script src="${cpath }/assets/popper.js"></script>
<script src="${cpath }/assets/jquery.min.js"></script>

</head>
<body>
<%-- 	<jsp:useBean id="roomdao" class="room.RoomDAO"></jsp:useBean>
	<c:set var = "roomlist" value = "${roomdao.theaterSelectOne() }"></c:set> --%>
	<div class="container-xl">
		<div class="row">
			
			<div class="col-md-2" >
				<div>
					<h3>영화관</h3>
				</div>
			<ul id = "theaterList" class ="list-group">
			<c:forEach var ="Theater" items="${theaterlist }">
					<li class="list-group-item list-group-items-info _${Theater.tid}" ><button class="btn btn-primary">${Theater.tname}</button></li>
			</c:forEach>
		     </ul>
			</div>
			<div class="col-md-3"  data-bs-spy="scroll">
				<div>
					<h3>영화</h3>
				</div>
				<ul id="movieList" class="list-group ">
			<c:forEach var ="Movie" items="${movielist }">
					<li class="list-group-item list-group-items-info _${Movie.id}"><button  class="btn btn-primary" >${Movie.title}</button></li>
			</c:forEach>
				</ul>
			</div>
			<div class="col-md-3 " >
				<div>
					<h3>상영관</h3>
				</div>
				
				
				<ul id="roomlist" class="list-group ">	
			
				</ul>
			</div>
			<div class ="col-md-3">
				<div class="container">
			<div class="row justify-content-center">
					<h2 class="heading-section">Calendar</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="calendar calendar-first" id="calendar_first">
				    <div class="calendar_header">
				        <button class="switch-month switch-left"> <i class="fa fa-chevron-left"></i></button>
				         <h2>December 2021</h2>
				        <button class="switch-month switch-right"> <i class="fa fa-chevron-right"></i></button>
				    </div>
				    <div class="calendar_weekdays">
				    	<div style="color: rgb(68, 68, 68);">일</div>
				    	<div style="color: rgb(68, 68, 68);">월</div>
				    	<div style="color: rgb(68, 68, 68);">화</div>
				    	<div style="color: rgb(68, 68, 68);">수</div>
				    	<div style="color: rgb(68, 68, 68);">목</div>
				    	<div style="color: rgb(68, 68, 68);">금</div>
				    	<div style="color: rgb(68, 68, 68);">토</div>
				    </div>
				    <div class="calendar_content">
				    	<div class="blank"></div>
				    	<div class="blank"></div>
				    	<div class="blank"></div>
						<c:forEach var="i" begin="1" end="31" varStatus="status">
						<div><c:out value="${i}" /></div>
						</c:forEach>
						<div class="blank"></div>				    
				    </div>
					</div>
				</div>
			</div>
			<ul id ="timeList" class="list-group ">
			
			</ul>
		</div>
				
		
			</div>
	</div>

	<script type = "text/javascript">
	$(document).ready(function() {
 			var id = null;
			
			//상영관리스트 출력
			function makeRoList(data){
			  $('#roomlist').empty();
			  $.each(data, function (i, item) {
				  
				  $("#roomlist").append("<li id='btnRoom' class='list-group-item list-group-items-info _"
						  + item.rid +"'><button class='btn btn-primary'>"
						  + item.rname + "</button></li>")
			  });
			} 
			
			//타임 리스트 출력
			function makeTiList(data){
				$('#timeList').empty();
				$.each(data, function (i, item) {
					console.log(i);
					
					 $("#timeList").append("<li id='btnTime' class='list-group-item list-group-items-info _"
							  + item.timeid +"'><button class='btn btn-primary'>"
							  + item.time + "</button></li>")
				});
			}
			$("#movieList").on('click', 'li', function(){
				if(id != null){
					$("#roomlist li").removeClass(id);
				}
				var movieId = $(this).attr("class");
				movieId = movieId.split('_');
				console.log("영화 클릭시 : " + movieId[1]);
			    movieId = "_" + movieId[1];
			   
				$("#roomlist li").addClass(movieId);
			    id = movieId;
			});
			
			$("#roomlist").on('click', 'li', function(){
				var roomId = $(this).attr("class");
				roomId = roomId.split('_');
				room = roomId[1];
				movie = roomId[2];
				console.log("상영관 클릭시 :" + room)
			$.ajax({
					type : 'get',
					url : 'http://localhost:8090/ticketingmoviepj/RoomClickController',
					data : { movie :movie, room : room},
				    dataType : "json",
					success : function(data){
						console.log(data);
						makeTiList(data);
					},
					error : function(request, status, error){
		                console.log("실패");
		            }
				}); 
			
			});
					
			
			
			// 영화관 클릭을 했을 때 영화관의 PK를 전해줌
			$("#theaterList").on('click', 'li', function(){
				var theaterid = $(this).attr("class");
				theaterid = theaterid.split('_');
				var id = theaterid[1];
				
		 	$.ajax({
					type : 'get',
					url : 'http://localhost:8090/ticketingmoviepj/TheaterController', 
					data : {id: id},
   				    dataType : "json",
					success : function(data){
						console.log(data);
						makeRoList(data);
					},
					error : function(request, status, error){
		                console.log("실패");
		            }
				}); 
			
		});
			
	});
	</script>
	
 
	
	
	
	
	
</body>
</html>