<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>캠프보내조</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap-icons.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap_main_header.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/review.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/boxicons.css">
    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <main class="myPage-content">
        
        <jsp:include page="/WEB-INF/views/mypage/sideMenu.jsp"/>

        <section class="myPage-main">
            <div class = "myPageHeadFlex">
                <div class = "myPageHead">

                    <c:choose>
                        <c:when test="${loginMember.manager == 'Y'}">
                            <h1 class="myPage-title">전체 리뷰 조회</h1>
                            <span class="myPage-explanation">전체 리뷰를 볼 수 있습니다.</span>
                        </c:when>
                        <c:otherwise>
                    <h1 class="myPage-title">내 리뷰 조회</h1>
                    <span class="myPage-explanation">현재 회원님이 작성한 리뷰를 볼 수 있습니다.</span>
                    </c:otherwise>
                </c:choose>
     
            

        </div>
    </div>
            <div class="reply-list-area">
        
                <ul id="reply-list">



                </ul>

              
            </div>
            <div id="pagination" class="pagination"></div>
        </section>

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
        const contextPath = "${contextPath}";
        const loginMemberNo = "${loginMember.memberNo}";
        const loginManager = "${loginMember.manager}";

        const replyList = document.getElementById("reply-list"); // ul태그

        // 리뷰 목록 조회(AJAX)
        if(document.getElementById("reply-list")) {

            function selectMyReplyList() {
            
                $.ajax({
                    url : contextPath + "/member/myPage/selectMyReview",
                    type : "GET",
                    dataType : "JSON",
                    success : function(rList) {
                        // rList : 반환 받은 리뷰 목록 
                        console.log("리뷰 목록 : " + rList);

                        if(rList == null || rList.length == 0) {
                            replyList.innerHTML += "<div class='alert alert-dismissible alert-light'>" +
                                                    // "<button type='button' class='btn-close' data-bs-dismiss='alert'></button>" +
                                                    "<strong>리뷰 내역이 존재하지 않습니다.</strong> <a href='/camp/campList/?loc=&theme=&campName=' class='alert-link'>캠핑장을 예약</a>하고 리뷰를 추가해보세요!</div>";
                        } else {
                            var currentPage = 1;
                            var itemsPerPage = 15;
    
                            function displayItems(page) {
                                var startIndex = (page - 1) * itemsPerPage;
                                var endIndex = startIndex + itemsPerPage;
    
                                //var reviewList = JSON.parse(rList);
                                //console.log("parse " + rList);
                                
                                var totalPages = Math.ceil(rList.length / itemsPerPage);
                                var paginatedItems = rList.slice(startIndex, endIndex);
                                
                                // 화면에 출력되어 있는 리뷰 목록 삭제            
                                if (replyList) { 
                                    replyList.innerHTML = "";
                                }
    
                                // rList에 저장된 요소를 하나씩 접근
                                for(let reply of paginatedItems){
    
                                    // 행
                                    const replyRow = document.createElement("li");
                                    replyRow.classList.add("reply-row");
                                    
                                    // 작성자
                                    const replyWriter = document.createElement("p");
                                    replyWriter.classList.add("reply-writer");
    
                                    // 프로필 이미지
                                    const profileImage = document.createElement("img");
    
                                    if( reply.profileImage != null ){ // 프로필 이미지가 있을 경우
                                        profileImage.setAttribute("src", contextPath + reply.profileImage);
                                    }else{ // 없을 경우 == 기본이미지
                                        profileImage.setAttribute("src", contextPath + "/resources/images/user.png");
                                    }
    
                                    // 작성자 닉네임
                                    const memberNickname = document.createElement("span");
                                    memberNickname.innerText = reply.memberNickname;
                                    
                                    // 별점 불러오기
                                    //const reviewStar = document.querySelector('input[name="reviewStar"]:checked');
                                    //$("input:radio[name=reviewStar][value=" + reply.campRate + "]").attr("checked", true);
    
                                    // 작성일
                                    const replyDate = document.createElement("span");
                                    replyDate.classList.add("reply-date");
                                    replyDate.innerText =  "(" + reply.createDate + ")";
    
                                    const replyCampA = document.createElement("a");
                                    replyCampA.href = "${contextPath}/campList/detailList?campName="+reply.campName+"&viewType=1";
                                    
                   /*                  const replyCamp = document.createElement("span");
                                    replyCamp.classList.add("reply-camp"); */

                                    replyCampA.innerText = reply.campName;
    
                        /*             const replyCampValue = replyCampA.appendChild(replyCamp); */

                                    const reviewListStar = document.createElement("span");
                                    reviewListStar.classList.add("reviewListStar" + reply.campRate);
                                    
                                    
                                    // for(let i=0; i<star.length; i++) {
                                    //     star[i].style.color = "transparent";
                                    //     star[i].style.textShadow = "0 0 0 #f0f0f0";
                                    // }
    
                                    if(reviewListStar.classList.contains('reviewListStar1')) {
                                        reviewListStar.innerHTML = "<span class='rate-in'>★</span>" +
                                        "<span class='rate-out'>★★★★</span>";
                                    } else if(reviewListStar.classList.contains('reviewListStar2')) {
                                        reviewListStar.innerHTML = "<span class='rate-in'>★★</span>" +
                                        "<span class='rate-out'>★★★</span>";
                                    } else if(reviewListStar.classList.contains('reviewListStar3')) {
                                        reviewListStar.innerHTML = "<span class='rate-in'>★★★</span>" +
                                        "<span class='rate-out'>★★</span>";
                                    } else if(reviewListStar.classList.contains('reviewListStar4')) {
                                        reviewListStar.innerHTML = "<span class='rate-in'>★★★★</span>" +
                                        "<span class='rate-out'>★</span>";
                                    } else if(reviewListStar.classList.contains('reviewListStar5')) {
                                        reviewListStar.innerHTML = "<span class='rate-in'>★★★★★</span>";
                                    }
                                    
    
                                    // 작성자 영역(p)에 프로필,닉네임,작성일 마지막 자식으로(append) 추가
                                    replyWriter.append(profileImage , memberNickname , replyDate, replyCampA, reviewListStar);
    
                                    
    
                                    // 리뷰 내용
                                    const reviewContents = document.createElement("p");
                                    reviewContents.classList.add("reply-content");
    
                                    // 왜 innerHTML?  <br> 태그 인식을 위해서
                                    reviewContents.innerHTML = reply.reviewContents;
    
                                    // 행에 작성자, 내용 추가
                                    replyRow.append(replyWriter, reviewContents);
    
    
    
                                    // 로그인이 되어있는 경우 수정, 삭제 버튼 추가
                                    if(loginMemberNo != ""){
                                        // 버튼 영역
                                        const replyBtnArea = document.createElement("div");
                                        replyBtnArea.classList.add("reply-btn-area");
    
                                        // 로그인한 회원번호와 리뷰 작성자의 회원번호가 같을 때만 버튼 추가
                                        if(  loginMemberNo == reply.memberNo || loginManager == 'Y'  ){
    
                                            // 수정 버튼
                                            const updateBtn = document.createElement("button");
                                            updateBtn.innerText = "수정";
    
                                            // 수정 버튼에 onclick 이벤트 속성 추가
                                            updateBtn.setAttribute("onclick", "showUpdateReply("+reply.reviewNo+", this)");                        
    
                                            // 삭제 버튼
                                            const deleteBtn = document.createElement("button");
                                            deleteBtn.innerText = "삭제";
                                            // 삭제 버튼에 onclick 이벤트 속성 추가
                                            deleteBtn.setAttribute("onclick", "deleteReply("+reply.reviewNo+")");                       
    
                                            // 버튼 영역 마지막 자식으로 수정/삭제 버튼 추가
                                            replyBtnArea.append(updateBtn, deleteBtn);
    
                                        } // if 끝
                                        
                                        // 행에 버튼영역 추가
                                        replyRow.append(replyBtnArea); 
                                    }
    
                                    // 리뷰 목록(ul)에 행(li)추가
                                    replyList.append(replyRow);
                                    
                                }
    
    
                                // 페이지네이션 부분 
                                var pagination = document.getElementById("pagination");
                                pagination.innerHTML = "";
    
                                var startPage = Math.floor((currentPage - 1) / 5) * 5 + 1;
                                var endPage = Math.min(startPage + 4, totalPages);
                                
                                if (startPage > 1) {
                                    var prevButton = document.createElement("button");
                                    prevButton.textContent = "이전";
                                    prevButton.classList.add("pagination-previous");
                                    prevButton.addEventListener("click", function () {
                                        currentPage = startPage - 5;
                                        displayItems(currentPage);
                                        window.scrollTo(0, 0);
    
                                    });
                                    pagination.appendChild(prevButton);
                                }
                                for (var i = startPage; i <= endPage; i++) {
                                    var pageButton = document.createElement("button");
                                    pageButton.textContent = i;
                                    pageButton.classList.add("page-button");
                                    if (i === currentPage) {
                                        pageButton.classList.add("active");
                                    }
                                    pageButton.addEventListener("click", function () {
                                        currentPage = parseInt(this.textContent);
                                        displayItems(currentPage);
                                        window.scrollTo(0, 0);
                                    });
                                    pagination.appendChild(pageButton);
                                }
    
                                if (endPage < totalPages) {
                                    var nextButton = document.createElement("button");
                                    nextButton.textContent = "다음";
                                    nextButton.classList.add("pagination-next");
                                    nextButton.addEventListener("click", function () {
                                        currentPage = endPage + 1;
                                        displayItems(currentPage);
                                        window.scrollTo(0, 0);
                                    });
                                    pagination.appendChild(nextButton);
                                }
                            } // function displayItems
    
                            displayItems(currentPage);

                        }
                        
                    },
                    error : function(req, status, error){
                        console.log("에러 발생");
                        console.log("code:"+req.status+"\n"+"message:"+req.responseText+"\n"+"error:"+error);
                    }
                });
            }
            
            selectMyReplyList();
        }

        // 리뷰 삭제
        function deleteReply(reviewNo){

        if( confirm("정말로 삭제 하시겠습니까?") ){

            // 요청주소 : /community/reply/delete
            // 파라미터 : key : "replyNo",  value : 매개변수 replyNo
            // 전달 방식 : "GET"
            // success : 삭제 성공 시 -> "삭제되었습니다"   alert로 출력
            //                           리뷰 목록 조회 함수 호출

            //           삭제 실패 시 -> "삭제 실패"        alert로 출력

            // error : 앞 error 코드 참고

            // DB에서 리뷰 삭제 ==>   REPLY_ST = 'Y' 변경

            $.ajax({
                url : contextPath + "/review/delete",
                data : {"reviewNo" : reviewNo},
                type : "GET",
                success: function(result){
                    if(result > 0){
                        alert("삭제되었습니다");
                        selectMyReplyList(); // 목록을 다시 조회해서 삭제된 글을 제거
                    }else{
                        alert("삭제 실패");
                    }
                },

                error : function(req, status, error){
                    console.log("리뷰 삭제 실패")
                    console.log(req.responseText);
                }

            });
        }
        }

        
        // ------------------------------------------------------------------------------------------
        // 리뷰 수정 화면 전환 

        var beforeReplyRow; // 수정 전 원래 행의 상태를 저장할 변수


        function showUpdateReply(reviewNo, btn){
                        // 리뷰번호, 이벤트발생요소(수정버튼)

        // ** 리뷰 수정이 한 개만 열릴 수 있도록 만들기 **
        const temp = document.getElementsByClassName("update-textarea");  

        if(temp.length > 0){ // 수정이 한 개 이상 열려 있는 경우

            if(confirm("다른 리뷰가 수정 중입니다. 현재 리뷰을 수정 하시겠습니까?")){ // 확인

                temp[0].parentElement.innerHTML = beforeReplyRow;
                // reply-row                       // 백업한 리뷰
                // 백업 내용으로 덮어 씌워 지면서 textarea 사라짐
        
            }else{ // 취소
                return;
            }
        }


        // 리뷰 수정이 클릭된 행을 선택
        const replyRow = btn.parentElement.parentElement; // 수정 버튼의 부모의 부모

        // 2. 행 내용 삭제 전 현재 상태를 저장(백업) (문자열)
        //    (전역변수 이용)
        beforeReplyRow = replyRow.innerHTML;

        // 취소 버튼 동작 코드
        //replyRow.innerHTML = beforeReplyRow;


        // 3. 리뷰에 작성되어 있던 내용만 얻어오기 -> 새롭게 생성된 textarea 추가될 예정

        //console.log(replyRow.children[1].innerHTML); // <br> 태그 유지를 위해서 innerHTML 사용
        let beforeContent = replyRow.children[1].innerHTML;

        // 이것도 가능!
        //let beforeContent = btn.parentElement.previousElementSibling.innerHTML;


        // 4. 리뷰 행 내부 내용을 모두 삭제
        replyRow.innerHTML = "";

        // 5. textarea 요소 생성 + 클래스 추가  +  **내용 추가**
        const textarea = document.createElement("textarea");
        textarea.classList.add("update-textarea");

        // 리뷰 수정 별점 요소 저장용 변수
        let updateRate = document.createElement("div");

        // 별점 수정 요소 생성
        for(let i=5; i>0; i--) {
            
            let updateStar = document.createElement("input");
            let updateStarLabel = document.createElement("label");

            updateRate.classList.add("updateRate");

            updateStar.setAttribute("type", "radio");
            updateStar.setAttribute("name", "updateStar");
            updateStar.setAttribute("id", "uRate" + i);
            updateStar.setAttribute("value", i);

            updateStarLabel.setAttribute("for", "uRate" + i);
            updateStarLabel.innerText = "★";

            updateRate.append(updateStar);
            updateRate.append(updateStarLabel);
        }


        // ******************************************
        // XSS 방지 처리 해제
        beforeContent =  beforeContent.replaceAll("&amp;", "&");
        beforeContent =  beforeContent.replaceAll("&lt;", "<");
        beforeContent =  beforeContent.replaceAll("&gt;", ">");
        beforeContent =  beforeContent.replaceAll("&quot;", "\"");

        // 개행문자 처리 해제
        beforeContent =  beforeContent.replaceAll("<br>", "\n");

        // ******************************************
        textarea.value = beforeContent; // 내용 추가

        // 6. replyRow에 생성된 textarea 추가
        replyRow.append(updateRate);
        replyRow.append(textarea);


        // 7. 버튼 영역 + 수정/취소 버튼 생성
        const replyBtnArea = document.createElement("div");
        replyBtnArea.classList.add("reply-btn-area");

        // 리뷰 수정 AJAX 실행( updateReply() )
        const updateBtn = document.createElement("button");
        updateBtn.innerText = "수정";
        updateBtn.setAttribute("onclick", "updateReply("+reviewNo+", this)");


        const cancelBtn = document.createElement("button");
        cancelBtn.innerText = "취소";
        cancelBtn.setAttribute("onclick", "updateCancel(this)");


        // 8. 버튼영역에 버튼 추가 후 
        //    replyRow(행)에 버튼영역 추가
        replyBtnArea.append(updateBtn, cancelBtn);
        replyRow.append(replyBtnArea);

        }


        // -----------------------------------------------------------------------------------
        // 리뷰 수정 취소
        function updateCancel(btn){
        // 매개변수 btn : 클릭된 취소 버튼
        // 전역변수 beforeReplyRow : 수정 전 원래 행(리뷰)을 저장한 변수

        if(confirm("리뷰 수정을 취소하시겠습니까?")){
            btn.parentElement.parentElement.innerHTML = beforeReplyRow;
        }
        }

        // -----------------------------------------------------------------------------------


        // 리뷰 수정(AJAX)
        function updateReply(reviewNo, btn){

        const updateStar = document.getElementsByName("updateStar");
        var updateStarRate = 0; // 리뷰 수정 할 때 별점 저장용 변수
        // 새로 작성된 리뷰 내용 얻어오기
        const replyContent = btn.parentElement.previousElementSibling.value;

        for(let i=0; i<updateStar.length; i++) {
            if(updateStar[i].checked) {
                updateStarRate = Number(updateStar[i].value);
                console.log(updateStarRate);
            }
        }

        $.ajax({
            url : contextPath + "/review/update",
            data : {"reviewNo" : reviewNo,
                    "reviewContents" : replyContent,
                    "campRate" : updateStarRate},
            type : "POST",
            success : function(result){
                if(result > 0){
                    alert("리뷰가 수정되었습니다.");
                    selectMyReplyList();
                }else{
                    alert("리뷰 수정 실패");
                }
            },
            error : function(req, status, error){
                console.log("리뷰 수정 실패");
                console.log(req.responseText);
            }
        });
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script src="${contextPath}/resources/js/mypage.js"></script>
    <!-- <script src="${contextPath}/resources/js/review.js"></script> -->

</body>
</html>