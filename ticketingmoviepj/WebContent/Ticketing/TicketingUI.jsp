<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../navUI.jsp" %>    
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
<link rel="stylesheet" href="${cpath}/assets/style.css">
<link rel="stylesheet" href="${cpath}/assets/bootstrap.min.css">
<style>
.modal-dialog{
    overflow-y: initial !important
}
.modal-body{
    height: 100%;
    overflow-y: auto;
}

.anyclass{
  height:500px;
  overflow-y: scroll; 
}


</style>


<script src="${cpath }/assets/popper.js"></script>
<script src="${cpath }/assets/jquery-3.6.0.min.js"></script>

</head>
<body>
	<div class="container-fluid my-2">
		<div class="row">
			
			<div class="col-2 col-md-2" >
				<div>
					<h3>영화관</h3>
				</div>
			<ul id = "theaterList" class ="list-group">
			<c:forEach var ="Theater" items="${theaterlist }">
					<li class="list-group-item list-group-items-info _${Theater.tid}" ><button class="btn btn-primary btn-sm">${Theater.tname}</button></li>
			</c:forEach>
		     </ul>
			</div>
			<div class="col-3 col-md-3" >
				<div>
					<h3>영화</h3>
				</div>
				<ul id="movieList" class="list-group anyclass">
			<c:forEach var ="Movie" items="${movielist }">
					<li class="list-group-item list-group-items-info _${Movie.id}"><button  class="btn btn-primary btn-block btn-sm" >${Movie.title}</button></li>
			</c:forEach>
				</ul>
			</div>
			<div class="col-3 col-md-3 " >
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
			<div class="row " id="view" style="display :none;" >
				<div class="col-md-12" >
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
				    <div id= "calendar" class="calendar_content">
				    	<div class="blank"></div>
				    	<div class="blank"></div>
				    	<div class="blank"></div>
						<c:forEach var="i" begin="1" end="31" varStatus="status">
							<c:if test="${i < 10 }">
							    <div class="-0${i}"><c:out value="${i}" /></div>
							</c:if>
							<c:if test= "${i >= 10 }">
							   <div class="-${i}"><c:out value="${i}" /></div>
							</c:if>
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
	<div>
		<button id="sendSeat" class= 'btn btn-danger btn-block my-5 ' disabled="disabled">좌석선택</button>
	</div>


	<script type = "text/javascript">
	$(document).ready(function() {
 			var id = null; //영화관 아이디
 			var timeid = null; //타임리스트 아이디
 			var sendid = null; //좌석선택시 보내는값
 			var tid = null;//상영관 아이디 PK
 			
 		
 			
 			
 			// 영화관 클릭을 했을 때 영화관의 PK를 전해줌
			$("#theaterList").on('click', 'li', function(){
				var theaterid = $(this).attr("class");
				theaterid = theaterid.split('_');
				tid = theaterid[1];
				console.log(tid);
				$('#timeList').empty();
				closeCalendar();
				
		 	$.ajax({
					type : 'get',
					url : 'http://localhost:8090/ticketingmoviepj/TheaterClickController', 
					data : {tid: tid},
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
 			
			//상영관리스트 출력
			function makeRoList(data){
			  $('#roomlist').empty();
			  $.each(data, function (i, item) {
				  
				  $("#roomlist").append("<li id='btnRoom' class='list-group-item list-group-items-info _"
						  + item.rid +"'><button class='btn btn-primary btn-block btn-sm'>"
						  + item.rname + "</button></li>")
			  });
			
			} 
			
			//영화리스트 클릭시 상영관 클래스에 클래스이름을 더함
			$("#movieList").on('click', 'li', function(){
				console.log("영화리스트 클릭시 영화관 아이디값 :" +tid);
				console.log("영화리스트 클릭시 타임리스트 아이디값 :" + timeid)
			
				$('#timeList').empty();
				if(id != null){
					$("#roomlist li").removeClass(id);
				}
				
				if(timeid != null){
					$("#calendar div").removeClass(timeid);
				}
				var movieId = $(this).attr("class");
				movieId = movieId.split('_');
			    movieId = "_" + movieId[1];
			   
				$("#roomlist li").addClass(movieId);
			    id = movieId;
				console.log("영화리스트 클릭시 영화 아이디값 :" + id)
			});
			
			
			//상영관 클릭시 변화
			$("#roomlist").on('click', 'li', function(){
				if(timeid != null){
					$("#calendar div").removeClass(timeid);
				}
				var roomId = $(this).attr("class");
				roomId = roomId.split('_');
				room = roomId[1];
				movie = roomId[2];
				console.log("상영관리스트 클릭시 타임리스트 아이디값 :" + timeid)
				console.log("상영관리스트 클릭시 상영관 PK :" + room)
			$.ajax({
					type : 'get',
					url : 'http://localhost:8090/ticketingmoviepj/RoomClickController',
					data : { movie :movie, room : room},
				    dataType : "json",
					success : function(data){
						if(data == null){
							closeCalendar();
							return;
						}
						viewCalendar();
						console.log(data);
						makeTiList(data);
						$('#calendar div').addClass('-'+ room);
						$('#calendar div').addClass('-'+ movie);
						timeid = '-'+ room + ' -' + movie;
					},
					error : function(request, status, error){
		                console.log("실패");
		            }
				}); 
			
			});
			
			//calendar 보여주기
			function viewCalendar(){

				jQuery('#view').css("display", "block");  	
			};
			
			//calendar 감추기
			function closeCalendar(){
				jQuery('#view').css("display", "none");  	
			}

			//calendar 날짜 선택시 시간테이블에서 시간 출력
			$('#calendar').on('click', 'div', function(){

				var timeId = $(this).attr("class");
				var timeId = timeId.split('-');
				console.log(timeId[1]);
				console.log(timeId[2]);
				console.log(timeId[3]);
				
		 	$.ajax({
				type:'get',
				url : 'http://localhost:8090/ticketingmoviepj/CalendarClickController',
				data : {date : timeId[1], roomId : timeId[2], movieId : timeId[3]},
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
			
			//타임 리스트 출력
			function makeTiList(data){
				$('#timeList').empty();
				$.each(data, function (i, item) {
					console.log(i);
					
					 $("#timeList").append("<li id='btnTime' class='list-group-item list-group-items-info _"
							  + item.timeid +"'><button class='btn btn-primary btn-block btn-sm'>"
							  + item.time + "</button></li>")
				});
			}
			
			//타임리스트 클릭시 버튼 disable = true
 			$("#timeList").on('click', 'li', function cl(){
 				timeId = $(this).attr("class");
 				timeId = timeId.split('_');
 				console.log(timeId[1]); //timeId PK
				$('#sendSeat').attr('disabled', false);
				sendid = timeId[1]
 				
 			});
 			
 			
 			//좌석 선택 버튼을 눌렀을때
 			$("#sendSeat").on('click', function(){
 				location.href = 'SeatCheckingUI.jsp?id=' + sendid;
 					
 			});
			
	});
	</script>

</body>
</html>