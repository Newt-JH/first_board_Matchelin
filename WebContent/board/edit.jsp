<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="first_board.*"%>
    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%
    request.setCharacterEncoding("utf-8");
    %>
    
    <jsp:useBean id="vo" class="first_board.BoardVO"/>
    <jsp:useBean id="dao" class="first_board.BoardDao"/>
    <jsp:setProperty name="vo" property="*"/>
    
    <%
    
    dao.update(vo);
    pageContext.setAttribute("vo",vo);
    %>

 <c:redirect url="${pageContext.request.contextPath}/../sujung/list-view.jsp?num=${vo.num}"></c:redirect>
