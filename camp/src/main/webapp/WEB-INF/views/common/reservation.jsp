<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/reservation.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>

</head>
<body>
    <main>
		
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

        <form class="formsize">            


            <div class="subject">${campName} 캠핑장 예약</div>
    



            <div class="calendar1">달력




                        <div class="calendar">
                            <div class="month">
                                <i class="fa fa-angle-left prev"></i>
                                <div class="date">may 2023</div>
                                <i class="fa fa-angle-right next"></i>
                            </div>
                            <div class="weekdays">
                                <div>sun</div>
                                <div>mon</div>
                                <div>tue</div>
                                <div>wed</div>
                                <div>thu</div>
                                <div>fri</div>
                                <div>sats</div>
                            </div>
                            <div class="days"> <!-- js 이용 달력 만들예정 -->
                                <div class="day prev-date">30</div>
                                <div class="day prev-date">31</div>
                                <div class="day">1</div>
                                <div class="day">2</div>
                                <div class="day">3</div>
                                <div class="day">4</div>
                                <div class="day">5</div>
                                <div class="day">6</div>
                                <div class="day">7</div>
                                <div class="day event">8</div>
                                <div class="day">9</div>
                                <div class="day">10</div>
                                <div class="day">11</div>
                                <div class="day">12</div>
                                <div class="day">13</div>
                                <div class="day event active">14</div>
                                <div class="day today">15</div>
                                <div class="day">16</div>
                                <div class="day">17</div>
                                <div class="day">18</div>
                                <div class="day">19</div>
                                <div class="day">20</div>
                                <div class="day">21</div>
                                <div class="day">22</div>
                                <div class="day">23</div>
                                <div class="day">24</div>
                                <div class="day">25</div>
                                <div class="day">26</div>
                                <div class="day">27</div>
                                <div class="day">28</div>
                                <div class="day">29</div>
                                <div class="day">30</div>
                                <div class="day next-date">1</div>
                                <div class="day next-date">2</div>
                                <div class="day next-date">3</div>
                            </div>
                            <div class="goto-today">
                                <div class="goto">
                                    <input type="text" placeholder="mm/yyyy" class="date-input">
                                    <button class="goto-btn">go</button>
                                </div>
                                <button class="today-btn">today</button>
                            </div>
                        </div>
               




            </div>
    



            <div class="peopleNumber">인원선택 
                
                <div class="popleNumberch">

                    성인
                    <select class="adultSelect">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                    </select>
                    명
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    아이
                    <select class="childrenSelect">
                        <option value="0">0</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                    </select>
                    명
                </div>
               


            </div>
    
            <div class="priceInformation">가격정보
            <br>
            <br>성수기(6~8월) 가격: 1인 기준 성인 30000, 아이 15000
            <br>비성수기(6~8월 제외한 달) 기본가격: 1인 기준 성인 20000, 아이 10000
            <br><br><br>	
            	<div id="priceSum"></div>
            </div>
            <br>

            <button type="button" class="payment" onclick="requestPay()">결제하기</button>
        </form>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
        
    </main>

<script>
    
let priceValue;
let people;


document.addEventListener("DOMContentLoaded", function() {
            const adultSelect = document.querySelector(".adultSelect");
            const childrenSelect = document.querySelector(".childrenSelect");
            const priceElement = document.getElementById("priceSum");
    
            function calculatePrice() {
                $.ajax({
                    url: "selectPrice",
                    type: "GET",
                    success: function(price) {
                        console.log(price);
    
                        let childrenPrice = price * 0.5;
                        let adultOptionValue = adultSelect.options[adultSelect.selectedIndex].value;
                        let adultTotalPrice = price * adultOptionValue;
    
                        let childrenOptionValue = childrenSelect.options[childrenSelect.selectedIndex].value;
                        let childrenTotalPrice = childrenPrice * childrenOptionValue;
                        
                        let totalPeople = Number(adultOptionValue) + Number(childrenOptionValue);
                       
                        let totalPrice = adultTotalPrice + childrenTotalPrice;
                        priceElement.textContent = "총 가격: " + totalPrice + "원";
                        priceValue = totalPrice;
                        people = totalPeople;
                        
                        console.log(people);
                        console.log(adultOptionValue);
                        console.log(childrenOptionValue);

                    },
                    error: function() {
                        console.log("에러 발생");
                    }
                });
            }
    
            adultSelect.addEventListener("change", calculatePrice);
            childrenSelect.addEventListener("change", calculatePrice);
    
            calculatePrice();
    
        });




function requestPay() {
            console.log("requestPay함수 실행");
            
                var IMP = window.IMP;
                IMP.init("imp66352643");
                IMP.request_pay({
                    pg: 'kcp.A52CY',
                    pay_method: 'card',
                    merchant_uid: 'merchant_' + new Date().getTime(),
                    name: '캠핑장이름',
                    amount: priceValue,
                    buyer_email: 'CampingBoeNaeJoe@gmail.com',
                    buyer_name: '구매자이름',
                    buyer_tel: '010-1234-5678',
                    buyer_addr: '구매자 주소 강남구 삼성동',
    
          }, function (rsp) { // callback

            console.log(rsp);  
            
            if (rsp.success) {

                  console.log("성공");
                  alert("결제가 완료되었습니다");

                  let campingName = '캠핑장이름';

                 $.ajax({
                    url: "reservationInfo", 
                    type: "POST",
                    data: { "campingName" : campingName,
                            "buyerName" : rsp.buyer_name,
                            "amount" : priceValue,
                            "people" : people},

                    success: function(result) {
                       
                        if(result > 0) {
                            console.log("예약정보 전송완료");
                        }else {
                            console.log("예약정보 전송실패");
                        }

                    },
                    error: function() {
                        console.log("예약정보전송 ajax 에러발생");
                    }
                });

              } else {
                console.log("실패");
                alert("결제에 실패하였습니다");
              }
            });
        }

//  buyer_postcode: '123-456'
</script>
   


 <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

   
    <script src="${contextPath}/resources/js/reservation.js"></script>

 <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>


</body>
</html>