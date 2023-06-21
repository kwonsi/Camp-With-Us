<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 등록</title>
    
    <link rel="stylesheet" href="${contextPath}/resources/css/boxicons.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/boardWriteForm-style.css">
    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>


    <!-- 서머노트를 위해 추가해야할 부분 -->
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">	


    <c:set var="boardCode" value="${boardCode}" />
    <c:set var="cp" value="${cp}" />

</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>
       

        <form action="${boardCode}" enctype="multipart/form-data" method="POST" class="board-write"
            onsubmit="return writeValidate()">

            <!-- 제목 -->
            <h1 class="board-title">
                <input type="text" name="boardTitle" placeholder="제목을 입력해주세요." value="${detail.boardTitle}">         
            </h1>


            <%-- imageList에 존재하는 이미지 레벨을 이용하여 변수 생성 --%>
            <!-- <c:forEach items="${detail.imageList}" var="boardImage">

                <c:choose>
                    <c:when test="${boardImage.imageLevel == 0}">
                        <%-- c:set 변수는 page scope가 기본값 (조건문이 끝나도 사용 가능)  --%>
                        <c:set var="img0"  value="${contextPath}${boardImage.imageReName}" />
                    </c:when>

                    <c:when test="${boardImage.imageLevel == 1}">
                        <c:set var="img1"  value="${contextPath}${boardImage.imageReName}" />
                    </c:when>

                    <c:when test="${boardImage.imageLevel == 2}">
                        <c:set var="img2"  value="${contextPath}${boardImage.imageReName}" />
                    </c:when>

                    <c:when test="${boardImage.imageLevel == 3}">
                        <c:set var="img3"  value="${contextPath}${boardImage.imageReName}" />
                    </c:when>

                    <c:when test="${boardImage.imageLevel == 4}">
                        <c:set var="img4"  value="${contextPath}${boardImage.imageReName}" />
                    </c:when>
                </c:choose>
            </c:forEach> -->
            

            <!-- 썸네일 -->
            <!-- <div class="img-box">
                <div class="boardImg thumbnail">
                    <label for="img0">
                        <img class="preview" src="${img0}">
                    </label>
                    <input type="file" class="inputImage" id="img0" name="images" accept="image/*">
                    <span class="delete-image">&times;</span>
                </div>
            </div> -->

            <!-- 업로드 이미지 -->
            <!-- <div class="img-box">

                <div class="boardImg">
                    <label for="img1">
                        <img class="preview" src="${img1}">
                    </label>
                    <input type="file" class="inputImage" id="img1" name="images" accept="image/*">
                    <span class="delete-image">&times;</span>
                </div>

                <div class="boardImg">
                    <label for="img2">
                        <img class="preview" src="${img2}">
                    </label>
                    <input type="file" class="inputImage" id="img2" name="images" accept="image/*">
                    <span class="delete-image">&times;</span>
                </div>

                <div class="boardImg">
                    <label for="img3">
                        <img class="preview" src="${img3}">
                    </label>
                    <input type="file" class="inputImage" id="img3" name="images" accept="image/*">
                    <span class="delete-image">&times;</span>
                </div>
                
                <div class="boardImg">
                    <label for="img4">
                        <img class="preview" src="${img4}">
                    </label> 
                    <input type="file" class="inputImage" id="img4" name="images" accept="image/*">
                    <span class="delete-image">&times;</span>
                </div>
            </div> -->

            <!-- 내용 -->
            <div class="container board-content">
                <textarea class="summernote" name="boardContent">${detail.boardContent}</textarea>
            </div>


            <!-- 사진파일 추가 -->
            <!-- <div class="img-box" id="image_preview">
                <button id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none; margin-bottom: 2px;">파일 선택</button>
                <input type="file" id="btnAtt" multiple="multiple" name="images" style="display:none;" />
                <div id="att_zone"
                  data-placeholder="사진을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요"></div>
            </div> -->
            <!-- <div class="img-box" id="image_preview">
                <button id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none; margin-bottom: 2px;">파일 선택</button>
                <input type="file" id="btnAtt" multiple="multiple" name="images" style="display:none;" />
                <div id="att_zone"
                  data-placeholder="사진을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요"></div>
            </div> -->


            <!-- 버튼 영역 -->
            <div class="board-btn-area">
                <button type="submit" id="writebtn">등록</button>

                <!-- insert 모드 -->
                <c:if test="${param.mode == 'insert'}">
                    <button type="button" id="goToListBtn">목록으로</button>
                </c:if>
                
                <!-- update 모드 -->
                <c:if test="${param.mode == 'update'}">
                    <button type="button" onclick="location.href='${header.referer}'">이전으로</button>                           
                </c:if>

            </div>


            <!-- 숨겨진 값(hidden) -->
            <!-- 동작 구분 -->
            <input type="hidden" name="mode" value="${param.mode}">

            <!-- 게시글 번호 (커맨드객체인 BoardDeteil.boardNo 세팅하기)-->
            <input type="hidden" name="boardNo" value="${empty param.no ? 0 : param.no}">
            
            <!-- 현재 페이지 -->
            <input type="hidden" name="cp" value="${param.cp}">

            <!-- summernote 이미지 경로 받아오기-->
            <input type="hidden" name="imgPath" value="${param.imgPath}">
            
            <!-- 존재하던 이미지가 제거되었음을 기록하여 전달하는 input -->
            <!-- value에 제거된 이미지의 레벨을 기록 (X버튼 클릭 시)-->
            <!-- DELETE FROM BOARD_IMG 
                 WHERE BOARD_NO = 1000 
                 AND IMG_LEVEL IN (0,3,1,2) -->
            <!-- <input type="hidden" name="deleteList" id="deleteList" value=""> -->

        </form>

        
    </main>

        <!-- <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> -->

        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

        <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
        <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>



        <script>
            const boardCode = "${boardCode}"; // 게시판코드를 전역변수로 생성해주기
            const cp = "${cp}";
            const contextPath = "${contextPath}";
        </script>
    
     
        <script src="${contextPath}/resources/js/board/board.js"></script>
        <script src="${contextPath}/resources/js/board/boardWriteForm.js"></script>


</body>
</html>