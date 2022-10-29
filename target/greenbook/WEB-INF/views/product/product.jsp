<%--
  Created by IntelliJ IDEA.
  User: G
  Date: 2022-10-21
  Time: 오후 5:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<html>
<head>
    <title>Title</title>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <style>
        td {
            background-color: white;
        }
        span {
            color: red;
            font-weight: bold;
        }
        .bodys {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }
        .boxes {
            background-color: rgba(150, 200, 255, 0.3);
            padding: 10px;
            margin: 10px;
            border-radius: 1em;
        }
    </style>
</head>
<body>
    <div>
        <jsp:include page="product_header.jsp"></jsp:include>
    </div>
    <div class="bodys">
        <div class="boxes" style="width: 45%;">
            <jsp:include page="product_sell_manager.jsp"></jsp:include>
        </div>
        <div class="boxes" style="width: 45%;">
            <jsp:include page="product_sell2_manager.jsp"></jsp:include>
        </div>
        <div class="boxes" style="width: 95%;">
<%--            <%@include file="product_stock_manager.jsp"%>--%>
            <h3>재고 관리</h3>
            <form action="product">
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
<%--            검색기능, 카테고리기능, 배송조회--%>
            <table class="table table-bordered">
                <tr class="table-info">
                    <td>책 번호</td>
                    <td>책 제목</td>
                    <td>현 재고량</td>
                    <td>상품 입고</td>
                    <td>출고 예정</td>
                    <td colspan="2">반품 접수</td>
                    <td>반품 처리</td>
                </tr>
                <c:forEach items="${bookInfoList}" var="bookInfo">
                    <tr class="table-light">
                        <td>
                            ${bookInfo.bookId}
                        </td>
                        <td>
                            ${bookInfo.bookTitle}
                        </td>
                        <td>
                            ${bookInfo.bookStock}
                        </td>
                        <td style="position: relative">
                            <input class="btn btn-warning" type="button" value="상품 입고 >" style="position: absolute; width: 90%; top: 50%; left: 50%; transform: translate(-50%, -50%); margin: 0;">
                        </td>
                        <td>
                            출고
                        </td>
                        <td>
                            반품
                        </td>
                        <td style="position: relative">
                            <input class="btn btn-warning" type="button" value="반품 처리 >" style="position: absolute; width: 90%; top: 50%; left: 50%; transform: translate(-50%, -50%); margin: 0;">
                        </td>
                        <td>
                            반품처리
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item" style="margin: 0; <c:if test="${list.startPage<6}">display: none;</c:if>"><a class="page-link" href="/product?currentPage=${list.startPage-5}">Previous</a></li>
                    <c:forEach var="pNo" begin="${list.startPage}" end="${list.endPage}" step="1" varStatus="status">
                        <li class="page-item" style="margin: 0;"><a class="page-link" href="/product?currentPage=${pNo}">${status.index+list.startPage-1}</a></li>
                    </c:forEach>
                    <li class="page-item" style="margin: 0; <c:if test="${list.endPage>=list.totalPages}">display: none;</c:if>"><a class="page-link" href="/product?currentPage=${list.startPage+5}">Next</a></li>
                </ul>
            </nav>
        </div>
    </div>
</body>
</html>
