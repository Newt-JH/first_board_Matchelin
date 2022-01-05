<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="first_board.*"%>
    <%@ page import="java.io.PrintWriter" %>
    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
   <jsp:useBean id="dao" class="first_board.BoardDao"/>
   
   <%
   int num = Integer.parseInt(request.getParameter("num"));
   BoardVO vo = dao.selectOne(num);
   pageContext.setAttribute("vo",vo);
   int heart = vo.getHeart();
   %>
<!DOCTYPE html>
<html>
<head>


<META http-equiv="refresh" content="0; url=listkor.jsp?num=<%=num%>">
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>

  <body>

    <%
    
    PrintWriter script = response.getWriter();
    

    
    dao.plusHeart((heart+1),num);
    pageContext.setAttribute("vo",vo);
    
//     script.println("<script>");
//     script.println("alert('좋아요를 눌렀습니다.')");
//     script.println("</script>");

    %>
    


</body>
</html>