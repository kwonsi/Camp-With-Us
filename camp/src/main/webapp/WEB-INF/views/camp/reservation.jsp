<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <c:set var="campName" value="${campName}" />
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/detailList.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/reservation.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/calendarStyle.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap1.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap-icons.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap_main_header.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="${contextPath}/resources/css/boxicons.css">


        <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>

    </head>

    <body>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <main>
            <video muted autoplay loop>
                <source src="${contextPath}/resources/images/fire.mp4" type="video/mp4">
            </video>
            <form class="formsize" action="payment/${campName}" method="post" onsubmit="return test();">
                <div id="detailMainReserv">
                    <div id="sub_title_wrapReserv">
                        <h1>
                            <span class="lineIntro1">${campName}</span>
                        </h1>

                    </div>
                </div>


                <section class="info">


                    <section class="calendar1">
                        <div class="containerCal card-1">
                            <div class="calendar">
                                <div class="month">
                                    <i class="fa fa-angle-left prev"></i>
                                    <div class="date"></div>
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

                                </div>
                                <button class="reselect card-3" type="button">다시 선택하기</button>
                                <div class="goto-today">
                                    <div class="goto card-3">
                                        <input type="text" placeholder="mm/yyyy" class="date-input">
                                        <button class="goto-btn card-3" type="button">go</button>
                                    </div>
                                    <button class="today-btn card-3" type="button">today</button>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section class="reverInfo">
                        <div class="SELECTDATE card-2">
                            <div class="today-date">
                                <div class="event-day">선택한 날짜</div>
                            </div>
                            <div class="check">
                                <!-- <div class="first-day"> -->
                                <input type="text" class="pickMonth" readonly><input type="text" class="mon"
                                    readonly><input type="text" class="pickDay" readonly><input type="text"
                                    class="dat" readonly>
                                <input type="text" class="dat2" readonly>
                                <!-- </div> -->
                                <input type="text" class="wave" readonly>
                                <!-- <div class="last-day"> -->
                                <input type="text" class="pickMonth" readonly><input type="text" class="mon"
                                    readonly><input type="text" class="pickDay" readonly><input type="text"
                                    class="dat" readonly>
                                <input type="text" class="dat2" readonly>
                                <!-- </div> -->
                            </div>

                            <div class="TOTAL">
                                <div class="total">총 기간</div>
                                <div class="total-days">
                                    <div class="dayBetween"></div>
                                    <div class="dayBetween"></div>
                                </div>
                            </div>
                        </div>

                        <div class="peopleNumber card-2">
                            <div class="checkPeople">인원선택</div>

                            <div class="popleNumberch">
                                <div class="count">
                                    성인
                                    <button type="button" onclick="countAdult('minus')" class="minus card-1"><i
                                            class="fa-regular fa-square-minus"></i></button>
                                    <div class="adultSelectContain">
                                        <input type="text" id="adultSelect" class="adultSelect" value="0" readonly>
                                    </div>
                                    <button type="button" onclick="countAdult('plus')" class="plus card-1"><i
                                            class="fa-regular fa-square-plus"></i></button>
                                </div>
                                <!-- <select class="adultSelect card-1">
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                            </select>
                            명 -->

                                <div class="count">
                                    영/유아
                                    <button type="button" onclick="countChild('minus')" class="minus card-1"><i
                                            class="fa-regular fa-square-minus"></i></button>
                                    <div class="childSelectContain">
                                        <input type="text" id="childSelect" class="childSelect" value="0" readonly>
                                    </div>
                                    <button type="button" onclick="countChild('plus')" class="plus card-1"><i
                                            class="fa-regular fa-square-plus"></i></button>
                                </div>
                                <!-- <select class="childrenSelect card-1">
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                            </select>
                            명 -->
                            </div>

                        </div>
                        <div class="priceInformation card-2">
                            <table class="priceTable">
                                <caption>
                                    가격 정보
                                </caption>
                                <tbody>
                                    <tr>
                                        <th class="lineClear1"></th>
                                        <th>성수기 <br>(6월~8월)</th>
                                        <th class="lineClear2">비성수기</th>
                                    </tr>
                                    <tr>
                                        <th class="lineClear1">성인</th>
                                        <td>30,000</td>
                                        <td class="lineClear2">20,000</td>
                                    </tr>
                                    <tr>
                                        <th class="lineClear1">영유아</th>
                                        <td>15,000</td>
                                        <td class="lineClear2">10,000</td>
                                    </tr>
                                </tbody>
                            </table>
                            

                            <!--                             <br>
                        <br>성수기(6~8월) 가격: 1인 기준 성인 30000, 아이 15000
                        <br>비성수기(6~8월 제외한 달) 기본가격: 1인 기준 성인 20000, 아이 10000 -->
                            <!-- <br>총 숙박기간 : <span class="a"></span> -->
                        </div>
                    </section>
                    <section class="MemberInfo card-2">
                        <div class="MemberInfoInput">
                            예약자 이름<input type="text" name="memberNickname" class="name card-1"
                                value="${loginMember.memberNickname}">
                        </div>
                        <div class="MemberInfoInput">
                            예약자 이메일<input type="text" name="memberEmail" class="name card-1"
                                value="${loginMember.memberEmail}" readonly>
                        </div>
                        <div class="MemberInfoInput">
                            예약자 전화번호<input type="tel" name="memberTel" id="memberTel" class="tel"
                                value="${loginMember.memberTel}">
                        </div>
                        <div class="MemberInfoInputaddress">
                            <div class="search">
                                예약자 주소&nbsp;<button type="button" onclick="sample4_execDaumPostcode()"
                                    class="searchBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
                            </div>
                            <div class="signUp-input-area">
                                <input type="text" id="sample4_postcode" class="sample4_postcode card-1"
                                    name="memberAddress" placeholder="우편번호" maxlength="6">


                            </div>

                            <div class="signUp-input-area">
                                <input type="text" id="sample4_roadAddress" class="sample4_roadAddress card-1"
                                    name="memberAddress" placeholder="도로명주소">
                            </div>

                            <div class="signUp-input-area">
                                <input type="text" id="sample4_detailAddress" class="sample4_detailAddress card-1"
                                    name="memberAddress" placeholder="상세주소">
                            </div>
                        </div>
                        <span class="Notice"><i class="fa-solid fa-triangle-exclamation"></i>무통장 입금 시</span>
                        <span class="accountInfo">하단에 있는 계좌번호를 참고해 주세요.</span>
                    </section>

                </section>




                <br>
                <div class="buttons">
                    <button class="btn btn-lg btn-primary" >예약하기</button>
                    <button type="button" class="btn btn-lg btn-primary" onclick="historyBack()">돌아가기</button>
                </div>

            </form>



        </main>
        <div class="footer-wrapper">
            <jsp:include page="/WEB-INF/views/common/footer.jsp" />
        </div>
        <script>

            function test (){
               var memberTel = document.getElementById("memberTel");
               var dayBetween = document.getElementsByClassName("dayBetween")[0];
               var childSelect = document.getElementsByClassName("childSelect")[0];
               var adultSelect = document.getElementsByClassName("adultSelect")[0];

               const regExp = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;

                if ( memberTel.value == null || memberTel.value == "" || !regExp.test(memberTel.value) ){

                    alert("전화번호를 확인해주세요.");
                    return false;
                }
                if (dayBetween.textContent == null || dayBetween.textContent == "" ){
                    alert("날짜를 지정해주세요.");
                    return false;
                }
                if ( (childSelect.value== null || childSelect.value== "" ||childSelect.value== 0 ) && 
                (adultSelect.value== null || adultSelect.value== "" ||adultSelect.value== 0 )
                ){
                    alert("인원수를 체크해주세요.");
                    return false;
                }
                return true;

            }




            function sample4_execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function (data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var roadAddr = data.roadAddress; // 도로명 주소 변수


                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('sample4_postcode').value = data.zonecode;
                        document.getElementById("sample4_roadAddress").value = roadAddr;

                    }
                }).open();
            }


            function countAdult(type) {
                // 결과를 표시할 element
                const adultElement = document.getElementById('adultSelect');

                // 현재 화면에 표시된 값
                let numberAdult = adultElement.value;

                // 더하기/빼기
                if (type == 'plus') {
                    numberAdult = parseInt(numberAdult) + 1;
                } else if (type == 'minus' && Number(numberAdult) > 0) {
                    numberAdult = parseInt(numberAdult) - 1;
                }

                // 결과 출력
                adultElement.value = numberAdult;
            }

            function countChild(type) {
                // 결과를 표시할 element
                const childElement = document.getElementById('childSelect');

                // 현재 화면에 표시된 값
                let numberChild = childElement.value;

                // 더하기/빼기
                if (type == 'plus') {
                    numberChild = parseInt(numberChild) + 1;
                } else if (type == 'minus' && Number(numberChild) > 0) {
                    numberChild = parseInt(numberChild) - 1;
                }

                // 결과 출력
                childElement.value = numberChild;
            }

            let priceValue;
            let people;
            var campName = "${campName}";
            var memberNickname = "${loginMember.memberNickname}";
            var memberEmail = "${loginMember.memberEmail}";
            var memberNo = "${loginMember.memberNo}";

            const Mkey = document.querySelectorAll(".minus");
            const Pkey = document.querySelectorAll(".plus");
            //결제금액
            document.addEventListener("DOMContentLoaded", function () {

                const month = localStorage.getItem("Month");

                Pkey.forEach((element) => {
                    element.addEventListener("click", calculatePrice);
                });
                Mkey.forEach((element) => {
                    element.addEventListener("click", calculatePrice);
                });
                const adultSelect = document.getElementById("adultSelect");
                const childSelect = document.getElementById("childSelect");
                const priceElement = document.getElementById("priceSum");

                function calculatePrice() {
                    console.log("calculator loaded")
                    $.ajax({
                        url: "selectPrice",
                        type: "GET",
                        data: { "month": Number(selectMonth[0].value) },
                        success: function (price) {
                            console.log(price);
                            console.log("몇월달 ? " + Number(selectMonth[0].value));
                            let childPrice = price * 0.5;
                            let adultOptionValue = adultSelect.value;
                            let adultTotalPrice = price * adultOptionValue;


                            const totalday = localStorage.getItem("totalDay");

                            let childrenOptionValue = childSelect.value;
                            let childrenTotalPrice = childPrice * childrenOptionValue;

                            let totalPeople = Number(adultOptionValue) + Number(childrenOptionValue);
                            localStorage.setItem("totalPeople", JSON.stringify(totalPeople));

                            let totalPeopleValue = {
                                adultOption: adultOptionValue,
                                childOption: childrenOptionValue
                            }
                            localStorage.setItem("totalPeopleValue", JSON.stringify(totalPeopleValue))

                            let totalPrice = 0;

                            console.log(people);
                            console.log(adultOptionValue);
                            console.log(childrenOptionValue);

                            if (localStorage.getItem("totalDay") == null) {
                                totalPrice = (adultTotalPrice + childrenTotalPrice) * 0;
                            } else {
                                totalPrice = (adultTotalPrice + childrenTotalPrice) * localStorage.getItem("totalDay");
                            }
                            localStorage.setItem("totalPrice", JSON.stringify(totalPrice));
                            console.log(localStorage.getItem("totalPrice"))
                            priceValue = totalPrice;
                            people = totalPeople;

                            console.log("스토리지" + localStorage.getItem("totalDay"))


                        },
                        error: function () {
                            console.log("에러 발생");
                        }
                    });
                }


                adultSelect.addEventListener("input", calculatePrice);
                childSelect.addEventListener("input", calculatePrice);
                calculatePrice();

            });

            function Teltel() {
                const memberTel = document.getElementById("memberTel");
                // 입력 이벤트 핸들러 정의
                function handleInput() {
                    // 입력이 되지 않은 경우
                    if (memberTel.value.length == 0) {
                        memberTel.placeholder = "전화번호를 입력해주세요.(- 제외)";
                        memberTel.classList.add("error");
                        memberTel.classList.add("is-invalid");
                        return;
                    }

                    // 전화번호 정규식
                    const regExp = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;

                    if (regExp.test(memberTel.value)) { // 유효한 경우
                        memberTel.classList.add("is-valid");
                        memberTel.classList.remove("is-invalid");
                        memberTel.classList.remove("error");
                        memberTel.classList.add("confirm");
                        return true;
                    } else { // 유효하지 않은 경우
                        memberTel.classList.add("is-invalid");
                        memberTel.classList.add("error");
                        memberTel.classList.remove("is-valid");
                        memberTel.classList.remove("confirm");
                        return false;
                    }
                }

                memberTel.addEventListener("input", handleInput); // 입력 이벤트 핸들러 등록
                handleInput(); // 초기 상태에서도 handleInput 실행
            }

            window.onload = function () {
                Teltel(); // Teltel 함수 실행
            };
            function historyBack() {
                history.back();
            }

//  buyer_postcode: '123-456'
        </script>


        <!-- iamport.payment.js -->
        <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

        <script src="${contextPath}/resources/js/calendar.js"></script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <!-- 다음 주소 API -->
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    </body>

    </html>