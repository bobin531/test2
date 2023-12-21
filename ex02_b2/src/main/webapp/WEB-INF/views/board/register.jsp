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
	<h4>글 작성</h4>
	    <form action="/board/register" method="post">

        <label for="title">제목:</label><br>
        <input type="text" id="title" name="title" ><br>

        <label for="writer">작성자:</label><br>
        <input type="text" id="writer" name="writer" ><br>
        
        <label for="content">내용:</label><br>
        <textarea id="content" name="content" rows="4" cols="50" ></textarea><br>
		<a href="/board//list">작성취소</a>
        <input type="submit" value="글 작성">
    </form>
</body>
</html>