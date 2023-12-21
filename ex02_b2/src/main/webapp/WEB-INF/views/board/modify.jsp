<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<c:set var="contextPath" value="${pageContext.request.contextPath }"/> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<h4>글 수정하기</h4>
	<form action="${contextPath}/board/modify" method="post">
		<table border="1">
			<tr>
				<th> 글 번호 </th>
				<th><c:out value="${boardSelect.bno }"/></th>
			</tr>
			<tr>
				<th> 글 제목 </th>
				<th><input type="text" name="title" value="${boardSelect.title }"></th>
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
				<th><input type="text" name="content" value="${boardSelect.content }"></th>
			</tr>
		</table>
		<a href="${contextPath}/board/list">수정취소</a>
		<a href="${contextPath}/board/remove?bno=${boardSelect.bno}">글 삭제</a>
		<input type="hidden" name="bno" value="${boardSelect.bno }">
		<button type="submit">글 수정</button>
	</form>
</body>
</html>