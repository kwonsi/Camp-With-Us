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
        <span>테마 선택</span>
    <header>

    <hr>

    <div class="content">

        <div class="themeContainer">
            <div class="theme">일반 야영장</div>
            <div class="theme">자동차 야영장</div>
            <div class="theme">글램핑</div>
            <div class="theme">카라반</div>
        </div>

    </div>
    
    <script>

        const theme = document.getElementsByClassName("theme");

        for(let i=0; i<theme.length; i++) {
            theme[i].addEventListener("click", function() {

                var selTheme = theme[i].innerText;

                opener.document.getElementsByClassName("searchOption")[1].innerText = selTheme.replace(" ", "");

                window.close();

            });
        }

    </script>

</body>
</html>