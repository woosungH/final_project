<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: G
  Date: 2022-10-26
  Time: 오후 6:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <script>
    function thumbNail(event2){
      const reader = new FileReader();

      reader.onload = function (event2) {
        //let img = document.createElement("img");
        let img = document.getElementById("preview_image")
        img.setAttribute("src",event2.target.result);
        //img.setAttribute("class","preview_image")
        document.querySelector("div#image_container").appendChild(img);
      }
      reader.readAsDataURL(event2.target.files[0]);
    }
  </script>
  <style>
    .boxes{width: 95%;
      background-color: rgba(150, 200, 255, 0.3);
      padding: 10px;
      margin: 10px;
      border-radius: 1em;}
  </style>
</head>
<body>
  <div>
    <jsp:include page="product_header.jsp"></jsp:include>
  </div>

  <c:if test="${bookInfo2.bookId != null}">
    <div class="boxes">
      <form method="post" action="uploadOk" enctype="multipart/form-data">
        <table class="table table-bordered" style="table-layout: fixed; background-color: #f7f7f7;">
          <tr>
            <td rowspan="8">
              <input type="file" accept="image/*" name="imgfile" id="image" onchange="thumbNail(event2)" value="">
              <div id="image_container">
                <img src="/upload/${bookImg2.storedThumbnail}" alt="" id="preview_image" style="width: 100%;">
              </div>
            </td>
            <td>상품명</td>
            <td colspan="3">
              <input type="text" name="title" size="50" placeholder="상품명">
            </td>
          </tr>
          <tr>
            <td>분야</td>
            <td colspan="3">
              카테고리1 :
                <%--                    <input type="text" name="largeCategory" id="category1">--%>
              <select name="largeCategory">
                <option value="국내도서">국내도서</option>
                <option value="외국도서">외국도서</option>
                <option value="eBook">eBook</option>
                <option value="웹소설/코믹">웹소설/코믹</option>
              </select>
              <c:set var="largeCategory" value=""/>
              카테고리2 :
                <%--                    <input type="text" name="smallCategory" id="category2">--%>
              <select name="smallCategory">
                <option value="소설">소설</option>
                <option value="인문|역사">인문|역사</option>
                <option value="예술|종교">예술|종교</option>
                <option value="사회|과학">사회|과학</option>
                <option value="경제|경영">경제|경영</option>
                <option value="자기개발">자기개발</option>
                <option value="만화|라이트노벨">만화|라이트노벨</option>
                <option value="여행|잡지">여행|잡지</option>
                <option value="어린이">어린이</option>
                <option value="유아|전집">유아|전집</option>
                <option value="청소년">청소년</option>
                <option value="요리|육아">요리|육아</option>
                <option value="가정살림">가정살림</option>
                <option value="건강취미">건강취미</option>
                <option value="대학교제">대학교제</option>
                <option value="국어와 외국어">국어와 외국어</option>
                <option value="IT모바일">IT모바일</option>
                <option value="수험서 자격증">수험서 자격증</option>
                <option value="초등참고서">초등참고서</option>
                <option value="중고등참고서">중고등참고서</option>
              </select>
              <select name="smallCategory">
                <option value="ELT사전">ELT사전</option>
                <option></option>
              </select>
            </td>
          </tr>
          <tr>
            <td>저자/아티스트</td>
            <td><input type="text" name="bookAuthor" value="${bookInfo2.bookAuthor}"></td>
            <td>출판사/기획사/제조사</td>
            <td><input type="text" name="bookPublisher" value="${bookInfo2.bookPublisher}"></td>
          </tr>
          <tr>
            <td>상품구분</td>
            <td><input type="text"></td>
            <td>ISBN</td>
            <td><input type="text"></td>
          </tr>
          <tr>
            <td>가격 정보</td>
            <td colspan="3">
              <input type="text" name="bookPrice" id="price"> 원
            </td>
          </tr>
          <tr>
            <td>발행일</td>
            <td colspan="3">
              <input type="text" name="publicationDate" placeholder="xxxx/xx/xx">
            </td>
          </tr>
          <tr>
            <td>미성년자구매제한여부</td>
            <td colspan="3">
              <input type="checkbox" name="" id="checkbox">
            </td>
          </tr>
          <tr>
            <td>책 내용 소개</td>
            <td colspan="3">
              <textarea name="bookDescription" cols="30" rows="10"></textarea>
            </td>
          </tr>
        </table>
        <div style="text-align: center;">
          <input type="submit" name="" id="" value="등록" class="btn btn-secondary">
        </div>
      </form>
    </div>
  </c:if>

  <div>
    <div class="boxes">
      <%--            <%@include file="product_stock_manager.jsp"%>--%>
      <h3>상품 관리</h3>
      <form action="product_manager">
        <div class="input-group mb-3" style="width: 700px; margin: 30px 0; background-color: white; flex-direction: row">
          <!-- <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">{Dropdown}</button> -->
          <select class="btn btn-outline-secondary dropdown-toggle" type="button"  aria-expanded="false" name="searchOption">
            <option value="bookTitle" <c:if test="${searchOption.equals('book_title')}"> selected </c:if> >
              <a class="dropdown-item" href="#">책 제목</a>
            </option>
            <option value="bookId"<c:if test="${searchOption.equals('book_id')}">selected</c:if> >
              <a class="dropdown-item" href="#">책 번호</a></option>
          </select>
          <input type="text" class="form-control" aria-label="Text input with segmented dropdown button" name="searchText" value="${searchText}">
          <input type="submit" class="btn btn-outline-secondary" id="button-addon2" value="검색">
        </div>
      </form>
      검색기능, 카테고리기능, 배송조회
      <table class="table table-bordered">
        <tr class="table-info">
          <td>이미지</td>
          <td>책 번호</td>
          <td>책 제목</td>
          <td>큰 카테고리</td>
          <td>작은 카테고리</td>
          <td>가격</td>
          <td>저자</td>
          <td>출판사</td>
          <td>출판일</td>
          <td>수정/삭제</td>
        </tr>
        <c:forEach items="${bookInfoList}" var="bookInfo" varStatus="status">
          <tr class="table-light">
            <td>
              <img src="upload/${bookImgList[status.index].storedThumbnail}" width="100px" height="150px">
            </td>
            <td>
                ${bookInfo.bookId}
            </td>
            <td>
                ${bookInfo.bookTitle}
            </td>
            <td>
                ${bookInfo.largeCategory}
            </td>
            <td>
                ${bookInfo.smallCategory}
            </td>
            <td>
                ${bookInfo.bookPrice}
            </td>
            <td>
                ${bookInfo.bookAuthor}
            </td>
            <td>
                ${bookInfo.bookPublisher}
            </td>
            <td>
                ${bookInfo.publicationDate}
            </td>
            <td>
              <input type="button" value="수정/삭제" onclick="location.href='product_manager?bookId=${bookInfo.bookId}'">
            </td>
          </tr>
        </c:forEach>
      </table>
      <nav aria-label="Page navigation example">
        <ul class="pagination">
          <li class="page-item" style="margin: 0; <c:if test="${list.startPage<6}">display: none;</c:if>"><a class="page-link" href="/product?currentPage=${list.startPage-5}">Previous</a></li>
          <c:forEach var="pNo" begin="${list.startPage}" end="${list.endPage}" step="1">
            <li class="page-item" style="margin: 0;"><a class="page-link" href="/product?currentPage=${pNo}">1</a></li>
          </c:forEach>
          <li class="page-item" style="margin: 0; <c:if test="${list.endPage>=list.totalPages}">display: none;</c:if>"><a class="page-link" href="/product?currentPage=${list.startPage+5}">Next</a></li>
        </ul>
      </nav>
    </div>
  </div>
</body>
</html>
