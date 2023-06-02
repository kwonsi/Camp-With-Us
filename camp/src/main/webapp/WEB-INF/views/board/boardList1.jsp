<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

    

<!DOCTYPE html>
<html lang="en">
<head>

    <!-- 파비콘 오류 해결 : GET http://localhost:8080/favicon.ico 404 -->
    <link rel="icon" href="data:;base64,iVBORw0KGgo=">

    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    
    <c:forEach var="boardTypeList" items="${boardTypeList}">
        <c:if test="${boardCode == boardTypeList.boardCode}">
            <c:set var="boardName" value="${boardTypeList.boardName}"/>
        </c:if>
    </c:forEach>

    
    <title>${boardName}</title>
    

    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/boardList-style1.css">
    


</head>
<body>

    <!-- JavaScript용 Facebook SDK 정규식 추가 -->
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous"
    src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v17.0&appId=804019604627586&autoLogAppEvents=1"
    nonce="g3I9sDPj"></script>


    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        
        <section class="contain">

            <div class="board">
                <div class="headline">
                    <h3>${boardName}</h3>
                </div>

                <div class="board-list">
                    
                    <div class="board-div">
                        <img class="recommend-img" src="${contextPath}/resources/images/board/semiwon.jpg" alt="양평 세미원">
                    </div>

                    <div class="board-div">
                        <img class="recommend-img" src="${contextPath}/resources/images/board/semiwon.jpg" alt="양평 세미원">
                    </div>

                    <div class="board-div">
                        <img class="recommend-img" src="${contextPath}/resources/images/board/semiwon.jpg" alt="양평 세미원">
                    </div>

                </div>


                <div class="board-list">

                    <div class="board-div">
                        <div class="recommend-title">세미원 연꽃여행</div><hr>
                        <div class="recommend-content">여행지 1 : 양평 양수리에 위치한 물과 꽃의 정원에서 여름을 맞아 연꽃문화제를 개최한다. 6만2천평 야외정원에 홍련, 백련, 페리기념연꽃이 가득 피어나고 기분 좋은 연향이 가득하다.
                            불교가 이 땅에 정착되면서 불상의 좌대나 광배에 조형된 연꽃 문양을 시작으로 고구려, 백제, 신라인들의 생활 속에 다양하게 자리 잡았습니다. 이후 통일 신라와 고려를 거쳐 조선에 이르기까지 우리 선조들의 생활 속에 화려하게 피어났습니다.
                        </div>
                        <button style="margin-top: 15px;" onclick="window.open('https://conlab.visitkorea.or.kr/conlab/search-result/formal?cid=mADJkA&defaultCid=mADJkA&keyword=%EC%97%AC%ED%96%89%EC%A7%80&searchType=Formal&page=2&lang=%ED%95%9C%EA%B5%AD%EC%96%B4&sortDirection=%EC%B5%9C%EC%8B%A0%EC%88%9C');">
                            자세히보기<i class="xi-marker-plus xi-x xi-fw"></i>
                        </button>
                    </div>

                    <div class="board-div">
                        <div class="recommend-title">세미원 연꽃여행</div><hr>
                        <div class="recommend-content">여행지 2 : 양평 양수리에 위치한 물과 꽃의 정원에서 여름을 맞아 연꽃문화제를 개최한다. 6만2천평 야외정원에 홍련, 백련, 페리기념연꽃이 가득 피어나고 기분 좋은 연향이 가득하다.
                            불교가 이 땅에 정착되면서 불상의 좌대나 광배에 조형된 연꽃 문양을 시작으로 고구려, 백제, 신라인들의 생활 속에 다양하게 자리 잡았습니다. 이후 통일 신라와 고려를 거쳐 조선에 이르기까지 우리 선조들의 생활 속에 화려하게 피어났습니다.
                        </div>
                        <button style="margin-top: 15px;" onclick="window.open('https://conlab.visitkorea.or.kr/conlab/search-result/formal?cid=mADJkA&defaultCid=mADJkA&keyword=%EC%97%AC%ED%96%89%EC%A7%80&searchType=Formal&page=2&lang=%ED%95%9C%EA%B5%AD%EC%96%B4&sortDirection=%EC%B5%9C%EC%8B%A0%EC%88%9C');">
                            자세히보기<i class="xi-marker-plus xi-x xi-fw"></i>
                        </button>
                    </div>

                    <div class="board-div">
                        <div class="recommend-title">세미원 연꽃여행</div><hr>
                        <div class="recommend-content">여행지 3 : 양평 양수리에 위치한 물과 꽃의 정원에서 여름을 맞아 연꽃문화제를 개최한다. 6만2천평 야외정원에 홍련, 백련, 페리기념연꽃이 가득 피어나고 기분 좋은 연향이 가득하다.
                            불교가 이 땅에 정착되면서 불상의 좌대나 광배에 조형된 연꽃 문양을 시작으로 고구려, 백제, 신라인들의 생활 속에 다양하게 자리 잡았습니다. 이후 통일 신라와 고려를 거쳐 조선에 이르기까지 우리 선조들의 생활 속에 화려하게 피어났습니다.
                        </div>
                        <button style="margin-top: 15px;" onclick="window.open('https://conlab.visitkorea.or.kr/conlab/search-result/formal?cid=mADJkA&defaultCid=mADJkA&keyword=%EC%97%AC%ED%96%89%EC%A7%80&searchType=Formal&page=2&lang=%ED%95%9C%EA%B5%AD%EC%96%B4&sortDirection=%EC%B5%9C%EC%8B%A0%EC%88%9C');">
                            자세히보기<i class="xi-marker-plus xi-x xi-fw"></i>
                        </button>
                    </div>

                </div>

            </div>

            <div class="board-empty">
            
            </div>

            <div class="board2">
                <span>
                    <h3>캠핑 소식</h3>
                </span>
                
                <div class="board-list">
                    <div style="border: 1px solid black;">
                        <div class="headline2">한국 관광공사 facebook 참고</div>

                        <!-- 고캠핑 플러그인 -->
                        <!-- 페이스북 개발자 로그인 된 상태에서만 화면이 제대로 나옴 -->
                        <div style="width: 450px;">
                            <div class="fb-page"
                            data-href="https://www.facebook.com/go2thecamping/"
                            data-tabs="timeline"
                            data-width="450"
                            data-height="400"
                            data-small-header="true"
                            data-adapt-container-width="true"
                            data-hide-cover="true"
                            data-show-facepile="true">
                            <blockquote cite="https://www.facebook.com/go2thecamping/"
                            class="fb-xfbml-parse-ignore">
                            <a href="https://www.facebook.com/go2thecamping/">한국관광공사 고캠핑</a>
                            </blockquote></div>
                        </div>
                    </div>

                    <div class="board-div2">
                        사진 넣고 링크 달기(or 광고)
                    </div>

                    <div class="board-div2">
                        사진 넣고 링크 달기(or 광고)
                    </div>
                    
                </div>
                
            </div>
            
        </section>

    </main>
    
    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>

    <script src="${contextPath}/resources/js/board/board.js"></script>

    

</body>


</html>