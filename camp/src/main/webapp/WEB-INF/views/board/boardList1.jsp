<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

    

<!DOCTYPE html>
<html lang="en">
<head>
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

    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>

    <script src="${contextPath}/resources/js/board/board.js"></script>

    <!-- <script>
        (function(){
            new InstagramFeed({
                'tag': '캠핑',
                'container': document.getElementById("instagram-feed"),
                'display_profile': true,
                'display_gallery': true,
                'items': 15,
                'items_per_row': 5,
                'margin': 0.5
            });
        })();
    </script>

    <script>
        (function() {
            new InstagramFeed({
                'username': 'gocamping_official',
                'container': document.getElementById("instafeed"),
                'display_profile': false,
                'display_biography': false,
                'display_gallery': true,
                'display_igtv': false,
                'callback': null,
                'styling': false,
                'items': 10, // 표시 개수
                'lazy_load': true,
                'on_error': console.error
            });
        })();
    </script>

     


    <script>
        (function(){
            new InstagramFeed({
                'tag': '캠핑',
                'container': document.getElementById("instafeed"),
                'display_profile': true,
                'display_gallery': true,
                'items': 15,
                'items_per_row': 5,
                'margin': 0.5
            });
        })();
    </script> -->


</head>
<body>
    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>

        <section>
            <h1 class="board-name"></h1>
        </section>
        
        <section class="contain">

            <div class="board">
                <span>
                    <h3>${boardName}</h3>
                </span>

                <div class="board-list">
                    
                    <div class="board-div">
                        캠핑장 추천 1
                    </div>

                    <div class="board-div">
                        캠핑장 추천 2
                    </div>

                    <div class="board-div">
                        캠핑장 추천 3
                    </div>

                    <div class="board-div">
                        캠핑장 추천 4
                    </div>

                    <div class="board-div">
                        캠핑장 추천 5
                    </div>

                </div>


                <div class="board-list">

                    <div class="board-div">
                        캠핑장 1 설명
                    </div>

                    <div class="board-div">
                        캠핑장 2 설명
                    </div>

                    <div class="board-div">
                        캠핑장 3 설명
                    </div>

                    <div class="board-div">
                        캠핑장 4 설명
                    </div>

                    <div class="board-div">
                        캠핑장 5 설명
                    </div>

                </div>

            </div>

            <div class="board-empty">
            
            </div>

            <div class="board">

                <span>
                    <h3>캠핑장 소식</h3>
                </span>

                <div class="board-list">

                    <!-- <div class="board-div2-1">
                        sns 소식창
                    </div> -->

                    <div class="footer-instagram">
                        <h3>instagram feed</h3>
                        <div class="instagram-box">
                            <div id="instafeed"></div>
                        </div>
                    </div>

                    

                    

                    <div class="board-div2-2">
                        사진 넣고 링크 달기(or 광고)
                    </div>

                    <div class="board-div2-2">
                        사진 넣고 링크 달기(or 광고)
                    </div>

                </div>
                
            </div>
            
        </section>

    </main>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>


</html>