<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> JavaBeans 이용한 학생의 이름과 성적의 저장과 조회 예제</h2>
	
	
	<jsp:useBean id="score" class="javabean.ScoreBean" scope="page"/>
	
	
	<hr>
	
	<h3> 이름과 성적을 JavaBeans ScoreBeans에 저장</h3>
	
	
	이름 <%= "김성민" %>,
	성적 <%= "85" %><p>
	
	
	<jsp:setProperty property="name" name="score" value="김성민"/>
	<jsp:setProperty property="point" name="score" value="85"/>
	
	<hr>
	
	
	<jsp:getProperty property="name" name="score"/><br>
	<jsp:getProperty property="point" name="score"/><br>
	<%= score.getGrade() %>
</body>
</html>