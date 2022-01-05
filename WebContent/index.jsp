<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="first_board.*, java.util.List"%>
    
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%
    BoardDao dao = new BoardDao();
    List<BoardVO> imgls = dao.selectImg();
    pageContext.setAttribute("imgls",imgls);
    
    List<BoardVO> lsbestkor = dao.selectbestkor();
    pageContext.setAttribute("lsbestkor",lsbestkor);
    
    List<BoardVO> lsbestjap = dao.selectbestjap();
    pageContext.setAttribute("lsbestjap",lsbestjap);
    
    List<BoardVO> lsbestchi = dao.selectbestchi();
    pageContext.setAttribute("lsbestchi",lsbestchi);
    
    List<BoardVO> lsbesteng = dao.selectbesteng();
    pageContext.setAttribute("lsbesteng",lsbesteng);
    
    List<BoardVO> lsbestcafe = dao.selectbestcafe();
    pageContext.setAttribute("lsbestcafe",lsbestcafe);
    %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인</title>
    <link rel="stylesheet" href="./sujung/css/reset.css">
    <link rel="stylesheet" href="./sujung/css/style.css">
    <link rel="stylesheet" href="./sujung/css/index.css">
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="./sujung/css/demo.css">
	<script src="./sujung/js/ScrollTrigger.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    
    <script src="./sujung/js/menu.js"></script>
</head>
<body>
    <header>
   	 	<div class="logo">
            <a href="index.jsp">
                <img src="./sujung/img/logo.png" alt="">
            </a>
        </div>
        <nav class="menubar">
            <ul>
                <li><a href='./sujung/listkor.jsp'>한식</a></li>
                <li><a href='./sujung/listjap.jsp'>일식</a></li>
                <li><a href='./sujung/listchi.jsp'>중식</a></li>
                <li><a href='./sujung/listeng.jsp'>양식</a></li>
                <li><a href='./sujung/listcafe.jsp'>디저트 / 카페</a></li>
            </ul>
        </nav>

        <div class="login">

        
        <%if(session.getAttribute("user_id")==null){ %>
            <span><a href="./sujung/login.jsp">로그인</a> |</span><span><a href="./sujung/signup.jsp">  회원가입</a></span>
            <%} 
       

        else{%>
             <span><a href="./login/jsp/logout.jsp">로그아웃</a></span>
             <%
     		if(session.getAttribute("user_id").equals("admin")){ %>
            <span>   |   <a href="./board/list.jsp"> 게시판 관리</a></span>
            
            <%}} %>     
        
          

        </div>
    </header>

    <div class="container">

        <section class="top_card">
            <div class="card">
                <div><img src="./sujung/img/banner1.jpg"></div>
                <div><img src="./sujung/img/banner2.jpg"></div>
                <div><a href="https://paybooc.co.kr/app/paybooc/RPastEventDetail.do?evntNo=2020090011"><img src="./sujung/img/banner3.jpg"></a></div>
            </div>

        </section>


               
        <section class="main_card">
            <h3>각 분야별 랭킹 1위</h3>
            <div class="middle_card">
            
             <c:forEach var="first_board" items="${lsbestkor}">
                <div class="card_img" data-scroll="toggle(.fromTopIn, .fromTopOut)">
               
                   <img src="./img/${first_board.img}" onclick="location.href='${pageContext.request.contextPath}/sujung/list-view.jsp?num=${first_board.num}'">
             
                    <p>한식</p>
                </div>
                </c:forEach>
                
             <c:forEach var="first_board" items="${lsbestjap}">
                <div class="card_img"  data-scroll="toggle(.fromTopIn, .fromTopOut)">
                   <img src="./img/${first_board.img}" onclick="location.href='${pageContext.request.contextPath}/sujung/list-view.jsp?num=${first_board.num}'">
             
                    <p>일식</p>
                </div>
                </c:forEach>
                
                             <c:forEach var="first_board" items="${lsbestchi}">
                <div class="card_img"  data-scroll="toggle(.fromTopIn, .fromTopOut)">
                   <img src="./img/${first_board.img}" onclick="location.href='${pageContext.request.contextPath}/sujung/list-view.jsp?num=${first_board.num}'">
             
                    <p>중식</p>
                </div>
                </c:forEach>
                
                
                             <c:forEach var="first_board" items="${lsbesteng}">
                <div class="card_img"  data-scroll="toggle(.fromTopIn, .fromTopOut)">
                  <img src="./img/${first_board.img}" onclick="location.href='${pageContext.request.contextPath}/sujung/list-view.jsp?num=${first_board.num}'">
             
                    <p>양식</p>
                </div>
                </c:forEach>
                
                
                             <c:forEach var="first_board" items="${lsbestcafe}">
                <div class="card_img"  data-scroll="toggle(.fromTopIn, .fromTopOut)">
                   <img src="./img/${first_board.img}" onclick="location.href='${pageContext.request.contextPath}/sujung/list-view.jsp?num=${first_board.num}'">
             
                    <p>카페 / 디저트</p>
                </div>
                </c:forEach>
                
            </div>
        </section>

		<section class="main_mid_banner">
            <div>
                <img class="logo2" src="./sujung/img/logo-white.png" alt="">
            </div>
            <div class="mid_banner_txt" data-scroll="toggle(.fromLeftIn, .fromLeftOut)">
                <p class="mid_banner_txt_title">
                    맛슐랭
                </p>
                <p class="mid_banner_txt_title">                    맛집평가
                </p>
                <p class="mid_banner_txt_title">
                    ―――――――
                </p>
                <span>전국 곳곳에 있는 맛집을 평가하는 사이트입니다<br> 한식,일식,중식,양식 가리지 않고 맛집을 평가하고 <br>식사를 한 후 즐길 수 있는 분위기 좋은 카페까지 평가하는 사이트입니다</span>
            </div>
        </section>

        <section class="main_gallery">
            <h3>갤러리</h3>
            <div class="gallery_box">
            	<c:forEach var="first_board" items="${imgls}">
                <div class="image" onclick="location.href='${pageContext.request.contextPath}/sujung/list-view.jsp?num=${first_board.num}'">
                
                <img src="./img/${first_board.img}" style="width: 330px; height: 330px;">
                </div>
                
                  </c:forEach>
                       </div>
        </section>
    </div>

    <footer></footer>

    <script>
        $('.card').slick({
            autoplay: true,
            autoplaySpeed: 2000,
        });
        
        $('.gallery_box').slick({
            infinite: true,
            slidesToShow: 3,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 2000,
        });
        
        window.counter = function() {
            // this refers to the html element with the data-scroll-showCallback tag
            var span = this.querySelector('span');
            var current = parseInt(span.textContent);

            span.textContent = current + 1;
        };

        document.addEventListener('DOMContentLoaded', function(){
            var trigger = new ScrollTrigger({
                addHeight: true
            });
        });
    </script>
</body>
</html>