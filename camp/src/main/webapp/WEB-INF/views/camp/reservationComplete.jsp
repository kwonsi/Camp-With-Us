<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/boxicons.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/reservation.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/calendarStyle.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap1.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap-icons.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/reservComplete.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap_main_header.css">

    
    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>
    
</head>
<body>
    <script src="${contextPath}/resources/js/reservationComplete.js"></script>
    <style>
        canvas{z-index:10;pointer-events: none;position: fixed;top: 0;transform: scale(1.1);}
    </style>
    
    <div class="buttonContainer">
        <button class="canvasBtn" id="stopButton">Stop Confetti</button>
        <button class="canvasBtn" id="startButton">Drop Confetti</button>	
    </div>
    
    <canvas id="canvas"></canvas>
    
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    
    <canvas id="canvas"></canvas>

    <div class="reservCom">
        <!-- <img src="${contextPath}/resources/images/reservComplete.jpg"> -->
        <div class="thanks">
            <div class="logo">
                <img src ="${contextPath}/resources/images/CWUlogo.png">
            </div>
                <h1>예약이 완료되었습니다.</h3>
            <div class="buttons2">
                <button type="button" class="btn btn-lg btn-primary" onclick="gotoMain()">메인으로</button>
                <button type="button" class="btn btn-lg btn-primary" onclick="gotoReservation()">예약현황</button>
            </div>
        </div>
    </div>


    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/confetti_v2.js"></script>
    
    <script>
        $(document).ready(function(){  
          //티스토리 공감버튼 이벤트
          function reAction(){
              $("#startButton").trigger("click");
              setTimeout(function(){
                  $("#stopButton").trigger("click");
              }, 6000);
          }
          
            reAction();
        });
        </script>
</body>
</html>