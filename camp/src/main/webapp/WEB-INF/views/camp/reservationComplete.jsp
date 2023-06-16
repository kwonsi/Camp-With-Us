<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/reservation.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/calendarStyle.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap1.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/reservComplete.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    
    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="reservCom">
        <!-- <img src="${contextPath}/resources/images/reservComplete.jpg"> -->
        <div class="thanks">
            <div class="logo">
                <img src ="${contextPath}/resources/images/camp_logo.jpg">
            </div>
                <h1>예약이 완료되었습니다.</h3>
            <div class="buttons2">
                <button type="button" class="btn btn-lg btn-primary" onclick="gotoMain()">메인으로</button>
                <button type="button" class="btn btn-lg btn-primary" onclick="gotoReservation()">예약현황</button>
            </div>
        </div>
    </div>


    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="${contextPath}/resources/js/reservationComplete.js"></script>
</body>
</html>