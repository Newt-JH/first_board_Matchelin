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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/list-view.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
   	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="js/menu.js"></script>
</head>
<body>
  <header>
    <div class="logo">
            <a href="../index.jsp">
                <img src="./img/logo.png" alt="">
            </a>
        </div>
    
        <nav class="menubar">
            <ul>
                <li><a href='./listkor.jsp'>한식</a></li>
                <li><a href='./listjap.jsp'>일식</a></li>
                <li><a href='./listchi.jsp'>중식</a></li>
                <li><a href='./listeng.jsp'>양식</a></li>
                <li><a href='./listcafe.jsp'>디저트 / 카페</a></li>
            </ul>
        </nav>

        <div class="login">

        
        <%if(session.getAttribute("user_id")==null){ %>
            <span><a href="./login.jsp">로그인</a> |</span><span><a href="./signup.jsp">  회원가입</a></span>
            <%} 
       

        else{%>
             <span><a href="../login/jsp/logout.jsp">로그아웃</a></span>
             <%
     		if(session.getAttribute("user_id").equals("admin")){ %>
            <span>   |   <a href="../board/list.jsp"> 게시판 관리</a></span>
            
            <%}} %>     
        
          

        </div>
    </header>

    <div class="container">
        <div class="view">

            <a href="javascript:history.back();"><i class="fas fa-arrow-left"></i></a>
            <h2>제목:${vo.title}</h2>
            
                    <%if(session.getAttribute("user_id")==null){ %>
            <%} 
        else{%>
             
             <%
     		if(session.getAttribute("user_id").equals("admin")){ %>
<a href="<c:url value="../board/editForm.jsp?num=${vo.num}"/>"><i class="far fa-edit"></i></a>
<a href="<c:url value="../board/deleteForm.jsp?num=${vo.num}&category=${vo.category}"/>"><i class="far fa-trash-alt"></i></a>      
 
            <%}} %>    
            
            

           
            
            
            <div class="view_img">
                <img src="../img/${vo.img}">
            </div>
            <span>${vo.content}</span>
            
                    <%if(session.getAttribute("user_id")==null){ %>
            <a href="notlogin.jsp"> <i class="far fa-heart"> 좋아요 : ${vo.heart}</i></a>
            <%} 
       

        else{%>
               <a href="heart.jsp?num=${vo.num}"> <i class="far fa-heart"> 좋아요 : ${vo.heart}</i></a>
             <%}%>
            
 
           <p>${vo.regdate}</p>
        </div>
    </div>

    <footer></footer>
</body>
</html>