





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

var mapX;
var mapY;
var facltNm;
var homePage;

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

                    mapX = items[i].mapX;
                    mapY = items[i].mapY;
                    facltNm = items[i].facltNm;
                    homePage = items[i].homePage;
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




            var mapContainer = document.getElementById('map'), // 지도의 중심좌표
                mapOption = {
                    center: new kakao.maps.LatLng(mapY, mapX), // 지도의 중심좌표
                    level: 3                                    // 지도의 확대 레벨
                };

            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

            var marker = new kakao.maps.Marker({                // 지도에 마커를 표시합니다 
                map: map,
                position: new kakao.maps.LatLng(mapY, mapX)
            });

            // 커스텀 오버레이에 표시할 컨텐츠 입니다 
            var content = '<div class="wrap">' +
                '    <div class="info">' +
                '        <div class="title">' +
                facltNm +
                '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
                '        </div>' +
                '        <div class="body">' +
                '            <div class="img">' +
                '                <img src=' + firstImageUrl1 + ' width="73" height="70">' +
                '           </div>' +
                '            <div class="desc">' +
                '                <div class="ellipsis">' + addr1 + '</div>' +
                '                <div class="jibun ellipsis">' + induty1 + '</div>' +
                '                <div><a href=' + homePage + ' target="_blank" class="link">홈페이지</a></div>' +
                '            </div>' +
                '        </div>' +
                '    </div>' +
                '</div>';

            // 마커 위에 커스텀오버레이를 표시합니다
            // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
            var overlay = new kakao.maps.CustomOverlay({
                content: content,
                map: map,
                position: marker.getPosition()
            });

            // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
            kakao.maps.event.addListener(marker, 'click', function () {
                overlay.setMap(map);
            });


        },
        error: function (error) {
            console.log("API 호출 실패");
            console.log(error);
        }
    });
};

console.log(mapY);



// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay() {
    overlay.setMap(null);
}