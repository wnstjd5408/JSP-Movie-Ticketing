<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="result" class="calculation.Computer"/>
	<jsp:setProperty property="*" name="result"/>
	
	
	<p><%= result.getNum1() %> <%= result.getOperator() %> <%=result.getNum2() %>
	= <%= result.getResult() %>
	</p>
	
	
</body>
</html>