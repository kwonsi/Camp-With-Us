<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>캠프보내조</title>
    <link rel="stylesheet" href="resources/css/main.css">
    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>

</head>

<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <main>



        <section class="content2">



            <button id="location" onclick="selectLoc()" type="button">지역 선택</button>
            <span class="searchOption"></span>

            <button id="theme" onclick="selectTheme()" type="button">테마 선택</button>
            <span class="searchOption"></span>

            <button type="button" onclick="searchCamp()">검색</button>


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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script src="${contextPath}/resources/js/main.js"></script>

    <script>


    </script>

</body>

</html>