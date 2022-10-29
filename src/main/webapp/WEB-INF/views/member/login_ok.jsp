<%@page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>login ok</title>
</head>
<body>
<h2>${member_id}님 안녕하세요</h2>
<h3>${member_name}님</h3>
<a href="/mypage">마이페이지</a>
<a href="/withdrawal">회원탈퇴</a>
<a href="/logout">로그아웃</a>
</body>
</html>
