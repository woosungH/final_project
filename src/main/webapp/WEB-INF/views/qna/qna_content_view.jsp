<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container-sm">
<main class="pt-5">
  <form  method="post" action="modify">
    <input type="hidden" name="qna_id" value="${content_view.qna_id}">
    <div style="text-align: center ">
      <img class="mb-4" src="img/logo.png" alt="" width="72" height="57">
      <h1 class="h3 mb-3 fw-normal">Q&A 게시판</h1>
    </div>
    <div class="container-fluid px-4">
      <div class="card mb-4">
        <div class="card-body">
          <table class="table table-hover table-striped">
            <form class="container-center">
              <div class="mb-3">
                <label class="form-label text-left" >제목</label>
                <input name="qna_title" type="text" class="form-control" placeholder="${content_view.qna_title}" value="${content_view.qna_title}">
              </div>
              <fieldset disabled aria-label="Disabled fieldset example">
                <div class="mb-3">
                  <label class="form-label">작성자</label>
                  <input name="qna_name" type="text" class="form-control" placeholder="${content_view.qna_name}">
                </div>
              </fieldset>
              <div class="form-group" >
                <label> 내용 </label>
                <textarea name="qna_content" class="form-control">${content_view.qna_content}</textarea>
              </div>
              <div style="text-align: center; padding-top: 30px;">
                <input type="submit" class="btn btn-primary" value="수정"/>
                <a href="delete?qna_id=${content_view.qna_id}"  role="button" class="btn btn-secondary">삭제</a>
                <a href="list" role="button" class="btn btn-secondary">목록보기</a>
              </div>
            </form>
          </table>
        </div>
      </div>
    </div>
  </form>
</main>
</body>
</html>