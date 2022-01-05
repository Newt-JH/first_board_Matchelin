<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>글 등록</title>
</head>
<body>
<h3>글 등록하기</h3>
<form action="regist.jsp" method="post" enctype="multipart/form-data">
	<input type="text" name="title" placeholder="제목" required><br>
	<input type="text" name="writer" placeholder="작성자" required><br>
	<input type="file" name="filename1" size=40><br>
	<textarea rows="20" cols="20" name="content" placeholder="내용"></textarea><br>
	<input type="radio" name="category" value="kor" checked="checked">한식
	<input type="radio" name="category" value="jap">일식
	<input type="radio" name="category" value="chi">중식
	<input type="radio" name="category" value="eng">양식
	<input type="radio" name="category" value="cafe">디저트 / 카페
	<br>
	<input type="submit" value="등록"> &nbsp;

</form>

</body>
</html>