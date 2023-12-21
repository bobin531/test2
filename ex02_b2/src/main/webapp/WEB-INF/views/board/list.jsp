<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<c:set var="contextPath" value="${pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	   var msg = true;
		<c:if test="${!empty alert}">
			if(msg){
				alert("${alert}");
				msg = false;
		    }
		</c:if>
	</script>
</head>
<body>
	<form action="/list"  method="post" >
		<table border="1">
			<tr>
				<th>bno</th>
				<th>title</th>
				<th>content</th>
				<th>writer</th>
				<th>regdate</th>
			</tr>
			<c:forEach var="vo" items="${boardList }">
				<tr>
					<td><c:out value="${vo.bno }"/></td>
					<td><a href="/board/get?bno=${vo.bno}"><c:out value="${vo.title }"/></a></td>
					<td><c:out value="${vo.content }"/></td>
					<td><c:out value="${vo.writer }"/></td>
					<td><c:out value="${vo.regdate }"/></td>
				</tr>
			</c:forEach>
		</table>
		<a href="/board/register">글쓰기</a>
	</form>
</body>
</html>