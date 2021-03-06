<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<jsp:useBean id="ticket" class="ticketing.TicketingDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ticket"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<body>

<jsp:useBean id="dao" class="ticketing.TicketingDAO"></jsp:useBean>
<c:set var ="ticket"  value = "${dao.insertTicket(ticket) }"></c:set>


<c:if test="${ticket >= 1 }">
	<script>
		alert('예약 성공!!!')
		location.replace('${cpath}/Movie/MainUI.jsp');		
	</script>
</c:if>
<c:if test="${ticket < 1 }">
	<script>
		alert('예약 실패입니다!! 다시입력해주세요~~~');
		location.replace('${cpath}/Ticketing/TicketingUI.jsp');
	</script>
</c:if>

</body>
</html>