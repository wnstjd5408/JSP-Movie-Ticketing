<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery로 Ajax 요청보내기</title>
</head>
<body>
	<h1>POST방식의 요청</h1>
	<button type="button" onclick="sendRequest()">POST방식으로 요청 보내기!</button>
	<p id="text"></p>
</body>
<script src="//code.jquery.com/jquery-3.5.1.min.js" ></script>
<script>

	function sendRequest(){
		
		$.ajax({
			url : "ajaxpr.jsp",
			type : "get",
			data : {
				city : "Seoul",
				zipcode : "12345"
				},
			dataType : "json",
			success : function(result){
				document.getElementById("text").innerHTML = result;
			},
			error : () => {
	                alert('실패');
	        }
		});
	}
</script>
</html>