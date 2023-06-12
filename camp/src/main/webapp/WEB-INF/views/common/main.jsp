<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>캠프보내조</title>
    <link rel="stylesheet" href="resources/css/main-style.css">
    <link rel="stylesheet" href="resources/css/main-bootstrap.css">
    <link rel="stylesheet" href="resources/css/bootstrap-icons.css">
    <link rel="stylesheet" href="resources/css/bootstrap_main_header.css">
    <link rel="stylesheet" href="resources/css/main.css">
    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>

</head>

<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <main>
        <section class="content2">

        <section class="search_bar">

                <section class="section-transform-top">
                    <div class="container">
                    <div class="box-booking">
                        <form class="rd-form rd-mailform booking-form">
                        <div>
                            <p class="booking-title">지역 선택</p>
                            <div class="form-wrap">
                                <select id="loc">
                                    <option label="지역"></option>
                                    <option value="강원">강원</option>
                                    <option value="서울">서울</option>
                                    <option value="경기">경기</option>
                                    <option value="인천">인천</option>
                                    <option value="충청북도">충청북도</option>
                                    <option value="충청남도">충청남도</option>
                                    <option value="대전">대전</option>
                                    <option value="대구">대구</option>
                                    <option value="전라북도">전라북도</option>
                                    <option value="전라남도">전라남도</option>
                                    <option value="경상북도">경상북도</option>
                                    <option value="경상남도">경상남도</option>
                                    <option value="광주">광주</option>
                                    <option value="울산">울산</option>
                                    <option value="부산">부산</option>
                                    <option value="제주">제주</option>
                                </select>
                            </div>
                        </div>
                        <div>
                            <p class="booking-title">테마 선택</p>
                            <div class="form-wrap">
                                <select id="theme">
                                    <option label="테마"></option>
                                    <option value="일반야영장">일반 야영장</option>
                                    <option value="자동차야영장">자동차 야영장</option>
                                    <option value="글램핑">글램핑</option>
                                    <option value="카라반">카라반</option>
                                </select>
                            </div>
                        </div>
                        <div>
                            <p class="booking-title">캠핑장 이름</p>
                            <div class="form-wrap">
                                <input class="form-input" id="booking-name" type="text" name="campName">
                                <label class="form-label" for="booking-name">캠핑장 이름</label>
                            </div>
                        </div>
                        <div>
                            <button class="button button-lg button-gray-600" type="button" onclick="searchCamp()">캠핑장 검색</button>
                        </div>
                        </form>

                    </div>
                    </div>
                </section>

            </section>
        </section>

        <hr>



        <div id="divv">

            <section class="content3 slider__wrap">

                <div class="slide slider__img">

                    <div class="slider__inner">
                        <div class="slide1 slider">
                            <div class="ranBoard">
                                <div class=" ranBoard_1" id="ranBoardImg1"> </div>
                                <div class=" ranBoard_1" id="ranBoardContent1"></div>
                            </div>
                            <div class="ranBoard">
                                <div class=" ranBoard_1" id="ranBoardImg2"> </div>
                                <div class=" ranBoard_1" id="ranBoardContent2"> </div>
                            </div>
                            <div class="ranBoard">
                                <div class=" ranBoard_1" id="ranBoardImg3"> </div>
                                <div class=" ranBoard_1" id="ranBoardContent3"> </div>
                            </div>
                        </div>
                    </div>





                    <div class="slider__inner">
                        <div class="slide2 slider">
                            <div class="ranBoard">
                                <div class=" ranBoard_1" id="ranBoardImg4"> </div>
                                <div class=" ranBoard_1" id="ranBoardContent4"> </div>
                            </div>
                            <div class="ranBoard">
                                <div class=" ranBoard_1" id="ranBoardImg5"> </div>
                                <div class=" ranBoard_1" id="ranBoardContent5"> </div>
                            </div>
                            <div class="ranBoard">
                                <div class=" ranBoard_1" id="ranBoardImg6"> </div>
                                <div class=" ranBoard_1" id="ranBoardContent6"> </div>
                            </div>
                        </div>
                    </div>

                    <div class="slider__inner">
                        <div class="slide3 slider">
                            <div class="ranBoard">
                                <div class=" ranBoard_1" id="ranBoardImg7"> </div>
                                <div class=" ranBoard_1" id="ranBoardContent7"> </div>
                            </div>
                            <div class="ranBoard">
                                <div class=" ranBoard_1" id="ranBoardImg8"> </div>
                                <div class=" ranBoard_1" id="ranBoardContent8"> </div>
                            </div>
                            <div class="ranBoard">
                                <div class=" ranBoard_1" id="ranBoardImg9"> </div>
                                <div class=" ranBoard_1" id="ranBoardContent9"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="slider__inner">
                        <div class="slide3 slider">
                            <div class="ranBoard">
                                <div class=" ranBoard_1" id="ranBoardImg10"> </div>
                                <div class=" ranBoard_1" id="ranBoardContent10"> </div>
                            </div>
                            <div class="ranBoard">
                                <div class=" ranBoard_1" id="ranBoardImg11"> </div>
                                <div class=" ranBoard_1" id="ranBoardContent11"> </div>
                            </div>
                            <div class="ranBoard">
                                <div class=" ranBoard_1" id="ranBoardImg12"> </div>
                                <div class=" ranBoard_1" id="ranBoardContent12"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="slider__inner">
                        <div class="slide3 slider">
                            <div class="ranBoard">
                                <div class=" ranBoard_1" id="ranBoardImg13"> </div>
                                <div class=" ranBoard_1" id="ranBoardContent13"> </div>
                            </div>
                            <div class="ranBoard">
                                <div class=" ranBoard_1" id="ranBoardImg14"> </div>
                                <div class=" ranBoard_1" id="ranBoardContent14"> </div>
                            </div>
                            <div class="ranBoard">
                                <div class=" ranBoard_1" id="ranBoardImg15"> </div>
                                <div class=" ranBoard_1" id="ranBoardContent15"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="slider__inner">
                        <div class="slide3 slider">
                            <div class="ranBoard">
                                <div class=" ranBoard_1" id="ranBoardImg16"> </div>
                                <div class=" ranBoard_1" id="ranBoardContent16"> </div>
                            </div>
                            <div class="ranBoard">
                                <div class=" ranBoard_1" id="ranBoardImg17"> </div>
                                <div class=" ranBoard_1" id="ranBoardContent17"> </div>
                            </div>
                            <div class="ranBoard">
                                <div class=" ranBoard_1" id="ranBoardImg18"> </div>
                                <div class=" ranBoard_1" id="ranBoardContent18"> </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="slider__btn">
                    <a class="prev">prev</a>
                    <a class="next">next</a>
                </div>
                <div class="slider__dot"></div>
            </section>

        </div>



    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script src="${contextPath}/resources/js/main.js"></script>


</body>

</html>