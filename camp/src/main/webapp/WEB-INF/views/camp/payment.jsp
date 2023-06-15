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

    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/paymentInfo.css">
    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>
</head>
<body>
    
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <form class="payment">
        <div class="paymentInfo">
            <h1>예약 정보</h1>
            <span id="campN">${campName}</span>
            <div class="reverDate">
                선택한 날짜<br><span class="datePick"></span>
            </div>
            <div class="reverName">
                예약자 이름<br><input type="text" id="name" class="name" value="${member.memberNickname}">
            </div>
            <div class="reverEmail">
                예약자 이메일<br><input type="email" id="email" class="email" value="${member.memberEmail}">
            </div>
            <div class="reverTel">
                예약자 전화번호<br><input type="tel" id="tel" class="tel" value="${member.memberTel}">
            </div>
            <c:set var="addr"  value="${fn:split(member.memberAddress, ',,')}"  /> 
            <div class="reverAddress">
                예약자 주소<br>
                <div class="myPage-row info-address">
                    <input type="text" name="updateAddress" id="postcode" value="${addr[0]}"  maxlength="6">
                </div>

                <div class="myPage-row info-address">
                    <input type="text" name="updateAddress" id="address" value="${addr[1]}">
                </div>
                
                <div class="myPage-row info-address">
                    <input type="text" name="updateAddress" id="detailAddress" value="${addr[2]}">
                </div>
            </div>
            <div class="reverPeople">
                선택한 인원<br><br>
                <div class="peopleSum">
                    <div class="adul">
                성인&nbsp;<input type="text" id="peopleAdult" class="peopleAdult">명
                    </div>
                    <div class="chil">
                영/유아&nbsp;<input type="text" id="peopleChild" class="peopleChild">명
                    </div>
                </div>
            </div>
            <div class="price">
                결제할 금액&nbsp;:&nbsp;<input type="text" id="price2" class="price2">
            </div>
            
            <button type="button" class="btn btn-lg btn-primary" onclick="requestPay()">예약하기</button>

        </div>
    </form>

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
            price2.value = price;
            priceValue = price;
           
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
                  alert("결제가 완료되었습니다");
                 
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
                            window.location.href = '${contextPath}/member/myPage/myReservation';


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
                alert("날짜/인원을 선택해주세요.");
              }
            });
}

    </script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</body>
</html>