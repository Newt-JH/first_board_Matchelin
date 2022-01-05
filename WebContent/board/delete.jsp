<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="first_board.*"%>
    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page import="java.io.PrintWriter"%>
    
    <jsp:useBean id="dao" class="first_board.BoardDao"/>
    
    <%
    int num = Integer.parseInt(request.getParameter("num"));
    String category = request.getParameter("category");    
    dao.delete(num);
    PrintWriter script = response.getWriter();

    
    %>
<META http-equiv="refresh" content="0; url=../sujung/list<%=category%>.jsp">
