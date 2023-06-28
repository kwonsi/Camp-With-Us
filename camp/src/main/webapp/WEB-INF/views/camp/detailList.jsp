<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/detailList.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/map.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap1.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/review.css">
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" type="text/css"
        href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap-icons.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap_main_header.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/boxicons.css">

    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lazysizes/5.3.2/lazysizes.min.js"></script>

</head>

<body>

            <jsp:include page="/WEB-INF/views/common/header.jsp" />
            
            <main>
                <div class="wrap-loading display-none">

                    <div><img src="${contextPath}/resources/images/loadingNew2.gif" class="loading"/></div>
                
                </div>
                
                <div id="detailMain">

            <div id="sub_title_wrap2">
                <h1>
                    <span class="lineIntro1"></span>
                </h1>
                <!--타이틀-->
                <div class="s_title2">
                    <p class="camp_s_tt"></p>
                </div>
            </div>
        </div>


        <div class="div2">

            <div class="camp_info_box">
                <div class="img_b" id="img_b">
                    <!--             <img src="" alt="대표이미지" id="img_b" /> -->
                </div>

                <div class="cont_tb">
                    <table class="table">
                        <caption class = "logoCaption">
                            <div class="logo">
                                <a href="${contextPath}"><img src="${contextPath}/resources/images/CWUlogo.png" id="home-logo"></a>
                            </div>
                            <div class ="lineIntro1"></div>
                        </caption>
                        <colgroup>
                            <col style="width: 25%;" />
                            <col style="width: 75%;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="col">주소</th>
                                <td id="addr"> </td>
                            </tr>
                            <tr class="camp_call_pcVer">
                                <th scope="col">문의처</th>
                                <td id="tel"> </td>
                            </tr>
                            <tr>
                                <th scope="col">캠핑장 환경</th>
                                <td id="lctCl"> </td>
                            </tr>
                            <tr>
                                <th scope="col">캠핑장 유형</th>
                                <td id="induty"> </td>
                            </tr>
                            <tr>
                                <th scope="col">운영기간</th>
                                <td id="operPdCl"> </td>
                            </tr>
                            <tr>
                                <th scope="col">운영일</th>
                                <td id="operDeCl"> </td>
                            </tr>
                            <tr>
                                <th scope="col">홈페이지</th>
                                <td id="homePage">
                                </td>
                            </tr>
                            <tr>
                                <th scope="col">예약방법</th>
                                <td id="resveCl"></td>
                            </tr>
                            <tr>
                                <th scope="col">주변이용가능시설</th>
                                <td id="posblFcltyCl"> </td>
                            </tr>
                        </tbody>
                    </table>
                </div>


            </div>


        </div>

        <br>
        <hr>

        <div class="layout">

            <div class="camp_cont_w">
                <ul class="camp_tab05">

                    <li class="campListli"><a href='/camp/campList/detailList?campName=${campName}&viewType=1'
                            onclick="changeBackgroundColor(event)">
                            캠핑장 소개</a></li>
                    <li class="campListli"><a href='/camp/campList/detailList?campName=${campName}&viewType=2'
                            onclick="changeBackgroundColor(event)">
                            캠핑장 가격</a></li>
                    <li class="campListli"><a href='/camp/campList/detailList?campName=${campName}&viewType=3'
                            onclick="changeBackgroundColor(event)">
                            위치/주변정보</a></li>
                    <li class="campListli"><a href='/camp/campList/detailList?campName=${campName}&viewType=4'
                            onclick="changeBackgroundColor(event)">
                            날씨</a></li>
                    <li class="campListli"><a href='/camp/campList/detailList?campName=${campName}&viewType=5'
                            onclick="changeBackgroundColor(event)">
                            리뷰</a></li>
                </ul>
            </div>
        </div>





        <!-- viewType == 1 일때 -->
        <c:if test="${param.viewType == '1'}">

            <div class="div3">

                <section id="table_type03">
                    <div class="table_w">

                        <table class="table_t4 camp_etc_tb">
                            <caption class="logoCaption"><span class = "table_t4_span"><i class="fa-solid fa-chevron-right"></i> &nbsp;  기타 주요시설 </span>
                                <div class="logo">
                                    <a href="${contextPath}"><img src="${contextPath}/resources/images/CWUlogo2.png" id="home-logo"></a>
                                </div>
                            </caption>
                            <tbody class="t_c">
                                <tr>
                                    <th scope="col">주요시설</th>
                                    <td>
                                        <ul class="table_ul05">
                                            <!--                                        <li>일반야영장(2면)</li>-->

                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="col">기타 정보</th>
                                    <td>
                                        <ul class="table_ul05">
                                            <!--                                         <li> 반려동물 동반 불가능</li> -->
                                        </ul>
                                        <br />
                                        <br />
                                        (※ 실제 결과는 현장사정 및 계절에 따라 달라질 수 있으니 캠핑장 사업주에 직접 확인 후 이용바랍니다.)
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="col">사이트 크기</th>
                                    <td>
                                        <ul class="table_ul05">
                                            <!--                                         <li>4 X 6 : 13개</li> -->
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="col">글램핑 내부시설</th>
                                    <td>
                                        <ul class="table_ul05">
                                            <!--                               <li>침대</li> -->
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="col">카라반 내부시설</th>
                                    <td>
                                        <ul class="table_ul05">
                                            <!--                                         <li>침대</li> -->
                                        </ul>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="col">화로대</th>
                                    <td class="etc_type">
                                        <ul class="table_ul05">
                                            <!--                                         <li> 개별</li> -->
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="col">안전시설현황</th>
                                    <td>
                                        <ul class="table_ul05">
                                            <!--                                         <li>소화기 (20)</li>-->
                                        </ul>
                                    </td>
                                </tr>
                                <th scope="col">부가 정보</th>
                                <td id="last4">
                                    <ul class="table_ul05">
                                    </ul>
                                </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
            </div>


            <div class="div4_1"> <span> <i class="fa-solid fa-chevron-right"></i> &nbsp; 캠핑장 이미지 </span> 
                <div class="logo">
                    <a href="${contextPath}"><img src="${contextPath}/resources/images/CWUlogo2.png" id="home-logo"></a>
                </div>

            </div>

            <div class="div4">

                <div class="post-slider">
                    <div class="post-wrapper">

                    </div>
                </div>
            </div>



            <div class="div5"><span> <i class="fa-solid fa-chevron-right"></i> &nbsp; 캠핑장 소개글 </span>
                <div class="logo">
                    <a href="${contextPath}"><img src="${contextPath}/resources/images/CWUlogo2.png" id="home-logo"></a>
                </div>
            </div>
            <div class="div6" id="intro"></div>

        </c:if>


        <!-- viewType == 2 일때 -->
        <c:if test="${param.viewType == '2'}">
            <div class="div7">
                <!-- ${campName} 이용 요금 -->
                <div id = "campNamePrice"></div>&nbsp;
                <div class="logo">
                    <a href="${contextPath}"><img src="${contextPath}/resources/images/CWUlogo2.png" id="home-logo"></a>
                </div>
            </div>
            <div class="table_w2">
                <table class="table camp_info_tb">
                    <colgroup>
                        <col style="width: 20%">
                        <col style="width: 20%">
                        <col style="width: 20%">
                        <col style="width: 20%">
                        <col style="width: 20%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th rowspan="2" scope="col">구분</th>
                            <th colspan="2" scope="colgroup">비성수기</th>
                            <th id="last1" colspan="2" scope="colgroup">성수기 (6월~8월)</th>
                        </tr>

                        <tr>
                            <th scope="col">주중</th>
                            <th scope="col">주말</th>
                            <th scope="col">주중</th>
                            <th id="last2" scope="col">주말</th>
                        </tr>
                    </thead>
                    <tbody class="t_c">
                        <tr>
                            <th scope="col"> 성인 </th>
                            <td>20,000</td>
                            <td>20,000</td>
                            <td>30,000</td>
                            <td id="last3">30,000</td>
                        </tr>
                        <tr>
                            <th scope="col"> 영유아 </th>
                            <td>10,000</td>
                            <td>10,000</td>
                            <td>15,000</td>
                            <td id="last3">15,000</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </c:if>

        <!-- viewType == 3 일때 -->
        <c:if test="${param.viewType == '3'}">
            <div class="div7">
                <!-- ${campName} 지역정보 -->
                <div id = "campNameMap"></div>&nbsp;
                <div class="logo">
                    <a href="${contextPath}"><img src="${contextPath}/resources/images/CWUlogo2.png" id="home-logo"></a>
                </div>
            </div>
            <div class="kakaoMap">
                <div id="map" style="width:auto; height:600px;"></div>
            </div>
        </c:if>




        <!-- viewType == 4 일때 -->
        <c:if test="${param.viewType == '4'}">

            <div class="div7" >
                <div id="doNmVal"> 지역 날씨 </div>&nbsp;
                <div class="logo">
                    <a href="${contextPath}"><img src="${contextPath}/resources/images/CWUlogo2.png" id="home-logo"></a>
                </div>
            </div>
            <div class="table_w3">
                <table class="table camp_info_tb">
                    <colgroup>
                        <!--                                 <col style="width: 20%">
                        <col style="width: 20%">
                        <col style="width: 20%">
                        <col style="width: 20%">
                        <col style="width: 20%"> -->
                    </colgroup>
                    <thead>
                        <tr>
                            <th rowspan="2" scope="col">구분</th>

                        </tr>

                        <tr>
                            <th scope="col" class="date"></th>
                            <th scope="col" class="date"></th>
                            <th scope="col" class="date"></th>
                            <th scope="col" class="date"></th>
                            <th scope="col" class="date"></th>
                            <th scope="col" class="date"></th>
                            <th scope="col" class="date"></th>
                            <th scope="col" class="date"></th>
                            <th scope="col" class="date"></th>
                            <th scope="col" class="date"></th>
                        </tr>
                    </thead>
                    <tbody class="t_c">
                        <tr>
                            <th scope="col" height="100px" class="date2">오전</th>
                            <td class="AM"></td>
                            <td class="AM"></td>
                            <td class="AM"></td>
                            <td class="AM"></td>
                            <td class="AM"></td>
                            <td class="AM"></td>
                            <td class="AM"></td>
                            <td rowspan="2" class="AM"></td>
                            <td rowspan="2" class="AM"></td>
                            <td rowspan="2" class="AM"></td>
                        </tr>
                        <tr>
                            <th scope="col" height="100px" class="date2">오후</th>
                            <td class="PM"></td>
                            <td class="PM"></td>
                            <td class="PM"></td>
                            <td class="PM"></td>
                            <td class="PM"></td>
                            <td class="PM"></td>
                            <td class="PM"></td>
                        </tr>
                        <tr>
                            <th scope="col" height="50px" class="date2">강수량</th>
                            <td class="rp"></td>
                            <td class="rp"></td>
                            <td class="rp"></td>
                            <td class="rp"></td>
                            <td class="rp"></td>
                            <td class="rp"></td>
                            <td class="rp"></td>
                            <td class="rp"></td>
                            <td class="rp"></td>
                            <td class="rp"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </c:if>








        <c:if test="${param.viewType == '5'}">


        <div class="div7">
            <!-- ${campName} 리뷰 -->
            <div id = "campNameReview"></div>&nbsp;
            <div class="logo">
                <a href="${contextPath}"><img src="${contextPath}/resources/images/CWUlogo2.png" id="home-logo"></a>
            </div>
        </div>
            <div class="div8">

                <jsp:include page="/WEB-INF/views/camp/campReview.jsp" />

            </div>
        </c:if>








        <button type="button" id="reservationBtn"><a>예약하기</a></button>



    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
        // 캠핑장 이름
        const campName = "${campName}";
        // 로그인한 회원 번호
        const loginMemberNo = "${loginMember.memberNo}";
        const loginManager = "${loginMember.manager}";
        // 최상위 주소
        const contextPath = "${contextPath}";
        // 캠핑장 번호
        var campItem = JSON.parse(localStorage.getItem("item"));
        const campNo = parseInt(campItem.contentId);
    </script>


    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eb6841185807d60ca94c27f62bee498c"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="${contextPath}/resources/js/detailList.js"></script>
    <script src="${contextPath}/resources/js/review.js"></script>
    <script src="${contextPath}/resources/js/weather.js"></script>
    <script src="${contextPath}/resources/js/weather2.js"></script>
    <script src="${contextPath}/resources/js/common.js"></script>


    <div class="modal">
        <img id="modal-image" src="${contextPath}/resources/images/user.png">
    </div>



</body>

<script>


</script>

</html>