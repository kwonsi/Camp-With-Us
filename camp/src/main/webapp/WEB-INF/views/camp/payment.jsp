<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap1.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/paymentInfo.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap_main_header.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/boxicons.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap-icons.css">

    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>
</head>
<body>
    
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="video-container">
        <video muted autoplay loop>
            <source src="${contextPath}/resources/images/nature.mp4" type="video/mp4">
        </video>
    </div>
    <form class="payment">
        <div class="paymentInfo">
            <h1>예약 정보</h1>
            <div class="campDiv">
            <span id="campN" class="campN">${campName}</span>
            </div>
            <div class="reverDate">
                선택한 날짜<br><br><span class="datePick"></span>
            </div>
            <div class="reverName">
                예약자 이름<br><input type="text" id="name" class="name" value="${member.memberNickname}" readonly>
            </div>
            <div class="reverEmail">
                예약자 이메일<br><input type="email" id="email" class="email" value="${member.memberEmail}" readonly>
            </div>
            <div class="reverTel">
                예약자 전화번호<br><input type="tel" id="tel" class="tel" value="${member.memberTel}" readonly>
            </div>
            <c:set var="addr"  value="${fn:split(member.memberAddress, ',,')}"  /> 
            <div class="reverAddress">
                예약자 주소<br>
                <div class="myPage-row info-address">
                    <input type="text" name="updateAddress" id="postcode" value="${addr[0]}"  maxlength="6" readonly>
                </div>

                <div class="myPage-row info-address">
                    <input type="text" name="updateAddress" id="address" value="${addr[1]}" readonly>
                </div>
                
                <div class="myPage-row info-address">
                    <input type="text" name="updateAddress" id="detailAddress" value="${addr[2]}" readonly>
                </div>
            </div>
            <div class="reverPeople">
                선택한 인원<br><br>
                <div class="peopleSum">
                    <div class="adul">
                성인&nbsp;<span id="peopleAdult" class="peopleAdult"></span>
                    </div>
                    <div class="chil">
                영/유아&nbsp;<span id="peopleChild" class="peopleChild"></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="price">
            결제할 금액&nbsp;:&nbsp;<input type="text" id="price2" class="price2" readonly>
        </div>
        <div class="buttons">
        <button type="button" class="btn btn-lg btn-primary" onclick="requestPay()">결제하기</button>
        <button type="button" class="btn btn-lg btn-primary" onclick="historyBack()">돌아가기</button>
        </div>
    </form>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
let priceValue
        function datePicker(){
            let Picker = localStorage.getItem('datePicker');
            let parsedPicker = JSON.parse(Picker);
            let concatenatedValue = '';

            for (var key in parsedPicker) {
                concatenatedValue += parsedPicker[key] + ' ~ ';
            }
            concatenatedValue = concatenatedValue.slice(0, -3);
            console.log(concatenatedValue);  
            const datepick = document.querySelector(".datePick")
            datepick.innerHTML = concatenatedValue;

            let price = JSON.parse(localStorage.getItem("totalPrice"));
            const price2 = document.querySelector(".price2");
            price2.value = price + " 원";
            priceValue = price;

            let totalPeopleValue = JSON.parse(localStorage.getItem("totalPeopleValue"))
           console.log(totalPeopleValue)
           let peopleAdult = document.querySelector(".peopleAdult");
           let peopleChild = document.querySelector(".peopleChild");
           peopleAdult.innerHTML = totalPeopleValue['adultOption'] + " 명";
           peopleChild.innerHTML = totalPeopleValue['childOption'] + " 명";

        }
        window.onload = datePicker;
        

var Address = document.getElementsByName("updateAddress");
var memberAddress = "";
for(let i=0; i<Address.length; i++) {
    memberAddress += Address[i].value + ", ";
}

var campName = document.getElementById("campN").textContent;
var name = document.querySelector(".name").value;
var memberEmail = document.querySelector(".email").value;
var memberNo = "${loginMember.memberNo}";
var memberTel = document.querySelector(".tel").value;

        function requestPay() {
            console.log("requestPay함수 실행");
            
                var IMP = window.IMP;
                IMP.init("imp66352643");
                IMP.request_pay({
                    pg: 'kcp.A52CY',
                    pay_method: 'card',
                    merchant_uid: 'merchant_' + new Date().getTime(),
                    name: campName,
                    amount: priceValue,
                    buyer_email: memberEmail,
                    buyer_name: name,
                    buyer_tel: memberTel,
                    buyer_addr: memberAddress,
    
          }, function (rsp) { // callback

            console.log(rsp);  
            
            if (rsp.success) {

                  console.log("성공");
                  
                  let selectDate = document.querySelector(".datePick").textContent;
                  let people = JSON.parse(localStorage.getItem("totalPeople"))
                 $.ajax({
                    url: "reservationInfo", 
                    type: "POST",
                    data: { "campingName" : campName,
                            "reservSelDate" : selectDate,
                            "buyerName" : rsp.buyer_name,
                            "amount" : priceValue,
                            "people" : people,
                            "memberNo" : memberNo },

                    success: function(result) {
                       console.log(campName, selectDate, rsp.buyer_name, priceValue, people,memberNo)
                        if(result > 0) {
                            console.log("예약정보 전송완료");
                            // window.location.href = '${contextPath}/member/myPage/myReservation';
                            window.location.href = '${contextPath}/reservationComplete';
                            localStorage.clear();

                        }else {
                            console.log("예약정보 전송실패");
                            console.log(result);
                        }

                    },
                    error: function(request, status, error) {
                        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error )
                        console.log("예약정보전송 ajax 에러발생");
                    }
                });

              } else {
                console.log("실패");
                alert("결제가 취소되었습니다.");
              }
            });
}
function historyBack(){
    history.back();
}
    </script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</body>
</html>