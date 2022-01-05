<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ page import="java.io.PrintWriter" %>
   <!DOCTYPE html>
<html>
<head>
<META http-equiv="refresh" content="0; url=../../index.jsp">
<title>Insert title here</title></head>
<body> 
<%


	PrintWriter script = response.getWriter();
    
    script.println("<script>");
    script.println("alert('로그아웃 했습니다.')");
    script.println("</script>");

	session.invalidate();

%>
</body>	
</html>