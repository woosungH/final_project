<%--
  Created by IntelliJ IDEA.
  User: G
  Date: 2022-10-25
  Time: 오후 3:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome BookMall</title>
    <link rel="stylesheet" href="css/goodsDetail.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>

<div class="wrapper">
    <div class="wrap">
        <div class="content_area">
            <div class="line">
            </div>
            <div class="content_bottom">
                <div class="reply_subject">
                    <h2>한줄평 (${review_count})</h2>
                    <p>매주 10건의 우수리뷰를 선정하여 포인트를 드립니다. <br> 리뷰 작성시 50원의 green 포인트를 드립니다.</p>
                </div>

                <div class="sum_wrap">
                    <p><b class="count">${review_count}</b> 명의 회원이 평가한 평균 별점 </p>
                    <div class="avg">
                        <c:choose>
                            <c:when test="${review_count ==0}">
                                <div>
                                    <i class="bi bi-star"></i>
                                    <i class="bi bi-star"></i>
                                    <i class="bi bi-star"></i>
                                    <i class="bi bi-star"></i>
                                    <i class="bi bi-star"></i>
                                </div>
                            </c:when>
                            <c:when test="${avg >= 1 && avg <1.5}">
                                <div>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star"></i>
                                    <i class="bi bi-star"></i>
                                    <i class="bi bi-star"></i>
                                    <i class="bi bi-star"></i>
                                </div>
                            </c:when>
                            <c:when test="${avg >= 1.5 && avg < 2}">
                                <div>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-half"></i>
                                    <i class="bi bi-star"></i>
                                    <i class="bi bi-star"></i>
                                    <i class="bi bi-star"></i>
                                </div>
                            </c:when>
                            <c:when test="${avg >= 2 && avg < 2.5}">
                                <div>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star"></i>
                                    <i class="bi bi-star"></i>
                                    <i class="bi bi-star"></i>
                                </div>
                            </c:when>
                            <c:when test="${avg >= 2.5 && avg < 3}">
                                <div>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-half"></i>
                                    <i class="bi bi-star"></i>
                                    <i class="bi bi-star"></i>
                                </div>
                            </c:when>
                            <c:when test="${avg >= 3 && avg < 3.5}">
                                <div>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star"></i>
                                    <i class="bi bi-star"></i>
                                </div>
                            </c:when>
                            <c:when test="${avg >= 3.5 && avg < 4}">
                                <div>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-half"></i>
                                    <i class="bi bi-star"></i>
                                </div>
                            </c:when>
                            <c:when test="${avg >= 4 && avg < 4.5}">
                                <div>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star"></i>
                                </div>
                            </c:when>
                            <c:when test="${avg >= 4.5 && avg < 5}">
                                <div>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-half"></i>
                                </div>
                            </c:when>
                            <c:when test="${avg == 5}">
                                <div>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                </div>
                            </c:when>

                        </c:choose>

                        <p class="avg_score"><b>${avg}</b> / 5</p>
                    </div>
                </div>

                <div class="review_wrap">
                    <form action="review_write" method="post">
                        <div class="review">
                            <p class="reviewstar">평점</p>
                            <div class="star-rating">
                                <input type="radio" id="5-stars" name="review_score" value="5" />
                                <label for="5-stars" class="star">&#9733;</label>
                                <input type="radio" id="4-stars" name="review_score" value="4" />
                                <label for="4-stars" class="star">&#9733;</label>
                                <input type="radio" id="3-stars" name="review_score" value="3" />
                                <label for="3-stars" class="star">&#9733;</label>
                                <input type="radio" id="2-stars" name="review_score" value="2" />
                                <label for="2-stars" class="star">&#9733;</label>
                                <input type="radio" id="1-star" name="review_score" value="1" />
                                <label for="1-star" class="star">&#9733;</label>
                            </div>
                        </div>
                        <input type="text" name="review_text" class="review_text">
                        <input type="submit" value="입력">
                    </form>

                    <c:if test="${empty review}">
                        <div class="review_empty">
                            <h3>현재 등록된 한줄평이 없습니다.</h3>
                        </div>
                    </c:if>

                    <c:if test="${not empty review}">
                    <div class="review_list">
                        <table width="100%" border="0">
                            <tr>
                                <td style="width: 15%;">Rating</td>
                                <td style="width: 10%">user</td>
                                <td style="width: 55%">Text</td>
                                <td style="width: 20%">Day</td>
                            </tr>
                            <c:forEach items="${review}" var="dto">
                                <tr>
                                    <td>
                                        <c:choose>
                                            <c:when test="${dto.review_score eq '1'}">
                                                <p class="review_star">★☆☆☆☆</p>
                                            </c:when>
                                            <c:when test="${dto.review_score eq '2'}">
                                                <p class="review_star">★★☆☆☆</p>
                                            </c:when>
                                            <c:when test="${dto.review_score eq '3'}">
                                                <p class="review_star">★★★☆☆</p>
                                            </c:when>
                                            <c:when test="${dto.review_score eq '4'}">
                                                <p class="review_star">★★★★☆</p>
                                            </c:when>
                                            <c:when test="${dto.review_score eq '5'}">
                                                <p class="review_star">★★★★★</p>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>${dto.user_id}</td>
                                    <td>${dto.review_text}</td>
                                    <td>${dto.review_date}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    </c:if>
                </div>
            </div>
        </div>

    </div>	<!-- class="wrap" -->
</div>	<!-- class="wrapper" -->
</body>
</html>

