const memberEmail = document.getElementById("memberEmail");
const memberTel = document.getElementById("memberTel");
const memberPw = document.getElementById("memberPw");

// 전화번호 정규식
const regExpTel = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;

// 입력된 경우
const regExpEmail = /^[\w\-\_]{4,}@[\w\-\_]+(\.\w+){1,3}$/;

// 아이디 찾기
function findIdValidate() {

    if(memberTel.value.length == 0){
        alert("전화번호를 입력해주세요.");

        return false;
    }

    if(!regExpTel.test(memberTel.value)){ // 유효한 경우
        alert("유효하지 않은 전화번호 형식입니다.");
        return false;
    }

}

// 비밀번호 찾기
function findPwValidate() {

    if( memberEmail.value.length == 0 ){
        alert("아이디(이메일)을 입력해주세요.");
        return false;
    }

    if(memberTel.value.length == 0){
        alert("전화번호를 입력해주세요.");

        return false;
    }

    if(!regExpTel.test(memberTel.value)){ // 유효한 경우
        alert("유효하지 않은 전화번호 형식입니다.");
        return false;
    }

    if(!regExpEmail.test(memberEmail.value)){ // 유효한 경우
        alert("유효하지 않은 아이디(이메일) 형식입니다.");
        return false;
    }

    $.ajax({
        url: "findPw",
        type: "POST",
        data: { "memberEmail" : memberEmail.value },
        success: function(result) {
            console.log(result);
        },
        error: function(result) {
            console.log("비밀번호 찾기 ajax 실패");
        }
    });

}


// 아이디 찾기 버튼 클릭 시 이벤트 처리
const findIdButton = document.querySelector('.selectId');
const idContent = document.querySelector('.idLeft');
const pwContent = document.querySelector('.pwLeft');

findIdButton.addEventListener('click', () => {
  idContent.classList.add('slideInRight');
  pwContent.classList.add('slideOutLeft');
});

// 비밀번호 찾기 버튼 클릭 시 이벤트 처리
const findPwButton = document.querySelector('.selectPw');

findPwButton.addEventListener('click', () => {
  pwContent.classList.add('slideInRight');
  idContent.classList.add('slideOutLeft');
});