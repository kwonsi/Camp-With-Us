<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!-- map에 저장된 값을 각각 변수에 저장 -->
<c:forEach var="boardName" items="${boardTypeList}">
	<c:if test="${boardCode == boardType.boardCode}">
		<c:set var="boardName" value="${boardType.boardName}"/>
	</c:if>
</c:forEach>

<%-- <c:set var="boardName" value="${map.boardName}" /> --%>

<c:set var="boardList" value="${map.boardList}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>캠핑장 추천</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/boardList-style1.css">

    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>
</head>
<body>
    <main>
        
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>

        <section class="contain">

            <div class="board">
                <span>
                    <h3>캠핑장 추천</h3>
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

                    <div class="board-div2-1">
                        sns 소식창
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

    <script src="${contextPath}/resources/js/board/board.js"></script>

</body>
</html>