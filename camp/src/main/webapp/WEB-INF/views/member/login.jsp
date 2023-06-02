<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

 <!DOCTYPE html>
 <html lang="en">
 <head>
     <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>로그인</title>

     <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
     <link rel="stylesheet" href="${contextPath}/resources/css/login.css">
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
 
             </form>
 
             
         </section>

         <div class="social-loginbtns">

            <div>
                <a href="javascript:;" id="naver_id_login" onclick="showLoginPopup();">
                <img width="200" src="${contextPath}/resources/images/Nbtn.png"></a>
            </div>
            
            <div></div>
        </div>
 
 
     </main>
 


    <!-- footer include -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!-- jQuery 라이브러리 추가(CDN) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <!-- signUp.js 연결 ( 회원가입js인데 로그인화면에 필요한가요 ?)--> 
    <script src="${contextPath}/resources/js/signUp.js"></script>

    <script type="text/javascript">
        const contextPath = "${contextPath}";
        function showLoginPopup(){
            let uri = 'https://nid.naver.com/oauth2.0/authorize?' +
                'response_type=code' +                  // 인증과정에 대한 내부 구분값 code 로 전공 (고정값)
                '&client_id=olUvYEgXTwnvQN94ySBM' +     // 발급받은 client_id 를 입력  ( 개인이 직접받아야해요 )
                '&state=NAVER_LOGIN_TEST' +             // CORS 를 방지하기 위한 특정 토큰값(임의값 사용)
                '&redirect_uri=http://localhost:8080/camp/login/naverLoginSuccess';   // 어플케이션에서 등록했던 CallBack URL를 입력
    
            // 사용자가 사용하기 편하게끔 팝업창으로 띄어준다.
            window.open(uri, "_self" ,"Naver Login Test PopupScreen", "width=450, height=600");
        }
    </script>

    
 </body>
 </html>