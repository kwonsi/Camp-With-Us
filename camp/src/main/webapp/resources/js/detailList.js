
var addr = document.getElementById("addr");              // 주소
var tel = document.getElementById("tel");               // 문의처 (전화번호)
var lctCl = document.getElementById("lctCl");           // 캠핑장환경
var induty = document.getElementById("induty");         // 캠핑장유형
var operPdCl = document.getElementById("operPdCl");     // 운영시간
var openDeCl = document.getElementById("openDeCl");     // 운영일
var resveCl = document.getElementById("resveCl");       // 예약방법
var posblFcltyCl = document.getElementById("posblFcltyCl");    // 주변이용가능시설
var imgB = document.getElementById("img_b");
var intro = document.getElementById("intro");  // intro div 

// 맵에 씌울 용도
var mapX;
var mapY;
var facltNmMap;
var homePageMap;
var indutyMap;
var addrMap;
var firstImageUrlMap ;

let contentId;    //  캠프 이미지 뽑아오기위한 contentId .

window.onload = function () {

      ///////////////  캠핑장 정보 ajax 
    $.ajax({
        url: "https://apis.data.go.kr/B551011/GoCamping/basedList",
        data: {
            numOfRows: 4000,
            pageNo: 1,
            MobileOS: "ETC",
            MobileApp: "AppTest",
            serviceKey: "4k7REi0gs6TKyjakIRV6zHIg3a1NcXwJPRTezijLCYvx0leNrqvtRwayHuc1AslN9pksU9rGRorGGOTZwMEu9Q==",
            _type: "json"
        },
        dataType: "json",

        success: function (result) {
            console.log("캠핑장정보 호출 성공");
            console.log("캠핑장정보:: "+result);

            var items = result.response.body.items.item;

            for (let i = 0; i < items.length; i++) {
                if (campName == items[i].facltNm.replaceAll(" ", "")) {

                    addr.innerText = items[i].addr1;
                    tel.innerText = items[i].tel;
                    lctCl.innerText = items[i].lctCl;
                    induty.innerText = items[i].induty;
                    operPdCl.innerText = items[i].operPdCl;
                    openDeCl.innerText = items[i].openDeCl;
                    resveCl.innerText = items[i].resveCl;
                    posblFcltyCl.innerText = items[i].posblFcltyCl;
                    imgB.innerHTML = '<img src="' +  items[i].firstImageUrl + '" alt="대표이미지"  />';
                    intro.innerText=items[i].intro;

                    // 이미지가져올 contentId
                    contentId = items[i].contentId;
                    localStorage.setItem('contentId', contentId);

                    // 카카오맵 변수선언 
                    mapX = items[i].mapX;
                    mapY = items[i].mapY;
                    facltNmMap = items[i].facltNm;
                    homePageMap = items[i].homePage;
                    firstImageUrlMap = items[i].firstImageUrl;
                    indutyMap = items[i].induty;
                    addrMap = items[i].addr1;
                }
            }

            if (openDeCl.value == null ){   // 
                openDeCl.innerText="";
            }
             /// 카카오 맵 
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
                facltNmMap +
                '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
                '        </div>' +
                '        <div class="body">' +
                '            <div class="img">' +
                '                <img src=' + firstImageUrlMap + ' width="73" height="70">' +
                '           </div>' +
                '            <div class="desc">' +
                '                <div class="ellipsis">' + addrMap + '</div>' +
                '                <div class="jibun ellipsis">' + indutyMap + '</div>' +
                '                <div><a href=' + homePageMap + ' target="_blank" class="link">홈페이지</a></div>' +
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

    ///////////////  이미지 목록 리스트 ajax

    var contentIdImage = localStorage.getItem("contentId");
    var boxphoto = document.getElementById("box_photo");   // 이미지 컨테이너
    console.log(contentIdImage);

    $.ajax({
        url: "https://apis.data.go.kr/B551011/GoCamping/imageList",
        data: {
            numOfRows: 3000,
            pageNo: 1,
            MobileOS: "ETC",
            MobileApp: "AppTest",
            serviceKey: "4k7REi0gs6TKyjakIRV6zHIg3a1NcXwJPRTezijLCYvx0leNrqvtRwayHuc1AslN9pksU9rGRorGGOTZwMEu9Q==",
            _type: "json",
            contentId : contentIdImage
        },
        dataType: "json",

        success: function (result) {
            console.log("캠핑장이미지 호출 성공");
            console.log("캠핑장이미지 :: "+result);

            var items = result.response.body.items.item;
            for (let i =0 ; i< items.length ; i++){
                boxphoto.innerHTML +=
                "<div class='box_photo3'>" + 
                "<img class='imageSize' src="+items[i].imageUrl +">"
                + "</div>";
 
            }
            
        },
        error: function (error) {
            console.log("API 호출 실패");
            console.log(error);
        }
    });
};

// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay() {
    overlay.setMap(null);
}









