<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="first_board.*"%>
    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
   <jsp:useBean id="dao" class="first_board.BoardDao"/>
   
   <%
   int num = Integer.parseInt(request.getParameter("num"));
   BoardVO vo = dao.selectOne(num);
   pageContext.setAttribute("vo",vo);
   %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>글 수정</title>
</head>
<body>
<h3>글 수정하기</h3>
<form action="/first_board/board/edit.jsp" method="post">
<input type="hidden" name="num" value="${vo.num}">
	<input type="text" name="title" value="${vo.title}" required><br>
	<input type="text" name="writer" value="${vo.writer}" required disabled><br>
	<textarea rows="20" cols="20" name="content" placeholder="내용">${vo.content}</textarea><br>
	<input type="submit" value="수정">

</form>
</body>
</html>