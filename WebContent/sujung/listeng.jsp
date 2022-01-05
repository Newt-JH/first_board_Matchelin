<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="first_board.*, java.util.List"%>
    
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%
    BoardDao dao = new BoardDao();
    List<BoardVO> lseng = dao.selecteng();
    pageContext.setAttribute("lseng",lseng);
    %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리스트</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/list.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
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
        <div class="list_card">
        <c:forEach var="first_board" items="${lseng}">
            <div class="card_1" data-aos="fade-up"
            data-aos-anchor-placement="top-bottom">
                <div class="list_txt">
                <a href="${pageContext.request.contextPath}/board/boardDetail.jsp?num=${first_board.num}"><h2>${first_board.title}</h2></a>
                    <div>${first_board.content}</div>
                    
                    
         <%if(session.getAttribute("user_id")==null){ %>
            <a href="notlogin.jsp"> <i class="far fa-heart"> 좋아요 : ${first_board.heart}</i></a>
            <%} 
       

        else{%>
              <a href="hearteng.jsp?num=${first_board.num}"> <i class="far fa-heart"> 좋아요 : ${first_board.heart}</i></a>
             <%}%>
                    
                    
                    
                    <p>${first_board.regdate}</p>
                </div>
                <div class="images">
                    <!--  <a href="list-view.jsp">-->
                    <a href="${pageContext.request.contextPath}/sujung/list-view.jsp?num=${first_board.num}">
                       <img src="../img/${first_board.img}">
                    </a>
                </div>
            </div>
            </c:forEach>

        </div>
    </div>
    <footer></footer>
        <script>
        AOS.init({
            easing: 'ease-out-back',
            duration: 1000
        });
    </script>
</body>
</html>