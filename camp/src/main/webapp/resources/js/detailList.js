
// 맵
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition = new kakao.maps.LatLng(33.450701, 126.570667);

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});
// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);













console.log(campName);

var addr = document.getElementById("addr");
var tel = document.getElementById("tel");
var lctCl = document.getElementById("lctCl");
var induty = document.getElementById("induty");
var operPdCl = document.getElementById("operPdCl");
var openDeCl = document.getElementById("openDeCl");
var resveCl = document.getElementById("resveCl");
var posblFcltyCl = document.getElementById("posblFcltyCl");
var imgB = document.getElementById("img_b");

var addr1;
var tel1;
var lctCl1;
var induty1;
var operPdCl1;
var openDeCl1;
var resveCl1;
var posblFcltyCl1;
var firstImageUrl1;

var contentId;    //  캠프 이미지 뽑아오기위한 contentId .

window.onload = function () {

    $.ajax({
        url: "https://apis.data.go.kr/B551011/GoCamping/basedList",
        data: {
            numOfRows: 3000,
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
            console.log(items.length);

            for (let i = 0; i < items.length; i++) {

                if (campName == items[i].facltNm.replaceAll(" ", "")) {

                    addr1 = items[i].addr1;
                    tel1 = items[i].tel;
                    lctCl1 = items[i].lctCl;
                    induty1 = items[i].induty;
                    operPdCl1 = items[i].operPdCl;
                    openDeCl1 = items[i].openDeCl;
                    resveCl1 = items[i].resveCl;
                    posblFcltyCl1 = items[i].posblFcltyCl;
                    firstImageUrl1 = items[i].firstImageUrl;
                    contentId = items[i].contentId;
                }
            }
            addr.innerText = addr1;
            tel.innerText = tel1;
            lctCl.innerText = lctCl1;
            induty.innerText = induty1;
            operPdCl.innerText = operPdCl1;
            openDeCl.innerText = openDeCl1;
            resveCl.innerText = resveCl1;
            posblFcltyCl.innerText = posblFcltyCl1;
            imgB.innerHTML = '<img src="' + firstImageUrl1 + '" alt="대표이미지"  />';

        },
        error: function (error) {
            console.log("API 호출 실패");
            console.log(error);
        }
    });
};









