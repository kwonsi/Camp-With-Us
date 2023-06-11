<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

 <!DOCTYPE html>
 <html lang="en">
 <head>
     <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>아이디/비밀번호 찾기</title>

     <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
     <link rel="stylesheet" href="resources/css/bootstrap-icons.css">
     <link rel="stylesheet" href="resources/css/bootstrap_main_header.css">
     <!-- <link rel="stylesheet" href="${contextPath}/resources/css/signUpPage.css"> -->
     
 </head>
 <body>

    <!-- hedaer include -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

     <main>
        
         <!-- 아이디 찾기  -->
         <section class="find-content">
            <form action="findId" method="POST" name="findId-form" onsubmit="return findIdInvalidate()">
 
                <label for="memberTel">
                    <span class="required">*</span> 전화번호
                </label>
                
                <div class="signUp-input-area">
                    <input type="text" id="memberTel" name="memberTel"
                            placeholder="(- 없이 숫자만 입력)" maxlength="11">
                </div>
 
                 <button type="submit" id="findId-btn">아이디 찾기</button>
 
             </form>
             
         </section>
         
         <section></section>

          <!-- 비밀번호 찾기  -->
          <section class="find-content">
            <form action="findPw" method="POST" name="findPw-form" onsubmit="return findPwInvalidate()">
 
                <label for="memberEmail">
                    <span class="required">*</span> 아이디(이메일)
                </label>
                
                <div class="signUp-input-area">
                    <input type="text" id="memberEmail" name="memberEmail"
                            placeholder="아이디(이메일)" maxlength="50"
                            autocomplete="off" required>
                </div>
 
                <label for="memberTel">
                    <span class="required">*</span> 전화번호
                </label>
                
                <div class="signUp-input-area">
                    <input type="text" id="memberTel" name="memberTel"
                            placeholder="(- 없이 숫자만 입력)" maxlength="11">
                </div>

                <button type="submit" id="findPw-btn">비밀번호 찾기</button>
 
             </form>
             
         </section>
 
     </main>
 
    <!-- footer include -->
  	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!-- jQuery 라이브러리 추가(CDN) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- signUp.js 연결 -->
    <script src="${contextPath}/resources/js/findIdPw.js"></script>

    
 </body>
 </html>