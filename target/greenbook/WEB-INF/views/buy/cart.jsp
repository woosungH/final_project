
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="styleSheet" href="css/bootstrap.css">
    <link href="js/bootstrap.js">
    <link rel="styleSheet" href="css/main.css">
    <link rel="stylesheet" href="js/jquery.min.js">
</head>
<script>
    /* 전체선택 로직 */
    function selectAll(selectAll) {
        const checkboxes
            = document.getElementsByName('ckbx');

        checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAll.checked;
        });
    }

</script>
<body>

<main>
    <div class="content">
        <table class="oder_button_top">
            <tr>
                <td><input name="ckbx" type="checkbox" id="all_check" class="all_check" onclick="selectAll(this)">
                    <label for="all_check" class="all_check_lb">전체선택</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>
                    <input class="btn-outline-success1 oder_bt my-2" type="button" value="주문하기">
                    <input class="btn-outline-success1 oder_bt my-2" type="button" value="나중에주문">
                    <input class="btn-outline-success1 oder_bt my-2" type="button" value="리스트에 넣기">
                    <input name="delete_bt" class="btn-outline-success1 oder_bt my-2" type="button" value="삭제"  >
                </td>
            </tr>
        </table>
        <div class="line"></div>
        <h4 class="title">그린북 배송</h4>
        <table border="1" class="content_tb">
            <tr class="content_tb_top">
                <td style="width: 50px;">선택</td>
                <td style="width: 150px;">이미지</td>
                <td style="width: 450px;">상품정보</td>
                <td style="width: 100px;">수량</td>
                <td style="width: 100px;">상품금액</td>
                <td style="width: 100px;">배송정보</td>
                <td style="width: 150px;">주문</td>
            </tr>

            <c:forEach items="${cart}" var="cart">
                <form method="post" action="cartCountUpdate">
                    <tr>
                        <td class="cart_info_td" style="display: none;">
                            <input type="hidden" class="book_id_input" name="book_id" value="${cart.book_id}">
                            <input type="hidden" class="book_price_input" name="book_price" value="${cart.book_price}">
                            <input type="hidden" class="individual_bookCount_input" name="book_count" value="${cart.book_count}">
                            <input type="hidden" class="individual_totalPrice_input" name="book_count" value="${cart.book_price * cart.book_count}">
                        </td>
                        <td class="allCk"><input name="ckbx" type="checkbox"></td>
                        <td><img src="img/bookimg/${cart.book_id}.jpg" alt="" width="120" height="150"></td>
                        <td>${cart.book_title}<br>
                                ${cart.book_author} 저 | ${cart.book_publisher} <br> ${cart.book_description}
                        </td>
                        <td>
                            <input style="width: 30px;" type="number" name="count" value="${cart.book_count}">
                            <input style="width: 50px;" type="submit" value="변경" id="cartUpdate">
                        </td>
                        <td><input type="number" name="price" value="cart.book_price * cart.book_countcart.book_price * cart.book_count" readonly style="width: 100px; "></td>
                        <td>오늘</td>
                        <td>
                            <input class="btn-outline-success1 oder_bt my-2" type="button" value="주문하기" onclick="location.href='order?book_id=${cart.book_id}&book_price=${cart.book_price}'" ><br>
                            <input class="btn-outline-success1 oder_bt my-2" type="button" value="나중에주문" ><br>
                            <input class="btn-outline-success1 oder_bt my-2" type="button" value="리스트에 넣기" ><br>
                            <input class="btn-outline-success1 oder_bt my-2" type="button" value="삭제" onclick="location.href='delete?book_id=${cart.book_id}'">
                        </td>
                    </tr>
                </form>
                <c:set var="total" value="${cart.book_price * cart.book_count}"></c:set>
            </c:forEach>
            <!-- 총 가격을 구하는 스크립트 -->
        </table>
        <table class="oder_button_bt">
            <tr>
                <td>선택한 상품 &nbsp;</td>
                <td>
                    <input class="btn-outline-success1 oder_bt my-2" type="button" value="주문하기">
                    <input class="btn-outline-success1 oder_bt my-2" type="button" value="나중에주문">
                    <input class="btn-outline-success1 oder_bt my-2" type="button" value="리스트에 넣기">
                    <input class="btn-outline-success1 oder_bt my-2" type="button" value="삭제">
                </td>
            </tr>
        </table>
    </div>
    <div class="Information">
        <table border="1" class="Info_table" style="width: 1100px;">
            <tr class="Info_td1">
                <td><p>총 상품금액 <br>
                    <script>
                        let i=0;
                        let book_price =0;
                        let book_count = 0;
                        let total = [];
                        let sum = 0;
                        <c:forEach items="${cart}" var="cart">
                        book_price = parseInt(${cart.book_price});
                        book_count = parseInt(${cart.book_count});
                        total[i] = book_price*book_count

                        if(i>0) {
                            sum = (parseInt(total[i])+parseInt(total[i-1]));
                        }

                        i++;
                        </c:forEach>
                        document.write(sum);
                    </script>원</p></td>
                <td><p>총 추가금액<br>
                    <script>
                        let ba = 0;
                        if(sum>=30000) {
                            document.write(ba);
                        }else {
                            ba = 3000;
                            document.write(ba);
                        }

                    </script>원
                </p></td>
                <td><p>총 할인금액</p></td>
                <td><p>최종 결제금액<br>
                    <script>
                        document.write(sum+ba);
                    </script>원
                </p></td>

            </tr>
            <tr class="Info_td2">
                <td><p>할인정보 입력</p></td>
                <td><p>할인정보 입력</p></td>
                <td><p>할인정보 입력</p></td>
                <td><p>적립포인트 입력</p></td>
            </tr>
        </table>
    </div>
    <div class="payment_event">
        <table border="1" style="width: 1100px;">
            <tr style="height: 150px;">
                <td style="width: 150px;"><b>결제 혜택</b></td>
                <td>
                    그린카드 결제시 <b>3%적립</b> <br><br>
                    삼성페이 결제시 <b>2%적립</b>
                </td>
            </tr>
        </table>
    </div>
    <div class="user_type">
        <form method="post" action="order">
            <input id="u_bt1" type="submit" value="회원주문" hidden>
            <label for="u_bt1"><img src="img/bookimg/b_orderMem.gif" alt=""></label>
            <input id="u_bt3" type="button" value="쇼핑계속하기" hidden>
            <label for="u_bt3"><img src="img/bookimg/b_goshopping.gif" alt=""></label>
        </form>
    </div>
</main>
</body>
</html>