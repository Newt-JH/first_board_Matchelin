<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� Ȯ��</title>
</head>
<body>

<%
int num = Integer.parseInt(request.getParameter("num"));
String category = request.getParameter("category");
%>

<form action="/first_board/board/delete.jsp">
<input type="hidden" value="<%=num %>" name="num">
<input type="hidden" value="<%=category %>" name="category">
���� �Ͻðڽ��ϱ�?
<input type="submit" value="��">
</form>
</body>
</html>