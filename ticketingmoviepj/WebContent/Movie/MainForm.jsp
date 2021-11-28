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
	<div class ="container my-3">
 			<div class= "row">
        	
			<c:forEach var ="Movie" items="${movielist}" >
				<div class ="col-4 col-md-4 text-center">
					<a  href="MovieDetail.jsp?id=${Movie.id}"><img src="${Movie.img}" class='img-fluid ' alt="a"></a>
					<p>${Movie.title }</p>
				</div>		
			</c:forEach>
			</div>
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
		
						
	</div>
</body>
</html>