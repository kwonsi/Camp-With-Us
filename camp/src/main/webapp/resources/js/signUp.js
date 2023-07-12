const error = document.querySelector(".error");
const confirm = document.querySelector(".confirm");


// 유효성 검사 여부를 기록할 객체 생성
const checkObj = { 
    "memberEmail"     : false,
    "memberPw"        : false,
    "memberPwConfirm" : false,
    "memberNickname"  : false,
    "memberTel"       : false,
    "sendEmail"       : false   // 인증번호 발송 체크
};



// 전화번호 유효성 검사
const memberTel = document.getElementById("memberTel");
const telMessage = document.getElementById("telMessage");

// ** input 이벤트 **
// -> 입력과 관련된 모든 동작(key관련, mouse관련, 붙여넣기)
memberTel.addEventListener("input", function(){

    // 입력이 되지 않은 경우
    if(memberTel.value.length == 0){
        telMessage.innerText = "전화번호를 입력해주세요.(- 제외)";

        //telMessage.classList.remove("confirm");
        //telMessage.classList.remove("error");
        telMessage.classList.remove("confirm", "error","is-valid", "is-invalid" );

        checkObj.memberTel = false; // 유효하지 않은 상태임을 기록

        return;
    }

    // 전화번호 정규식
    const regExp = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;

    if(regExp.test(memberTel.value)){ // 유효한 경우
        telMessage.innerText = "유효한 전화번호 형식입니다.";
        telMessage.classList.add("confirm");
        telMessage.classList.remove("error");
        memberTel.classList.add("is-valid");
        memberTel.classList.remove("is-invalid");

        checkObj.memberTel = true; // 유효한 상태임을 기록
        
    } else{ // 유효하지 않은 경우
        telMessage.innerText = "전화번호 형식이 올바르지 않습니다.";
        telMessage.classList.add("error");
        telMessage.classList.remove("confirm");
        memberTel.classList.add("is-invalid");
        memberTel.classList.remove("is-valid");
        checkObj.memberTel = false; // 유효하지 않은 상태임을 기록
    }
});


// 이메일 유효성 검사
const memberEmail = document.getElementById("memberEmail");
const emailMessage = document.querySelector("#emailMessage");

memberEmail.addEventListener("input", function(){

    // 입력이 되지 않은 경우
    if( memberEmail.value.length == 0 ){
        emailMessage.innerText = "메일을 받을 수 있는 이메일을 입력해주세요.";
        emailMessage.classList.remove("confirm", "error", "is-valid", "is-invalid");

        checkObj.memberEmail = false; // 유효 X 기록
        return;
    }

    // 입력된 경우
    const regExp = /^[\w\-\_]{4,}@[\w\-\_]+(\.\w+){1,3}$/;

    if( regExp.test(memberEmail.value) ){ // 유효한 경우
        
        // ****** 이메일 중복 검사(ajax) 진행 예정 ******

        //  $.ajax( {k:v , k:v} );  // jQuery ajax 기본형태

        // memberEmail.value  == 입력된 이메일

        $.ajax({
            url : "emailDupCheck",   
            //  필수 속성 url
            // 현재 주소 : /community/member/signUp
            // 상대 경로 : /community/member/emailDupCheck

            data : { "memberEmail" : memberEmail.value },
            // data속성 : 비동기 통신 시 서버로 전달할 값을 작성(JS 객체 형식)
            // -> 비동기 통신 시 input에 입력된 값을
            //   "memberEmail" 이라는 key 값(파라미터)으로 전달
            type : "GET", // 데이터 전달 방식 type

            success : function(result){
                // 비동기 통신(ajax)가 오류 없이 요청/응답 성공한 경우
                
                // 매개변수 result : servlet에서 출력된 result 값이 담겨있음
                // console.log(result);

                if(result == 1){ // 중복 O
                    emailMessage.innerText = "이미 사용중인 이메일 입니다.";
                    emailMessage.classList.add("error");
                    emailMessage.classList.remove("confirm");
                    memberEmail.classList.add("is-invalid");
                    memberEmail.classList.remove("is-valid");
                    checkObj.memberEmail = false; // 유효 X 기록

                } else { // 중복 X
                    emailMessage.innerText = "사용 가능한 이메일 입니다.";
                    emailMessage.classList.add("confirm");
                    emailMessage.classList.remove("error");
                    
                    memberEmail.classList.add("is-valid");
                    memberEmail.classList.remove("is-invalid");
                    checkObj.memberEmail = true; // 유효 O 기록
                }
            },
            
            error : function(req, status, error){
                console.log(req.responseText);
            }
        });
        


    }else{
        emailMessage.innerText = "이메일 형식이 유효하지 않습니다.";
        emailMessage.classList.add("error");
        emailMessage.classList.remove("confirm");
        memberEmail.classList.add("is-invalid");
        memberEmail.classList.remove("is-valid");
        checkObj.memberEmail = false; // 유효 X 기록
    }

});


// 닉네임 유효성 검사
const memberNickname = document.getElementById("memberNickname");
const nicknameMessage = document.getElementById("nicknameMessage");

memberNickname.addEventListener("input", function(){

    // 입력되지 않은 경우
    if(memberNickname.value.length == 0){
        nicknameMessage.innerText = "영어/숫자/한글 2~10글자 사이로 작성해주세요.";
        nicknameMessage.classList.remove("confirm", "error", "is-valid", "is-invalid");

        checkObj.memberNickname = false; // 유효 X 기록
        return;
    }

    const regExp = /^[a-zA-Z0-9가-힣]{2,10}$/;

    if( regExp.test(memberNickname.value) ){ // 유효한 경우
        

        // ****** 닉네임 중복 검사(ajax) 진행 예정 ******

        //     /community/member/nicknameDupCheck
        $.ajax({
            url : "nicknameDupCheck",  // 필수 작성 속성
            data : { "memberNickname" : memberNickname.value }, // 서버로 전달할 값(파라미터)
            type : "GET", // 데이터 전달 방식(기본값 GET)

            success : function(res){ // 비동기 통신 성공 시(에러 발생 X)

                // 매개변수 res : Servlet에서 응답으로 출력된 데이터가 저장

                if(res == 0){ // 닉네임 중복 X
                    nicknameMessage.innerText = "사용 가능한 닉네임 입니다.";
                    nicknameMessage.classList.add("confirm");
                    nicknameMessage.classList.remove("error");
                    memberNickname.classList.add("is-valid");
                    memberNickname.classList.remove("is-invalid");
                    checkObj.memberNickname = true; // 유효 O 기록

                } else { // 닉네임 중복 O
                    nicknameMessage.innerText = "이미 사용중인 닉네임 입니다.";
                    nicknameMessage.classList.add("error");
                    nicknameMessage.classList.remove("confirm");
                    memberNickname.classList.add("is-invalid");
                    memberNickname.classList.remove("is-valid");
                    checkObj.memberNickname = false; // 유효 O 기록
                }
            },

            error : function(){ // 비동기 통신 중 에러가 발생한 경우
                console.log("에러 발생");
            }
        });



    }else{
        nicknameMessage.innerText = "닉네임 형식이 유효하지 않습니다.";
        nicknameMessage.classList.add("error");
        nicknameMessage.classList.remove("confirm");
        memberNickname.classList.add("is-invalid");
        memberNickname.classList.remove("is-valid");
        checkObj.memberNickname = false; // 유효 X 기록
    }

});



// 비밀번호 유효성 검사
const memberPw = document.getElementById("memberPw");
const memberPwConfirm = document.getElementById("memberPwConfirm");
const pwMessage = document.getElementById("pwMessage");
const regExp = /^[\w!@#_-]{6,30}$/;

memberPw.addEventListener("keyup", function() {

    //아무것도 입력하지 않았을 경우
    if(memberPw.value.length == 0){
        pwMessage.innerText = "영어, 숫자, 특수문자(!,@,#,-,_) 6~30글자 사이로 작성해주세요.";
        pwMessage.classList.remove("confirm", "error", "is-valid", "is-invalid");
        checkObj.memberPw = false;
        return;
    }

    //
    if(regExp.test(memberPw.value)){ // 비밀번호 유효
        pwMessage.innerText = "유효한 비밀번호 형식입니다.";
        pwMessage.classList.add("confirm");
        pwMessage.classList.remove("error");
        memberPw.classList.add("is-valid");
        memberPw.classList.remove("is-invalid");

        checkObj.memberPw = true; 
    } else { // 틀린 경우
        pwMessage.innerText = "비밀번호 형식이 유효하지 않습니다.";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");
        memberPw.classList.add("is-invalid");
        memberPw.classList.remove("is-valid");
        checkObj.memberPw = false;
    }

    checkPw();
});


// 비밀번호 확인 유효성 검사
memberPwConfirm.addEventListener("keyup", function() {

    //아무것도 입력하지 않았을 경우
    if(memberPwConfirm.value.length == 0){
        pwMessage.innerText = "영어, 숫자, 특수문자(!,@,#,-,_) 6~30글자 사이로 작성해주세요.";
        pwMessage.classList.remove("confirm", "error", "is-valid", "is-invalid");
        checkObj.memberPwConfirm = false;
        return;
    }

    if(regExp.test(memberPwConfirm.value) && (memberPw.value == memberPwConfirm.value) ){ // 비밀번호 확인 유효
        memberPwConfirm.classList.add("is-valid");
        memberPwConfirm.classList.remove("is-invalid");

    } else { // 틀린 경우
        memberPwConfirm.classList.add("is-invalid");
        memberPwConfirm.classList.remove("is-valid");
        checkObj.memberPwConfirm = false;
    }

    checkPw();
});
// -> 이벤트가 발생 되었을 때 정의된 함수를 호출하겠다


function checkPw(){ // 비밀번호 일치 검사
    // 비밀번호 / 비밀번호 확인이 같을 경우
    if(memberPw.value == memberPwConfirm.value){
        pwMessage.innerText = "비밀번호가 일치합니다.";
        pwMessage.classList.add("confirm");
        pwMessage.classList.remove("error");

        checkObj.memberPwConfirm = true; // 유효 O 기록
    } else {
        pwMessage.innerText = "비밀번호가 일치하지 않습니다.";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");
        checkObj.memberPwConfirm = false;
    }
};



// 인증번호 보내기
const sendBtn = document.getElementById("sendBtn");
const cMessage = document.getElementById("cMessage");
var sendNumber = 0;
// 타이머에 사용될 변수
let checkInterval; // setInterval을 저장할 변수
let min = 4;
let sec = 59;

sendBtn.addEventListener("click", function(){

    if( checkObj.memberEmail ){ // 유효한 이메일이 작성되어 있을 경우에만 메일 보내기

        $.ajax({
            url : "sendEmail"  ,
            data : { "inputEmail" : memberEmail.value },
            type : "GET",
            success : function(result){

                alert("인증번호가 발송되었습니다. 이메일을 확인해주세요.");

                console.log("이메일 발송 성공");
                console.log(result);
                sendNumber = result;
                localStorage.setItem("sendNumber", sendNumber);
                // 인증 버튼이 클릭되어 정상적으로 메일이 보내졌음을 checkObj에 기록
                checkObj.sendEmail = true;

                cMessage.innerText = "인증번호 유효시간: " + "5:00"; // 초기값 5분
                min = 5;
                sec = 0; // 분, 초 초기화

                cMessage.classList.remove("confirm");
                cMessage.classList.remove("error");

                // 변수에 저장해야지 멈출 수 있음
                checkInterval = setInterval(function(){
                    

                    if(Number(sec) === 0){
                        min--;
                        sec = 59;
                    } else{
                        sec--;
                    }

                    if(min === -1){ // 만료
                        min = 0;
                        sec = 0;
                        cMessage.classList.add("error");
                        cMessage.classList.remove("confirm");
                        cNumber.classList.add("is-invalid");
                        cNumber.classList.remove("is-valid");
                        cMessage.innerText = "인증번호가 만료되었습니다.";
                        clearInterval(checkInterval); // checkInterval 반복을 지움
                    }

                    if(sec < 10) {
                        cMessage.innerText ="인증번호 유효시간: " + min + ":0" + sec;
                    } else {
                        cMessage.innerText ="인증번호 유효시간: " + min + ":" + sec;
                    }
                    
                }, 1000); // 1초 지연 후 수행

                
                
            },
            error : function(){
                console.log("이메일 발송 실패")
            }
        });


        // Mail 발송 Ajax 코드는 동작이 느림....
        // -> 메일은 메일대로 보내고, 타이머는 버튼이 클릭 되자 마자 바로 실행
        // --> ajax 코드가 비동기이기 때문에 메일이 보내지는 것을 기다리지 않고
        //      바로 다음 코드가 수행된다!!

        // 5분 타이머
        // setInerval(함수, 지연시간) : 지연시간이 지난 후 함수를 수행 (반복)

        
    }else {
        alert("아이디(이메일)을 먼저 입력해 주세요");
    }
});


const cNumber = document.getElementById("cNumber");
const cBtn = document.getElementById("cBtn");
cBtn.addEventListener("click", function(){

    // 1. 인증번호 받기 버튼이 클릭되어 이메일 발송되었는지 확인
    if(checkObj.sendEmail){

        // 2. 입력된 인증번호가 6자리가 맞는지 확인
        if( cNumber.value.length == 6 ){ // 6자리 맞음

                

                if(cNumber.value == sendNumber && (min + sec)>0) { 
                    console.log("인증완료");
                    clearInterval(checkInterval); // 타이머 멈춤

                    cMessage.innerText = "인증이 완료되었습니다.";
                    cMessage.classList.add("confirm");
                    cMessage.classList.remove("error");
                    cNumber.classList.add("is-valid");
                    cNumber.classList.remove("is-invalid");

                } else if(min === 0 && sec === 0){ // 만료
                    alert("만료된 인증 번호 입니다.");
                    cMessage.classList.add("error");
                    cMessage.classList.remove("confirm");
                    cNumber.classList.add("is-invalid");
                    cNumber.classList.remove("is-valid"); 
                } else{ 
                    alert("인증 번호가 일치하지 않습니다.");
                    cMessage.classList.remove("confirm, error");
                    cNumber.classList.add("is-invalid");
                    cNumber.classList.remove("is-valid");        
                }
                    
        } else { // 6자리 아님 / if( cNumber.value.length == 6 )
            alert("인증번호가 일치하지 않습니다.");
            cMessage.innerText = "인증 번호가 일치하지 않습니다.";
            cMessage.classList.add("error");
            cMessage.classList.remove("confirm");
            cNumber.classList.add("is-invalid");
            cNumber.classList.remove("is-valid");
            cNumber.focus();
        }

    } else{ // 인증번호를 안받은 경우 / if(checkObj.sendEmail)
        alert("인증번호 먼저 받아 주세요.");
        cMessage.classList.add("error");
        cMessage.classList.remove("confirm");
      
    }

});



function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
           

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;

        }
    }).open();
}



// 회원가입 버튼 클릭 시 유효성 검사가 완료 되었는지 확인하는 함수
function signUpValidate(){

    // checkObj에 있는 모든 속성을 반복 접근하여
    // false가 하나라도 있는 경우에는 form태그 기본 이벤트 제거

    let str = "";

    for( let key  in checkObj ){ // 객체용 향상된 for문

        // 현재 접근 중인 key의 value가 false인 경우
        if( !checkObj[key] ){ 

            switch(key){
            case "memberEmail":     str="이메일이"; break;
            case "memberPw":        str="비밀번호가"; break;    
            case "memberPwConfirm": str="비밀번호 확인이"; break;
            case "memberNickname":  str="닉네임이"; break;
            case "memberTel":       str="전화번호가"; break;
            }

            str += " 유효하지 않습니다.";

            alert(str);

            document.getElementById(key).focus();
            
            return false; // form태그 기본 이벤트 제거
        }
    }

    return true; // form태그 기본 이벤트 수행

}



    

//회원가입 약관동의 체크 여부 확인
function signUpCheck() {

    var checkCount = 0;
    const signUpCheckBox = document.getElementsByClassName("signUpCheckBox");
    
    for(let i=0; i<signUpCheckBox.length; i++) {
        if(signUpCheckBox[i].checked == true) {
            checkCount++;
        }
    }

    console.log(checkCount);

    if(checkCount == 3) return true;
    else {
        alert("모든 약관에 동의해주세요.");
        return false;
    }
}
