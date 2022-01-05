<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="first_board.*, java.util.List"%>
    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%
    BoardDao dao = new BoardDao();
    List<BoardVO> ls = dao.selectAll();
    pageContext.setAttribute("ls",ls);
    %>
   
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>목록</title>
</head>
<body>
<h2>게시글 목록</h2>
<a href="../index.jsp">main 이동</a>
<br>
<table border="1">
<tr>
<th>번호</th>
<th>제목</th>
<th>작성자</th>
<th>등록일</th>
<th>조회수</th>
</tr>
<c:forEach var="first_board" items="${ls}">
<tr> 
	<td>${first_board.num}</td>
	<td><a href="${pageContext.request.contextPath}/board/boardDetail.jsp?num=${first_board.num}">${first_board.title}</a></td>
	<td>${first_board.writer}</td>
	<td>${first_board.regdate}</td>
	<td>${first_board.cnt}</td>

</tr>
</c:forEach>
</table>

<a href="<c:url value="/board/registForm.jsp"/>"><button>글 등록</button></a>
</body>
</html>