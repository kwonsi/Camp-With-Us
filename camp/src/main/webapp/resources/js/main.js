//const selLoc = document.getElementById("selLoc");
const login = document.getElementById("login");
const myPage = document.getElementById("myPage");
const searchOption = document.getElementsByClassName("searchOption");



// 지역 선택 팝업창
function selectLoc() {
    const options = "width=480, height=600, top=50, left=400";

    window.open("selectLoc", "지역 선택", options);
}

// 테마 선택 팝업창
function selectTheme() {
    const options = "width=480, height=600, top=50, left=400";

    window.open("selectTheme", "테마 선택", options);
}

// 검색 버튼 클릭 시 캠프 리스트 페이지 이동
function searchCamp() {

    location.href = "/camp/campList/?loc=" + searchOption[0].innerHTML + "&theme=" + searchOption[1].innerHTML;
    // location.href="camp/campList";
}


if (login) {
    login.addEventListener("click", function () {
        location.href = "/login";
    });
}



window.onload = function () {

    $.ajax({
        url: "https://apis.data.go.kr/B551011/GoCamping/basedList",
        data: {
            numOfRows: 3467,
            pageNo: 1,
            MobileOS: "ETC",
            MobileApp: "AppTest",
            serviceKey: "4k7REi0gs6TKyjakIRV6zHIg3a1NcXwJPRTezijLCYvx0leNrqvtRwayHuc1AslN9pksU9rGRorGGOTZwMEu9Q==",
            _type: "json"
        },
        dataType: "json",

        success: function (result) {
            console.log("API 호출 성공");
            console.log(result);

            var items = result.response.body.items.item;

            var randomIndexes = [];
            var randomItems = [];

            // 랜덤한 인덱스 선택
            for (let i = 0; i < items.length; i++) {
                if (items[i].homepage != null &&
                    items[i].firstImageUrl != "" &&
                    items[i].tel != "" &&
                    items[i].lineIntro != "" &&
                    items[i].addr1 != "") {

                    randomIndexes.push(i); // 조건문을 통과한 인덱스 저장
                }
            }

            // 랜덤하게 선택된 인덱스를 섞습니다.
            for (let i = randomIndexes.length - 1; i > 0; i--) {
                const j = Math.floor(Math.random() * (i + 1));
                [randomIndexes[i], randomIndexes[j]] = [randomIndexes[j], randomIndexes[i]];
            }

            // 랜덤하게 선택된 인덱스에 해당하는 항목을 선택합니다.
            for (let i = 0; i < Math.min(randomIndexes.length, 18); i++) {
                const index = randomIndexes[i];
                randomItems.push(items[index]);
            }

            // 랜덤하게 선택된 항목에 대해 InnerHtml 값을 할당합니다.
            for (let i = 0; i < randomItems.length++; i) {
                const randomItem = randomItems[i];
                const ranBoardImg = 'ranBoardImg' + (i + 1);
                const ranBoardContent = 'ranBoardContent' + (i + 1);
                const randomImageElement = document.getElementById(ranBoardImg);
                const randomContentElement = document.getElementById(ranBoardContent)
                if (randomImageElement) {
                    randomImageElement.innerHTML = 
                    '<a href="/camp/campList/detailList?campName='+randomItem.facltNm.replaceAll(" ","")+'&viewType=1">'+
                    '<img src=' + randomItem.firstImageUrl + ' alt="이미지가 존재하지 않습니다." '+
                    ' id="' + ranBoardImg + '"></a>';

                    randomContentElement.innerHTML =
            '<div class="cont_tb1">'+
            '     <table class="table">'+
            '       <colgroup>'+
            '           <col style="width: 25%;" />'+
            '           <col style="width: 75%;" />'+
            '       </colgroup>'+
            '       <tbody>'+
            '           <tr>'+
            '               <th scope="col">캠핑장 이름</th>'+
            '               <td>'+ randomItem.facltNm +'</td>'+
            '           </tr>'+
            '           <tr class="camp_call_pcVer">'+
            '               <th scope="col">주소</th>'+
            '               <td>'+randomItem.addr1 +'</td>'+
            '           </tr>'+
            '           <tr>'+
            '               <th scope="col">연락처</th>'+
            '               <td>'+randomItem.tel +'</td>'+
            '           </tr>'+
            '           <tr>'+
            '               <th scope="col">캠핑장 유형</th>'+
            '               <td>'+randomItem.induty+'</td>'+
            '           </tr>'+
            '       </tbody>'+
            '   </table>'+
            '</div>';

                }
            }

        },
        error: function (error) {
            console.log("API 호출 실패");
            console.log(error);
        }
    });
};






const sliderWrap = document.querySelector(".slider__wrap");
const sliderImg = document.querySelector(".slider__img"); // 보여지는 영역

//const sliderInner = document.querySelector("slider__inner");
const sliderInner = document.getElementsByClassName("slider__inner");
const slider = document.querySelectorAll(".slider"); // 개별적 이미지
const sliderDot = document.querySelector(".slider__dot"); // dot

let currentIndex = 0;  // 현재 이미지
let sliderCount = slider.length;  // 이미지 개수
let sliderWidth = sliderImg.offsetWidth;  // 이미지 가로값
let dotIndex = "";

function init(){
    // dot 만들어주기!
    slider.forEach(() => {dotIndex += "<a class='dot'>이미지1</a>"})
    sliderDot.innerHTML = dotIndex;
    // 첫번째 닷에 활성화 표시
    sliderDot.firstChild.classList.add("active");
}
init();

// 이미지 이동
function gotoSlider(num){

    for ( let i = 0 ; i < sliderInner.length ; i++ ) {

    sliderInner[i].style.transition = "all 400ms";
    sliderInner[i].style.transform = "translateX("+ -sliderWidth * num +"px)";
    currentIndex = num;

    }
    const dotActive = document.querySelectorAll(".slider__dot .dot");
    
    
    // 두번째 이미지 ==> 두번째 닷 클래스 추가
    // 1. 닷 메뉴의 클래스 모두 삭제
    dotActive.forEach(el => el.classList.remove("active"));
    // 2. 해당 이미지의 닷 메뉴 클래스 추가
    dotActive[num].classList.add("active");
}

// 버튼 클릭했을 때
document.querySelectorAll(".slider__btn a").forEach((btn, index) => {
    btn.addEventListener("click", () => {
        let prevIndex = (currentIndex + (sliderCount - 1)) % sliderCount;
        let nextIndex = (currentIndex + 1) % sliderCount;

        if(btn.classList.contains("prev")){
            gotoSlider(prevIndex);
        } else {
            gotoSlider(nextIndex);
        }
    })
})

// 닷 클릭했을 때 이미지 이동
document.querySelectorAll(".slider__dot .dot").forEach((dot, index) => {
    dot.addEventListener("click", () => {
        gotoSlider(index);
    })
})

