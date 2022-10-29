<%--
  Created by IntelliJ IDEA.
  User: 황우성
  Date: 2022-10-20
  Time: 오후 2:20
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Green Book</title>
    <script src="js/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
    <header>
        <div class="topBanner">
            <div class="bannerContent">
                <div class="bannerText">
                    <strong>Reminder:</strong> 지금 회원가입하면 10% 할인 쿠폰을 드립니다.
                </div>
                <button class="bannerClose" type="button">
                    <span class="material-icons">
                        <img src="img/close_FILL0_wght200_GRAD-25_opsz24.png" alt="">
                    </span>
                </button>
            </div>
        </div>
        <div class="logo">
            <a href="/"><img src="img/logo.png" alt="logo"></a>
            <h1>Green Book</h1>
        </div>
        <div>
            <nav class="nav nav-tabs">
                <ul class="nav">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="book_list?largeCategory=국내도서">국내도서</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="book_list?largeCategory=외국도서">외국도서</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="book_list?largeCategory=eBook">eBook</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="book_list?largeCategory=웹소설/코믹">웹소설/코믹</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="book_list?largeCategory=중고샵">중고샵</a>
                    </li>
                </ul>
                <ul class="nav">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/login">로그인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/myPage">마이페이지</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/product">상품등록</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/review">리뷰</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/cart">장바구니</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/order">주문/배송</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/qna">고객센터</a>
                    </li>
                </ul>
            </nav>
        </div>
    </header>
    <section id="mainWrapper">
        <div class="container">
            <ul class="tabs">
                <li class="nav-item current" data-tab="tab-1">국내도서</li>
                <li class="nav-item" data-tab="tab-2">외국도서</li>
                <li class="nav-item" data-tab="tab-3">eBook</li>
                <li class="nav-item" data-tab="tab-4">웹소설/코믹</li>
                <li class="nav-item" data-tab="tab-5">중고샵</li>
            </ul>
            <div id="tab-1" class="tab-content current">
                <ul class="mainView">
                <c:set var="loop1" value="false"/>
                    <%--
                        list가 book_id 순으로 정렬되어 있기 때문에 순서대로 출력하는데 반복문의 시작지점과 증가값에 랜덤정수를 주어
                        순서대로 출력되지 않게함
                    --%>
                    <c:forEach var="view" items="${bookView}" varStatus="status">
                        <c:if test="${not loop1}">
                        <%-- 출력이 4개 되면 break --%>
                            <c:if test="${view.large_category eq '국내도서'}">
                                <c:set var="i" value="${i+1}" />
                                <li>
                                    <a href="#">
                                        <c:if test="${view.book_id eq bookImg[status.index].bookId}">
                                            <img src="upload/${bookImg[status.index].storedThumbnail}.jpg" />
                                        </c:if>
                                        <p>${view.book_title}</p>
                                        <span>${view.book_price}</span>
                                    </a>
                                </li>
                                <c:if test="${i == 4}">
                                    <%-- 원하는 결과가 나오면 true로 선언 : for문의 break 효과 --%>
                                    <c:set var="loop1" value="true" />
                                </c:if>
                            </c:if>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
            <div id="tab-2" class="tab-content">
                <ul class="mainView">
                    <c:set var="loop" value="false" />
                    <c:forEach var="view" items="${bookView}" begin="0" end="100" step="1">
                        <c:if test="${not loop}">
                            <c:if test="${view.large_category eq '외국도서'}">
                                <c:set var="j" value="${j+1}" />
                                <li>
                                    <a href="#">
                                        <img src="upload/example2.jpg" />
                                        <p>${view.book_title}</p>
                                        <span>${view.book_price}</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${j == 4}">
                                <c:set var="loop" value="true" />
                            </c:if>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
            <div id="tab-3" class="tab-content">
                <ul class="mainView">
                    <c:set var="loop" value="false"/>
                    <c:forEach var="view" items="${bookView}" begin="0" end="100" step="1">
                        <c:if test="${not loop}">
                            <c:if test="${view.large_category eq 'eBook'}">
                                <c:set var="k" value="${k+1}" />
                                <li>
                                    <a href="#">
                                        <img src="upload/example3.jpg" />
                                        <p>${view.book_title}</p>
                                        <span>${view.book_price}</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${k == 4}">
                                <c:set var="loop" value="true" />
                            </c:if>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
            <div id="tab-4" class="tab-content">
                <ul class="mainView">
                    <c:set var="loop" value="false"/>
                    <c:forEach var="view" items="${bookView}" begin="0" end="100" step="1">
                        <c:if test="${not loop}">
                            <c:if test="${view.large_category eq '웹소설/코믹'}">
                                <c:set var="l" value="${l+1}" />
                                <li>
                                    <a href="#">
                                        <img src="img/example4.jpg" />
                                        <p>${view.book_title}</p>
                                        <span>${view.book_price}</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${l == 4}">
                                <c:set var="loop" value="true" />
                            </c:if>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
            <div id="tab-5" class="tab-content">
                <ul class="mainView">
                    <c:set var="loop" value="false"/>
                    <c:forEach var="view" items="${bookView}" begin="0" end="100" step="1">
                        <c:if test="${not loop}">
                            <c:if test="${view.large_category eq '중고샵'}">
                                <c:set var="m" value="${m+1}" />
                                <li>
                                    <a href="#">
                                        <img src="img/example5.jpg" />
                                        <p>${view.book_title}</p>
                                        <span>${view.book_price}</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${m == 4}">
                                <c:set var="loop" value="true" />
                            </c:if>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </section>
    <section id="mainContent">
        <%--<c:set var="todayBook1"><%= (int)java.lang.Math.round(java.lang.Math.random() * 30 + 1) %></c:set>
        <c:set var="todayBook2"><%= (int)java.lang.Math.round(java.lang.Math.random() * 30 + 1) %></c:set>
        <%-- 랜덤한 숫자 2개가 같으면 안되므로 조건문 및 반복문 생성 --%>
        <%-- doneLoop boolean 변수 선언 --%>
        <c:set var="loop" value="false"/>
           <c:forEach begin="0" end="1000">
            <%-- loop가 반대가 되면 break --%>
            <c:if test="${not loop}">
                <c:choose>
                    <c:when test="${todayBook1 eq todayBook2}">
                        <c:set var="todayBook2"><%= (int)java.lang.Math.round(java.lang.Math.random() * 20 + 1) %></c:set>
                    </c:when>
                    <c:otherwise>
                        <%-- 원하는 결과가 나오면 true로 선언 : for문의 break 효과 --%>
                        <c:set var="loop" value="true" />
                    </c:otherwise>
                </c:choose>
            </c:if>
           </c:forEach> --%>
        <%-- 전체 책 중에서 랜덤한 책 2개를 book ID로 구해서 출력 --%>
        <div class="todayBook">
            <span>오늘의 책</span>
            <div class="todayFirst">
                <a href="">
                    <img src="upload/${todayImg1.getStoredThumbnail()}.jpg" />
                    <div>
                        <p><c:out value="${todayInfo1.getBook_title}" />-<c:out value="${todayInfo1.getBook_author}" /></p>
                        <span><c:out value="${todayInfo1.getBook_description}" /></span>
                    </div>
                <%-- <c:forEach var="view" items="${todayBook}">
                    <c:if test="${view.book_id eq todayBook1}">
                        <img src="upload/example6.jpg" />
                        <div>
                            <p><c:out value="${view.book_title}" />-<c:out value="${view.book_author}" /></p>
                            <span><c:out value="${view.book_description}" /></span>
                        </div>
                    </c:if>
                </c:forEach> --%>
                </a>
            </div>
            <div class="todaySecond">
                <a href="">
                    <img src="upload/${todayImg2.getStoredThumbnail()}.jpg" />
                    <div>
                        <p><c:out value="${todayInfo2.getBook_title}" />-<c:out value="${todayInfo2.getBook_author}" /></p>
                        <span><c:out value="${todayInfo2.getBook_description}" /></span>
                    </div>
                <%-- <c:forEach var="view" items="${todayBook}">
                    <c:if test="${view.book_id eq todayBook2}">
                    <img src="upload/example7.jpg" />
                    <div>
                        <p><c:out value="${view.book_title}" />-<c:out value="${view.book_author}" /></p>
                        <span><c:out value="${view.book_description}" /></span>
                    </div>
                    </c:if>
                </c:forEach> --%>
                </a>
            </div>
        </div>
        <div class="bestSeller">
            <span>Best Seller</span>
            <ul class="slider">
                <c:forEach var="bestSeller" items="${bestSeller}" begin="0" end="9" step="1">
                <a href="">
                    <li>
                        <img src="upload/example8.jpg" />
                        <p>${bestSeller.book_title}</p>
                        <span class="description" style="width : 260px; text-overflow: ellipsis; white-space : nowrap; overflow : hidden; display : block;">
                            ${bestSeller.book_description}
                        </span>
                    </li>
                </a>
                </c:forEach>
                <li>
            </ul>
        </div>
    </section>
    <section id="banner">
        <div>
            <a href="#">
                <img src="img/banner1.jpg" alt="">
            </a>
        </div>
    </section>

    <jsp:include page="footer.jsp" />

    <script>
        document.querySelector(".bannerClose").addEventListener("click", function () {
            this.closest(".topBanner").style.display = "none";
        });
    </script>
    <script>
        $(document).ready(function(){
            $('.slider').bxSlider({
                pager: false,        // 현재 위치 페이징 표시 여부
                moveSlides: 1,      // 슬라이드가 몇개 움직일 지
                slideMargin : 10,   // 슬라이드의 여백이 몇인지
                maxSlides : 4,      // 한 페이지에 몇개의 슬라이드가 보일지
                slideWidth : 290    // 슬라이드의 너비
            });
        });
    </script>
    <script>
        $(document).ready(function(){

            $('.nav-link').click(function(){
                var tab_id = $(this).attr('aria-controls');
                $('.bxslider').removeClass('show');

                $("."+tab_id).addClass('show');
            })

        })
        $(document).ready(function(){

            $('ul.tabs li').click(function(){
                var tab_id = $(this).attr('data-tab');

                $('ul.tabs li').removeClass('current');
                $('.tab-content').removeClass('current');

                $(this).addClass('current');
                $("#"+tab_id).addClass('current');
            })

        })
    </script>
</body>
</html>
