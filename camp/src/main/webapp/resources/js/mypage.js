// 회원 정보 변경 유효성 검사
function infoValidate(){
    const inputImage = document.getElementById("input-image");
    const del = document.getElementById("delete"); // hidden 타입
    const agree = document.getElementById("agree");
    const memberNickname = document.getElementById("memberNickname");
    const memberTel = document.getElementById("memberTel");

    const regExp1 = /^[a-zA-Z0-9가-힣]{2,10}$/;        // 닉네임 정규식
    const regExp2 = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/; // 전화번호 정규식

    // 닉네임 유효성 검사
    if(memberNickname.value.length == 0){ // 미작성 시 : 닉네임을 입력해주세요.
        alert("닉네임을 입력해주세요.");
        memberNickname.focus();
        return false;
    }

    if(!regExp1.test(memberNickname.value)){ // 유효하지 않은 경우
        alert("닉네임은 영어/숫자/한글 2~10 글자 사이로 작성해주세요.");
        memberNickname.focus();
        return false;
    }

    // 전화번호 유효성 검사
    if(memberTel.value.length == 0){ // 미작성 시
        alert("전화번호를 입력해주세요.(- 제외)");
        memberTel.focus();
        return false;
    }

    if(!regExp2.test(memberTel.value)){ // 유효하지 않은 경우
        return printAlert(memberTel, "전화번호 형식이 올바르지 않습니다.");
    }

    return true;
}

// 회원 프로필 이미지 변경(미리보기)
const inputImage = document.getElementById("input-image");

if(inputImage) {
    inputImage.addEventListener("change", function(){

        if(this.files[0] != undefined){ // 파일이 선택되었을 때

            const reader = new FileReader();
            
            reader.readAsDataURL(this.files[0]);

            reader.onload = function(e){
                const profileImage = document.getElementById("profile-image");

                profileImage.setAttribute("src", e.target.result);

                document.getElementById("delete").value = 0;
            }

        }
    });
}

// 프로필 이미지 옆 x버튼 클릭 시
if( document.getElementById("delete-image") ) {
    document.getElementById("delete-image").addEventListener("click", function(){
        // 0 : 안눌러짐
        // 1 : 눌러짐

        const del = document.getElementById("delete");

        if(del.value == 0){ // 눌러지지 않은 경우

            // 1) 프로필 이미지를 기본 이미지로 변경
            document.getElementById("profile-image").setAttribute("src", contextPath + "/resources/images/user.png");                     

            // 2) input type="file"에 저장된 값(value)에 "" 대입 
            document.getElementById("input-image").value = "";

            del.value = 1; // 눌러진걸로 인식
        }

    });
}

// 이미지 선택 확인
function profileValidate(){
    const inputImage = document.getElementById("input-image");

    const del = document.getElementById("delete"); // hidden 타입


    if( inputImage.value == ""  &&  del.value == 0 ){ 
        // 빈문자열 == 파일 선택 X / del의 값이 0 == x를 누르지도 않았다
        // --> 아무것도 안하고 변경버튼을 클릭한 경우

        alert("이미지를 선택한 후 변경 버튼을 클릭해주세요.");
        return false;
    }

    return true;
}

// 경고 출력 + 포커스 + false 반환  함수
function printAlert(el, message){ // 매개변수 el은 요소
    alert(message);
    el.focus();
    return false;
}

// 비밀번호 변경 제출 시 유효성 검사
function changePwValidate(){

    // 비밀번호 변경 관련 input 요소 얻어오기
    const currentPw = document.getElementsByName("currentPw")[0];
    
    //const currentPw = document.getElementById("currentPw");

    const newPw = document.getElementsByName("newPw")[0];
    const newPwConfirm = document.getElementsByName("newPwConfirm")[0];

    // 비밀번호 정규표현식
    const regEx = /^[\w!@#_-]{6,30}$/;

    // 현재 비밀번호 미작성
    if(currentPw.value.trim().length == 0){
        /*alert("현재 비밀번호를 입력해주세요.");
        currentPw.focus();
        return false;*/

        return printAlert(currentPw, "현재 비밀번호를 입력해주세요.");
    }

    // 새 비밀번호
    // 미작성
    if(newPw.value.trim().length == 0){
        alert("새 비밀번호를 입력해주세요.");
        newPw.focus();
        return false;
    }

    // 유효하지 않은 경우
    if(!regEx.test(newPw.value)){
        alert("영어, 숫자, 특수문자(!,@,#,-,_) 6~30 글자 사이로 작성해주세요.");
        newPw.focus();
        return false;
    }


    // 새 비밀번호 확인
    // 미작성
    if(newPwConfirm.value.trim().length == 0){
        return printAlert(newPwConfirm, "새 비밀번호 확인을 입력해주세요.");
    }


    // 새 비밀번호 != 새 비밀번호 확인
    if(newPw.value != newPwConfirm.value){
        return printAlert(newPwConfirm, "새 비밀번호가 일치하지 않습니다.");
    }

    return true; // 위 조건을 모두 수행하지 않은 경우 true 반환
}




// 회원 탈퇴 유효성 검사
function secessionValidate(){

    const memberPw = document.getElementById("memberPw");
    const agree = document.getElementById("agree");

    // 비밀번호 미작성
    if(memberPw.value.trim().length == 0){
        alert("비밀번호를 입력해주세요.");
        memberPw.focus();
        return false;
    }

    // 약관 동의 체크 여부
    // - 체크박스요소.checked  : 체크 시 true, 해제 시 false 반환

    if( !agree.checked ){ // 체크를 안했을 때
        alert("약관 동의 후 탈퇴 버튼을 클릭해주세요.");
        agree.focus();
        return false;
    }

    // 정말 탈퇴할지 확인
    // - window.confirm("내용") : 대화 상자에 확인/취소 생성
    //      확인 클릭 시 true / 취소 클릭 시 false
    //      window는 생략 가능
    
    if( !confirm("정말 탈퇴 하시겠습니까?") ){ //  취소를 누른 경우
        return false;
    }

    return true;
}


//예약 취소
function reservCancel(reservNo) {

    console.log("예약번호 : " + reservNo);
    console.log("예약취소(reservCancel) 함수 실행");

    var cf = window.confirm("정말 예약을 취소하시겠습니까?\n취소시 결제금액은 영업일 기준 2~3일내에 자동 환불 됩니다.");

    if(cf) {

        $.ajax({
            url: "reservationState", 
            type: "POST",
            data: {"reservNo" : reservNo},
        
            success: function(result) {
               
                if(result > 0) {
                    console.log("예약정보 전송완료");
                    alert("예약이 취소되었습니다.");
                    location.reload();
                }else {
                    console.log("예약정보 전송실패");
                    alert("예약 취소에 실패하였습니다.");
                }
            },
            error: function() {
                console.log("예약취소 ajax 에러발생");
            }
        });
        
        
    } else {
        console.log("예약취소 기능 취소");
    }
                            
}

// 내 게시글 조회 페이지네이션
var currentPage = 1;
var itemsPerPage = 10;
var myBoardList = document.getElementById("myBoardList");

if(document.getElementsByClassName("list-table")) {

    function displayItems(page) {
        var startIndex = (page - 1) * itemsPerPage;
        var endIndex = startIndex + itemsPerPage;
        // var filteredItems = ; // -> boardList

        //console.log(boardList);
        var bList = JSON.parse(boardList);
        console.log("parse " + bList);
        
        var totalPages = Math.ceil(bList.length / itemsPerPage);
        var paginatedItems = bList.slice(startIndex, endIndex);

        myBoardList.innerHTML = "";

        if(paginatedItems.length == 0) {
            paginatedItems.innerHTML = 
            "<tr>" +
            "<th colspan='5'>게시글이 존재하지 않습니다.</th>" +
            "</tr>";
        } else {
            paginatedItems.forEach(item => {
                console.log(item);
                
                if(item.thumbnail != null) {
                    var htmlCode =
                        // '<tbody>' + 
                            '<tr>' +
                                '<td>' + item.boardNo +'</td>' +
                                '<td>'+
                                    "<img class='list-thumbnail' src='" + contextPath + item.thumbnail + "'>" + 
                                    // http://localhost:8080/camp/board/detail/3/561?cp=1
                                    "<a href='http://localhost:8080/camp/board/detail/" + item.boardCode + "/" + item.boardNo + "?cp=" + currentPage + "'>" + item.boardTitle + "</a>" +                                                             
                                '</td>' + 
                                '<td>' + item.memberNickname + '</td>' + 
                                '<td>' + item.createDate + '</td>' + 
                                '<td>' + item.readCount + '</td>' + 
                            '</tr>';
                        // '</tbody>';
        
                    myBoardList.innerHTML += htmlCode;
                } else {
                    var htmlCode =
                        // '<tbody>' + 
                            '<tr>' +
                                '<td>' + item.boardNo +'</td>' +
                                '<td>'+
                                    // http://localhost:8080/camp/board/detail/3/561?cp=1
                                    "<a href='http://localhost:8080/camp/board/detail/" + item.boardCode + "/" + item.boardNo + "?cp=" + currentPage + "'>" + item.boardTitle + "</a>" +                                                             
                                '</td>' + 
                                '<td>' + item.memberNickname + '</td>' + 
                                '<td>' + item.createDate + '</td>' + 
                                '<td>' + item.readCount + '</td>' + 
                            '</tr>';
                        // '</tbody>';
        
                    myBoardList.innerHTML += htmlCode;
                }
    
            }); 
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
    }
    
    displayItems(currentPage);

}


   
// 리뷰 목록 조회(AJAX)
if(document.getElementById("reply-list")) {

    function selectMyReplyList() {
    
        $.ajax({
            url : contextPath + "/member/myPage/selectMyReview",
            type : "GET",
            dataType : "JSON",
            success : function(rList){
                // rList : 반환 받은 리뷰 목록 
    
                // 화면에 출력되어 있는 리뷰 목록 삭제
                const replyList = document.getElementById("reply-list"); // ul태그
                if ( replyList) { 
                replyList.innerHTML = "";
                }
                // rList에 저장된 요소를 하나씩 접근
                for(let reply of rList){
    
                    // 행
                    const replyRow = document.createElement("li");
                    replyRow.classList.add("reply-row");
                    replyRow.classList.add("mypage-reply-row");
                    
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
    
                    const reviewListStar = document.createElement("span");
        
                    // for(let i=0; i<star.length; i++) {
                    //     star[i].style.color = "transparent";
                    //     star[i].style.textShadow = "0 0 0 #f0f0f0";
                    // }
    
                    if(reply.campRate == 1) {
                        reviewListStar.innerHTML = "<span class='rate-in'>★</span>" +
                        "<span class='rate-out'>★★★★</span>";
                    } else if(reply.campRate == 2) {
                        reviewListStar.innerHTML = "<span class='rate-in'>★★</span>" +
                        "<span class='rate-out'>★★★</span>";
                    } else if(reply.campRate == 3) {
                        reviewListStar.innerHTML = "<span class='rate-in'>★★★</span>" +
                        "<span class='rate-out'>★★</span>";
                    } else if(reply.campRate == 4) {
                        reviewListStar.innerHTML = "<span class='rate-in'>★★★★</span>" +
                        "<span class='rate-out'>★</span>";
                    } else if(reply.campRate == 5) {
                        reviewListStar.innerHTML = "<span class='rate-in'>★★★★★</span>";
                    }
                    
    
                    // 작성자 영역(p)에 프로필,닉네임,작성일 마지막 자식으로(append) 추가
                    replyWriter.append(profileImage , memberNickname , replyDate, reviewListStar);
    
                    
    
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
                        if( loginMemberNo == reply.memberNo ){
    
                            // 수정 버튼
                            const updateBtn = document.createElement("button");
                            updateBtn.innerText = "수정";
        
                            // 수정 버튼에 onclick 이벤트 속성 추가
                            updateBtn.setAttribute("onclick", "showUpdateReply("+reply.replyNo+", this)");                        
        
                            // 삭제 버튼
                            const deleteBtn = document.createElement("button");
                            deleteBtn.innerText = "삭제";
                            // 삭제 버튼에 onclick 이벤트 속성 추가
                            deleteBtn.setAttribute("onclick", "deleteReply("+reply.replyNo+")");                       
        
                            // 버튼 영역 마지막 자식으로 수정/삭제 버튼 추가
                            replyBtnArea.append(updateBtn, deleteBtn);
    
                        } // if 끝
                        
                        // 행에 버튼영역 추가
                        replyRow.append(replyBtnArea); 
                    }
    
                    // 리뷰 목록(ul)에 행(li)추가
                    replyList.append(replyRow);
                    
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


