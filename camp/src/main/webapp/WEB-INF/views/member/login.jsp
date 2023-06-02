<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

 <!DOCTYPE html>
 <html lang="en">
 <head>
     <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="google-signin-client_id" content="103144752601-32m7hdd9ouctdsf1pv80djgbb2a1664k.apps.googleusercontent.com">
     <script src="https://apis.google.com/js/platform.js" async defer></script>
     <title>로그인</title>

     <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
     <!-- <link rel="stylesheet" href="${contextPath}/resources/css/signUpPage.css"> -->
     
 </head>
 <body>
     <main>
        <!-- hedaer include -->
	 	<jsp:include page="/WEB-INF/views/common/header.jsp" />


         <!-- 회원가입  -->
         <section class="signUp-content">
            <form action="login" method="POST" name="login-form" onsubmit="return loginValidate()">
 
                 <label for="memberEmail">
                     <span class="required">*</span> 아이디(이메일)
                 </label>
                 
                 <div class="signUp-input-area">
                     <input type="text" id="memberEmail" name="memberEmail"
                             placeholder="아이디(이메일)" maxlength="50"
                             autocomplete="off" required>
                 </div>

                 <label for="memberPw">
                     <span class="required">*</span> 비밀번호
                 </label>
                 
                 <div class="signUp-input-area">
                     <input type="text" id="memberPw" name="memberPw"
                             placeholder="비밀번호" maxlength="30">
                 </div>
 
                 <button type="submit" id="login-btn">로그인</button>
                 <div class="g-signin2" data-onsuccess="onSignIn">구글로그인</div>
                 <a href="${contextPath}" onclick="signOut();">구글 로그아웃</a>
             </form>
             
         </section>
 
 
     </main>
 
    <!-- footer include -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!-- jQuery 라이브러리 추가(CDN) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- signUp.js 연결 -->
    <script src="${contextPath}/resources/js/signUp.js"></script>

    <script>

        //로그인
        function onSignIn(googleUser) {
            var profile = googleUser.getBasicProfile();
            console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
            console.log('Name: ' + profile.getName());
            console.log('Image URL: ' + profile.getImageUrl());
            console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
        
            var id_token = googleUser.getAuthResponser().id_token;
            console.log("id_token" + id_token);

            //DB 구글 로그인 정보 데이터 삽입
            $.ajax({
                    url: "googleLoginInfo", 
                    type: "POST",
                    data: { "id" : profile.getId(),
                            "memberNickname" : profile.getName(),
                            "memberEmail" : profile.getEmail(),
                            "id_token" : id_token
                        },

                    success: function(result) {
                       
                        if(result > 0) {
                            console.log("구글로그인 정보 DB전송완료");
                        }else {
                            console.log("구글로그인 정보 DB전송실패");
                        }
                    },
                    error: function() {
                        console.log("구글로그인 DB전송 ajax 에러발생");
                    }
                });

        };

        //로그아웃
        function signOut() {
            var auth2 = gapi.auth2.getAuthInstance();
            auth2.signOut().then(function () {
            alert("로그아웃 되었습니다.");
            console.log('로그아웃');
            });
        };

    </script>

    
 </body>
 </html>