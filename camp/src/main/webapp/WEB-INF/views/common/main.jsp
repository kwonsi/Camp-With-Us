<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

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
        
        <section class="content1">
            
            <img class="mainImg" src="${contextPath}/resources/images/testMain1.jpg" alt="테스트 이미지">

        </section>

        <section class="content2">

            

            <button id="location" onclick="selectLoc()" type="button">지역 선택</button>
            <span class="searchOption"></span>

            <button id="theme" onclick="selectTheme()" type="button">테마 선택</button>
            <span class="searchOption"></span>

            <button type="button" onclick="searchCamp()">검색</button>

  
        </section>



        <hr>

        <section class="content3" id="sliderContainer">
            

            <div class = "ranBoard" aria-hidden="false">
                <div class=" ranBoard_1" id="ranBoardImg1"> </div>   
                <div class=" ranBoard_1" id="ranBoardContent1"> 
                    
<!--                     <div class="cont_tb">
                        <table class="table">
                            <colgroup>
                                <col style="width: 30%;" />
                                <col style="width: 70%;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="col">캠핑장 이름</th>
                                    <td> </td>
                                </tr>
                                <tr class="camp_call_pcVer">
                                    <th scope="col">주소</th>
                                    <td> </td>
                                </tr>
                                <tr>
                                    <th scope="col">연락처</th>
                                    <td > </td>
                                </tr>
                                <tr>
                                    <th scope="col">캠핑장 유형</th>
                                    <td> </td>
                                </tr>
                            </tbody>
                        </table>
                    </div> -->


                </div>  
            </div>

            <div class = "ranBoard">
                <div class=" ranBoard_1" id="ranBoardImg2"> </div>
                <div class=" ranBoard_1" id="ranBoardContent2"> </div> 
            </div>

            <div class = "ranBoard">
                <div class=" ranBoard_1" id="ranBoardImg3"> </div>
                <div class=" ranBoard_1" id="ranBoardContent3"> </div> 
            </div>
           
            

        </section>

        <button id="resetBtn"> 작동하길 </button>



    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script src="${contextPath}/resources/js/main.js"></script>

</body>
</html>