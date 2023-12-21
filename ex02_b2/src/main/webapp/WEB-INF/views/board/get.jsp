<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<c:set var="contextPath" value="${pageContext.request.contextPath }"/> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>글 상세보기</h4>
	<form action="${contextPath}/board/remove" method="post">
		<table border="1">
			<tr>
				<th> 글 번호 </th>
				<th><c:out value="${boardSelect.bno }"/></th>
			</tr>
			<tr>
				<th> 글 제목 </th>
				<th><c:out value="${boardSelect.title }"/></th>
			</tr>
			<tr>
				<th> 작성자 </th>
				<th><c:out value="${boardSelect.writer }"/></th>
			</tr>
			<tr>
				<th> 작성일 </th>
				<th><c:out value="${boardSelect.regdate }"/></th>
			</tr>
			<tr>
				<th> 글 내용 </th>
				<th><c:out value="${boardSelect.content }"/></th>
			</tr>
		</table>
		<a href="${contextPath}/board/list">글 목록</a>
		<a href="${contextPath}/board/modify?bno=${boardSelect.bno}">글 수정</a>
		<input type="hidden" name="bno" value="${boardSelect.bno }">
		<button type="submit">글 삭제</button>
	</form>
</body>
</html>