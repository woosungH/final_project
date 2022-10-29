<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: G
  Date: 2022-10-21
  Time: 오후 5:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script>
        function thumbNail(event){
            const reader = new FileReader();

            reader.onload = function (event) {
                //let img = document.createElement("img");
                let img = document.getElementById("preview_image")
                img.setAttribute("src",event.target.result);
                //img.setAttribute("class","preview_image")
                document.querySelector("div#image_container").appendChild(img);
            }
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>
    <style>
        #preview_image{
            width: 100%;
        }
        input{border: 0;}
        textarea {border: 0; width: 100%;}
        input:focus, textarea:focus{outline-color: #999;}
        td{vertical-align: top;}
        :root{
            --bgColor: #3a3a3a;
            --hoverBg: #616161;
            --text: #bbb;
        }

        .container {
            width: clamp(0px, 100%, 512px);
            margin: 32px auto;
            text-align: center;
        }

        .label {
            width: 100%;
            height: 100%;
            margin: 0px auto;
            cursor: pointer;
            background-color: var(--bgColor);
        }

        .inner {
            width: 100%;
            height: 128px;
            margin: 64px auto;
            border-radius: 8px;
            font-size: 16px;
            line-height: 128px;
            background-color: var(--bgColor);
            color: var(--text);
        }

        @media (any-hover: hover){
            .inner:hover{
                background-color: var(--hoverBg);
            }
        }

        .label--hover{
            background-color: var(--hoverBg);
        }

        .preview-title{
            font-size: 32px;
            margin-bottom: 8px;
        }

        .preview {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 16px;
            padding: 16px;
            margin-bottom: 16px;
            border-radius: 8px;
            align-items: center;
            background-color: var(--bgColor);
        }

        .embed-img{
            width: 100%;
            height: 128px;
            object-position: center;
            object-fit: cover;
            border-radius: 8px;
        }
    </style>
</head>
<body>
<div style="margin: 10px;">
    <h3>상품 등록</h3>
    <form method="post" action="uploadOk" enctype="multipart/form-data">
        <table class="table table-bordered" style="table-layout: fixed; background-color: #f7f7f7;">
            <tr>
                <td rowspan="8">
                    <input type="file" accept="image/*" name="imgfile" id="image" onchange="thumbNail(event)">
                    <div id="image_container">
                        <img src="https://via.placeholder.com/100x150" alt="" id="preview_image">
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
                <td><input type="text" name="bookAuthor"></td>
                <td>출판사/기획사/제조사</td>
                <td><input type="text" name="bookPublisher"></td>
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
</body>
</html>
