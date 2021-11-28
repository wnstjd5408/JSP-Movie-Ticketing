<%@ include file ="../nav.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("UTF-8"); %>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="cpath">${pageContext.request.contextPath }</c:set>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie 메인</title>
<link rel="stylesheet" href="${cpath}/assets/bootstrap.min.css">
</head>
<body>
	<jsp:useBean id="dao" class ="movie.MovieDAO"></jsp:useBean>
	<c:set var="movielist" value="${dao.movieselectall()}"></c:set>
	<table class ="container my-3">
        <thead>
        <tr class="thead-dark">
            <th>번호</th>
            <th>이미지</th>
            <th>제목</th>
        </tr>
        </thead>
        <tbody>
        	
			<c:forEach var ="Movie" items="${movielist}" >
			
				<tr>
					<td>${Movie.id}</td>
					<td>
					<a href="MovieDetail.jsp?id=${Movie.id}"><img src="${Movie.img}" class='img-fluid ' alt="a"></a>
					</td>
					<td>${Movie.title }</td>
				</tr>
			</c:forEach>
		<%-- 	<%
				MovieDAO dao = new MovieDAO();
				ArrayList<MovieDTO> dto = dao.movieselectall();
				
				for(MovieDTO movielist : dto){
			%>
				<td><%=movielist.getId() %></td>
				<td><img src="<%=movielist.getImg() %>" class='img-fluid ' alt="a"></td>
				<td><%=movielist.getTitle()%></td>
			 </tr>
	
			<%
				}
				
			%> --%>
		
						
        </tbody>
    </table>
</body>
</html>