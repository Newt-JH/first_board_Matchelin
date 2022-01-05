<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/login.css">
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

    <section class="container">
        <div class="login_box">
            <h3>로그인</h3>
            <form action="../login/jsp/login_ok.jsp" method="post">
                <div>
                    <input type="text" placeholder="아이디" name="id" >
                </div>
                <div>
                    <input type="password" placeholder="비밀번호" name="pw">
                </div>
                <input class="sub" type="submit" value="로그인">
            </form>
        </div>
    </section>
    
    <footer></footer>
</body>
</html>