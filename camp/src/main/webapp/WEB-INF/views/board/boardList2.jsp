<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<c:forEach var="boardTypeList" items="${boardTypeList}">
    <c:if test="${boardCode == boardTypeList.boardCode}">
        <c:set var="boardName" value="${boardTypeList.boardName}"/>
    </c:if>
</c:forEach>

<c:set var="pagination" value="${map.pagination}" />
<c:set var="boardList" value="${map.boardList}" />


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>${boardName}</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/boardList-style2.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/boxicons.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap_main_header.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap-icons.css">
    
    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>

</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>
        
       
        
        <%-- 검색을 진행한 경우 key, query를 쿼리스트링 형태로 저장한 변수 생성 --%>
        <c:if test="${!empty param.key}">
            <c:set var="sURL" value="&key=${param.key}&query=${param.query}" />
        </c:if>


        <section class="board-list">

            <h1 class="board-name">${boardName}</h1>

            <c:if test="${!empty param.key}">
                <div class="list1-5">
                    <h3 style="margin-left:30px;"> "${param.query}" 검색 결과  </h3>
                </div>
            </c:if>



            <div class="list-wrapper">         
                        <c:choose>
                            <c:when test="${empty boardList}">
                                <!-- 게시글 목록 조회 결과가 비어있다면 -->
                                <div class="list1-6">게시글이 존재하지 않습니다.</div>
                            </c:when>

                            <c:otherwise>
                                <!-- 게시글 목록 조회 결과가 비어있지 않다면 -->

                                <!-- 향상된 for문처럼 사용 -->
                                <c:forEach var="board" items="${boardList}">

                                    <div class="list1">
                                        <div class="list1-1"> 
                                            <c:if test="${!empty board.thumbnail}">
                                                <img class="list-thumbnail" src="${contextPath}${board.thumbnail}">
                                            </c:if>
                                        </div>

                                        <div class="list1-2">
                                            <div class="list1-3">
                                                <p>${board.boardNo} &nbsp;|&nbsp; </p><a href="../detail/${boardCode}/${board.boardNo}?cp=${pagination.currentPage}${sURL}" class="boardTitle"><p>${board.boardTitle}</p></a>
                                            </div>

                                            <hr>

                                            <div class="list1-4">
                                                <p>작성자 : ${board.memberNickname} &nbsp;|&nbsp; 작성일 : ${board.createDate} &nbsp;|&nbsp; 조회수 : ${board.readCount}</p>
                                                <a href="../detail/${boardCode}/${board.boardNo}?cp=${pagination.currentPage}${sURL}" class="board_Content"><p class="boardContent">${board.boardContent.substring(0,20)}</p></a>                        
                                                <%-- detail?no=${board.boardNo}&cp=${pagination.currentPage}&type=${param.type}${sURL} --%>
                                                <%-- 현재 페이지 주소 : /board/list/1?cp=1
                                                상세 조회 주소   : /board/detail/1/300?cp= --%>
                                            </div>

                                        </div>
                                        

                                    </div>
                                </c:forEach>

                            </c:otherwise>
                        </c:choose>
             
            </div>

            <div class="btn-area">

                <c:if test="${!empty loginMember}">
                    <!-- /camp/board/write -->
                    <button id="insertBtn" onclick="location.href='../write/${boardCode}?mode=insert&cp=${pagination.currentPage}'">글쓰기</button>                     
                </c:if>

            </div>

            
            <div class="pagination-area">

                <!-- 페이지네이션 a태그에 사용될 공통 주소를 저장한 변수 선언 -->
                <c:set var="url" value="${boardCode}?cp="/>


                <ul class="pagination">
                    <!-- 첫 페이지로 이동 -->
                    <li><a href="${url}1${sURL}">&lt;&lt;</a></li>

                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="${url}${pagination.prevPage}${sURL}">&lt;</a></li>

                    <!-- 범위가 정해진 일반 for문 사용 -->
                    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                        <c:choose>
                            <c:when test="${i == pagination.currentPage}">
                                <li><a class="current">${i}</a></li>
                            </c:when>

                            <c:otherwise>
                                <li><a href="${url}${i}${sURL}">${i}</a></li>        
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                    
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="${url}${pagination.nextPage}${sURL}">&gt;</a></li>

                    <!-- 끝 페이지로 이동 -->
                    <li><a href="${url}${pagination.maxPage}${sURL}">&gt;&gt;</a></li>

                </ul>
            </div>

            <!-- /board/list?type=1&cp=3 -->

            <!-- /board/list?type=1&cp=10 &key=t&query=안녕 -->

            <!-- <form action="list" method="get" id="boardSearch" onsubmit="return searchValidate()"> -->
            <form action="${boardCode}" method="get" id="boardSearch" onsubmit="return searchValidate()">
                <input type="hidden" name="type" value="${param.type}">

                <select name="key" id="search-key">
                    <option value="t">제목</option>
                 	<option value="c">내용</option>
                    <option value="tc">제목+내용</option>
                    <option value="w">작성자</option>
                </select>

                <input type="text" name="query"  id="search-query" placeholder="검색어를 입력해주세요.">

                <button>검색</button>
            </form>

        </section>
    </main>


    <div class="modal">
        <span id="modal-close">&times;</span>
        <img id="modal-image" src="${contextPath}/resources/images/user.png">
    </div>


    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="${contextPath}/resources/js/board/board.js"></script>
    
    <script>
        const boardList = "${boardList}";
    </script>
</body>
</html>