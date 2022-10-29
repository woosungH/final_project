<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
<body class="text-center container-sm" >
<main class="pt-5">
	<form>
		<img class="mb-4" src="img/logo.png" alt="" width="72" height="57">
		<h1 class="h3 mb-3 fw-normal">Q&A 게시판</h1>
		<div class="container-fluid px-4">
			<div class="card mb-4">
				<div class="card-body">
					<table class="table table-hover table-striped">
						<thead>
						<tr class="">
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
						</thead>
						<tbody class="table-group-divider">
						<c:forEach items="${list}" var="dto">
							<tr>
								<!-- 여기서는 BDto.java에 있는 걸 적어야한다. -->
								<td>${dto.qna_id}</td>
								<td>
									<a href="content_view?qna_id=${dto.qna_id}">${dto.qna_title}</a>
								</td>
								<td>${dto.qna_name}</td>
								<td>${dto.qna_date}</td>
								<td>${dto.qna_hit}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item" style="margin: 0; <c:if test="${list2.startPage<6}">display: none;</c:if>"><a class="page-link"<c:if test="${list2.startPage<6}">display: none;</c:if>">Previous</a></li>
							<c:forEach var="pNo" begin="${list2.startPage}" end="${list2.endPage}" step="1" varStatus="status">
								<li class="page-item" style="margin: 0;"><a class="page-link" href="/list?currentPage=${pNo}">${status.index+list2.startPage}</a></li>
							</c:forEach>
							<li class="page-item" style="margin: 0; <c:if test="${list2.endPage>=list2.totalPages}">display: none;</c:if>"><a class="page-link" href="/list?currentPage=${list2.startPage+5}">Next</a></li>
						</ul>
					</nav>
					<%--						<div class="bd-example-snippet bd-code-snippet"><div class="bd-example">--%>
					<%--							<nav aria-label="Standard pagination example">--%>
					<%--								<ul class="pagination">--%>
					<%--									<li class="page-item" style="margin: 0; <c:if test="${list2.startPage<6}">display: none;</c:if>"><a class="page-link"<c:if test="${list2.startPage<6}">display: none;</c:if>">Previous</a></li>--%>
					<%--								<c:forEach var="pNo" begin="${list2.startPage}" end="${list2.endPage}" step="1" varStatus="status">--%>
					<%--									<li class="page-item" style="margin: 0;"><a class="page-link" href="/list?currentPage=${pNo}">${status.index+list2.startPage}</a></li>--%>
					<%--								</c:forEach>--%>
					<%--								<li class="page-item" style="margin: 0; <c:if test="${list2.endPage>=list2.totalPages}">display: none;</c:if>"><a class="page-link" href="/list?currentPage=${list2.startPage+5}">Next</a></li>--%>
					<%--								</ul>--%>
					<%--							</nav>--%>
					<%--						</div></div>--%>
				</div>
			</div>
		</div>
	</form>
	<div>
		<form autocapitalize="off" action="list" method="post">
			<select name="type">
				<option selected value="">검색 내용 선택</option>
				<option value="qna_title">제목</option>
				<option value="qna_content">내용</option>
				<option value="qna_name">작성자</option>
			</select>
			<input type="text" name="keyword" value="">
			<input type="button" onclick="getSearchList()" class="btn btn-outline-success m-2" value="검색">
			<a href="write_view" class="btn btn-outline-success m-3" role="button">글작성</a>
		</form>
	</div>
</main>
</body>
</html>