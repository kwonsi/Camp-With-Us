<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>캠프보내조</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage.css">
    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <main class="myPage-content">
        
        <jsp:include page="/WEB-INF/views/member/sideMenu.jsp"/>

        <section class="myPage-main">

            <h1 class="myPage-title">회원 탈퇴</h1>
            
            <span class="myPage-explanation">현재 비밀번호가 일치하는 경우 회원 탈퇴할 수 있습니다.</span>
            
            <form action="secession" method="POST" name="myPage-form" onsubmit="return secessionValidate()" >

                <div class="myPage-row">
                    <label>비밀번호</label>
                    <input type="password" name="memberPw" id="memberPw" maxlength="30">              
                </div>

                
                <div class="myPage-row info-title">
                    <label>회원 탈퇴 약관</label>
                </div>

                <pre id="secession-terms">
제1조
이 약관은 샘플 약관입니다.

① 약관 내용 1

② 약관 내용 2

③ 약관 내용 3

④ 약관 내용 4


제2조
이 약관은 샘플 약관입니다.

① 약관 내용 1

② 약관 내용 2

③ 약관 내용 3

④ 약관 내용 4

                </pre>

                <div>
                    <input type="checkbox" name="agree" id="agree">
                    <label for="agree">위 약관에 동의합니다.</label>
                </div>


                <button id="info-update-btn">탈퇴</button>

            </form>

        </section>

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script src="${contextPath}/resources/js/mypage.js"></script>

</body>
</html>