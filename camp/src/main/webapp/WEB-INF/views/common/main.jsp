<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>캠프보내조</title>
    <link rel="stylesheet" href="resources/css/main.css">
    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>

</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <main>
        
        <section class="content1">
            
            <img class="mainImg" src="${contextPath}/resources/images/testMain1.jpg" alt="테스트 이미지">

        </section>

        <section class="content2">

            

            <button id="location" onclick="selectLoc()" type="button">지역 선택</button>
            <span class="searchOption"></span>

            <button id="theme" onclick="selectTheme()" type="button">테마 선택</button>
            <span class="searchOption"></span>

            <button type="button" onclick="searchCamp()">검색</button>

            

        </section>

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script src="${contextPath}/resources/js/main.js"></script>

</body>
</html>