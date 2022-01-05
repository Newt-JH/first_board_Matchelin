
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 
 try{
  MultipartRequest multi=new MultipartRequest(request,
		  request.getServletContext().getRealPath("img"),
		  100*1024*1024,
		  "utf-8",
		  new DefaultFileRenamePolicy());

  File files = multi.getFile("filename1");
  
   String file1 = multi.getFilesystemName("filename1");
    
 } catch(Exception e) {
  e.printStackTrace();
 }
 

%>

<c:redirect url="list.jsp"></c:redirect>
 