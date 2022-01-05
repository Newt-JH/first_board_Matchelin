<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="first_board.*"%>
    <%@ page import="java.io.PrintWriter" %>
    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
   <jsp:useBean id="dao" class="first_board.BoardDao"/>
   
   
<!DOCTYPE html>
<html>
<head>
<META http-equiv="refresh" content="0; url=login.jsp">
<title>Insert title here</title>
</head>
<body>


<%

PrintWriter script = response.getWriter();

script.println("<script>");
script.println("alert('로그인 후 이용하세요.')");
script.println("</script>");

%>
</body>
</html>