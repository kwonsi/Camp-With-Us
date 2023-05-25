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

            <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>

        </head>

        <body>
            <main>

                <jsp:include page="/WEB-INF/views/common/header.jsp" />




                <div class="div1">111

                    <div id="map" style="width:500px;height:400px;"></div>


                </div>
                <hr>

                <div class="div2">



                    <div class="camp_info_box">
                        <div class="img_b" id="img_b">
                <!--             <img src="" alt="대표이미지" id="img_b" /> -->
                        </div>
                        
                        <div class="cont_tb" >
                            <table class="table">
                                <caption>캠핑장 기본정보입니다. 주소, 문의처, 캠핑장 환경, 캠핑장 유형, 운영기간, 운영일, 홈페이지, 예약방법, 찾아오시는길로 나뉘어 설명합니다.
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



                <div class="div3">333


                </div>




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