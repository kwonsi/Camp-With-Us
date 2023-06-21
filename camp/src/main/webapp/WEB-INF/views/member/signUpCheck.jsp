<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>캠프보내조</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main-bootstrap.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap-icons.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap_main_header.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/boxicons.css">

    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>

</head>

<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <form action="doSignUp" method="get" class="signUpCheckForm" onsubmit="return signUpCheck()">

        이용약관 동의1 <input type="checkbox" name="signUpCheckBox" class="signUpCheckBox">

        이용약관 동의2 <input type="checkbox" name="signUpCheckBox" class="signUpCheckBox">

        이용약관 동의3 <input type="checkbox" name="signUpCheckBox" class="signUpCheckBox">

        <button id="signUpCheckBtn">다음으로</button>
    </form>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    

    <script src="${contextPath}/resources/js/signUp.js"></script>


    
</body>

</html>