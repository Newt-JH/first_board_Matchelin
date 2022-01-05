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
<meta charset="UTF-8">
<title>글 내용</title>
</head>
<body>
<h3> 글에 대한 정보 </h3>
<p>번호:${vo.num}</p>
<p>제목:${vo.title}</p>
<p>작성자:${vo.writer}</p>
<img src="../img/${vo.img}">
<p>내용:${vo.content}</p>
<p>등록일자:${vo.regdate}</p>
<p>조회수:${vo.cnt}</p>
<a href="<c:url value="/board/editForm.jsp?num=${vo.num}"/>"><button>수정</button></a>
<a href="<c:url value="/board/deleteForm.jsp?num=${vo.num}"/>"><button>삭제</button></a>

</body>
</html>