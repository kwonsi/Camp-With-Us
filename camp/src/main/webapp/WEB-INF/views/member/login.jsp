<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

 <!DOCTYPE html>
 <html lang="en">
 <head>
     <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta name="google-signin-client_id" content="339157095508-t9plchs0o9651362uvistjbc9agh0d4a.apps.googleusercontent.com">
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
 
             </form>
 
            <script src="https://accounts.google.com/gsi/client" async defer></script>
            <div id="g_id_onload"
                data-client_id="339157095508-t9plchs0o9651362uvistjbc9agh0d4a.apps.googleusercontent.com"
                data-context="signin"
                data-ux_mode="popup"
                data-callback="handleCredentialResponse"
                data-itp_support="true">
            </div>

            <div class="g_id_signin"
                data-type="standard"
                data-shape="rectangular"
                data-theme="outline"
                data-text="signin_with"
                data-size="large"
                data-logo_alignment="left">
            </div>

            <script src="https://apis.google.com/js/platform.js" async defer></script>
            <a href="#" onclick="signOut();">Sign out</a>
            
            <script>
                function signOut() {
                    var auth2 = gapi.auth2.getAuthInstance();
                    auth2.signOut().then(function () {
                    console.log('User signed out.');
                    });
                }
            </script>
            

            <script>
                function parseJwt (token) {
                    var base64Url = token.split('.')[1];
                    var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
                    var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
                        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
                    }).join(''));

                    return JSON.parse(jsonPayload);
                };

                function handleCredentialResponse(response) {
                // decodeJwtResponse() is a custom function defined by you
                // to decode the credential response.
                const responsePayload = parseJwt(response.credential);
                console.log(responsePayload);
                console.log("ID: " + responsePayload.sub);
                console.log('Full Name: ' + responsePayload.name);
                // console.log('Given Name: ' + responsePayload.given_name);
                // console.log('Family Name: ' + responsePayload.family_name);
                // console.log("Image URL: " + responsePayload.picture);
                console.log("Email: " + responsePayload.email);
                } 

            </script>
         </section>
 
         
     </main>
 
    <!-- footer include -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!-- jQuery 라이브러리 추가(CDN) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- login.js 연결 -->
    <script src="${contextPath}/resources/js/login.js"></script>

    
 </body>
 </html>