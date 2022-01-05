<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="first_board.*"%>
    
    
   <%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%
    request.setCharacterEncoding("utf-8");
    %>
    
    <jsp:useBean id="vo" class="first_board.BoardVO"/>
    <jsp:useBean id="dao" class="first_board.BoardDao"/>
    <jsp:setProperty name="vo" property="*"/>
    
    <%

    	  MultipartRequest multi=new MultipartRequest(request,request.getServletContext().getRealPath("img"),100*1024*1024,"utf-8",new DefaultFileRenamePolicy());
    
  
    	    File files = multi.getFile("filename1");
    	    String img = multi.getFilesystemName("filename1");
    	    vo.setImg(img);
    	    
    	 	String stra = multi.getParameter("title");
    	 	vo.setTitle(stra);
    	 	
    	 	String strb = multi.getParameter("writer");
    	 	vo.setWriter(strb);
    	 	
    	 	String strc = multi.getParameter("content");
    	 	vo.setContent(strc);
    	 	
    	 	String strd = multi.getParameter("category");
    	 	vo.setCategory(strd);
    	  	
    	    dao.insert(vo);
    %>

 <c:redirect url="${pageContext.request.contextPath}../../board/list.jsp"></c:redirect>