const memberEmail = document.getElementById("memberEmail");
const memberPw = document.getElementById("memberPw");

function loginValidate() {

    if( memberEmail.value.length == 0 ){
        alert("아이디(이메일)을 입력해주세요.");
        return false;
    }

    if(memberPw.value.length == 0){
        alert("비밀번호를 입력해주세요.");

        return false;
    }

}
