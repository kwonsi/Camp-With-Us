<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/popUp.css">
</head>
<body>
    
    <header>
        <span>지역 선택</span>
    <header>

    <hr>

    <div class="content">

        <div class="locContainer">
            <div class="loc">서울</div>
            <div class="loc">부산</div>
            <div class="loc">대구</div>
            <div class="loc">인천</div>
            <div class="loc">광주</div>
            <div class="loc">대전</div>
            <div class="loc">울산</div>
            <div class="loc">경기</div>
            <div class="loc">강원</div>
            <div class="loc">충청북도</div>
            <div class="loc">충청남도</div>
            <div class="loc">전라북도</div>
            <div class="loc">전라남도</div>
            <div class="loc">경상북도</div>
            <div class="loc">경상남도</div>
            <div class="loc">제주</div>
        </div>

    </div>
    
    <script>

        const loc = document.getElementsByClassName("loc");

        for(let i=0; i<loc.length; i++) {
            loc[i].addEventListener("click", function() {

                opener.document.getElementsByClassName("searchOption")[0].innerText = loc[i].innerText;

                window.close();

            });
        }

    </script>

</body>
</html>