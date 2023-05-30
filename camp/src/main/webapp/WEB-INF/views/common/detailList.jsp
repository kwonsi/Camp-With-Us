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
    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>

</head>

<body>
    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />





        <div class="div2">



            <div class="camp_info_box">
                <div class="img_b" id="img_b">
                    <!--             <img src="" alt="대표이미지" id="img_b" /> -->
                </div>

                <div class="cont_tb">
                    <table class="table">
                        <caption> ${campName}
                        </caption>
                        <colgroup>
                            <col style="width: 30%;" />
                            <col style="width: 70%;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="col">주소</th>
                                <td id="addr"> item.addr1 </td>
                            </tr>
                            <tr class="camp_call_pcVer">
                                <th scope="col">문의처</th>
                                <td id="tel"> item.tel </td>
                            </tr>
                            <tr>
                                <th scope="col">캠핑장 환경</th>
                                <td id="lctCl"> item.lctCl </td>
                            </tr>
                            <tr>
                                <th scope="col">캠핑장 유형</th>
                                <td id="induty"> item.induty </td>
                            </tr>
                            <tr>
                                <th scope="col">운영기간</th>
                                <td id="operPdCl"> item.operPdCl </td>
                            </tr>
                            <tr>
                                <th scope="col">운영일</th>
                                <td id="openDeCl"> item.openDeCl </td>
                            </tr>
                            <tr>
                                <th scope="col">홈페이지</th>
                                <td><a href="" target="_BLANK" title="새창열림">홈페이지 바로가기</a>

                                </td>
                            </tr>
                            <tr>
                                <th scope="col">예약방법</th>
                                <td id="resveCl"> item.resveCl </td>
                            </tr>
                            <tr>
                                <th scope="col">주변이용가능시설</th>
                                <td id="posblFcltyCl"> item.posblFcltyCl </td>
                            </tr>
                        </tbody>
                    </table>
                </div>


            </div>


        </div>



        
        <div class="div3">

            <section id="table_type03">
                <div class="table_w">

                    <table class="table_t4 camp_etc_tb">
                        <caption> 기타 주요시설
                        </caption>
                        <tbody class="t_c">
                            <tr>
                                <th scope="col">주요시설</th>
                                <td>
                                    <ul class="table_ul05">
 <!--                                        <li>일반야영장(2면)</li>
                                        <li>글램핑시설(22면)</li>
                                        <li>카라반(2면)</li> -->
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <th scope="col">기타 정보</th>
                                <td>
                                    <ul class="table_ul05">
<!--                                         <li>
                                            반려동물 동반 불가능</li> -->
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
<!--                                         <li>4 X 6 : 13개</li>
                                        <li>6 X 7 : 11개</li> -->
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <th scope="col">글램핑 내부시설</th>
                                <td>
                                    <ul class="table_ul05" >
          <!--                               <li>침대</li>
                                        <li>에어컨</li>
                                        <li>냉장고</li>
                                        <li>유무선인터넷</li>
                                        <li>난방기구</li>
                                        <li>취사도구</li>
                                        <li>내부화장실</li> -->
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <th scope="col">카라반 내부시설</th>
                                <td>
                                    <ul class="table_ul05" >
<!--                                         <li>침대</li>
                                        <li>TV</li>
                                        <li>에어컨</li>
                                        <li>냉장고</li>
                                        <li>유무선인터넷</li>
                                        <li>난방기구</li>
                                        <li>취사도구</li>
                                        <li>내부화장실</li> -->
                                    </ul>
                                </td>
                            </tr>

                            <tr>
                                <th scope="col">화로대</th>
                                <td class="etc_type">
                                    <ul class="table_ul05">
<!--                                         <li>
                                            개별
                                        </li> -->
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <th scope="col">안전시설현황</th>
                                <td>
                                    <ul class="table_ul05">
<!--                                         <li>소화기 (20)</li>
                                        <li>방화수 (2)</li>
                                        <li>방화사 (1)</li>
                                        <li>화재감지기 (24)</li> -->
                                    </ul>
                                </td>
                            </tr>
                            <th scope="col">부가 정보</th>
                            <td>
                                <ul class="table_ul05">
                                </ul>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </section>



        </div>


        <div class="div4_1"> 이 미 지 리 스 트 </div>
        <div class="div4">

            <div class="box_photo" id="box_photo">
            </div>


        </div>



        <div class="div5"> 캠 핑 장 소 개 글 </div>

        <div class="div6" id="intro"></div>



        <div class="kakaoMap">
            <div id="map" style="width:500px;height:400px;"></div>
        </div>



        <button type="button"><a
                href='${contextPath}/campDetail/reservation?campName=${campName}'>예약페이지</a></button>


        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>


    <script>

        const campName = "${campName}";
    </script>


    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eb6841185807d60ca94c27f62bee498c"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/detailList.js"></script>
</body>

</html>
