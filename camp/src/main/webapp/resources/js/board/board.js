// // 상세조회, 게시글 작성 - 목록으로 버튼

// // 즉시 실행 함수
// (function(){
//     const goToListBtn = document.getElementById("goToListBtn");

//     if(goToListBtn != null){ // 목록으로 버튼이 화면에 있을 때만 이벤트 추가

//         goToListBtn.addEventListener("click", function(){

//             // location 객체(BOM)

//             const pathname = location.pathname; // 주소상에서 요청 경로 반환
//             //  /community/board/detail

//             // 문자열.substring(시작,끝) : 시작 이상 끝 미만 인덱스 까지 문자열 자르기

//             // 문자열.indexOf("검색 문자열", 시작 인덱스)
//             // : 문자열에서 "검색 문자열"의 위치(인덱스)를 찾아서 반환
//             //  단, 시작 인덱스 이후 부터 검색

//             // 이동할 주소 저장
//             let url = pathname.substring(0,  pathname.indexOf("/", 1)); // 
//             //   /community

//             url += "/board/list/"+boardCode+"?";  //   /board/list/1?cp=1


//             // URL 내장 객체 : 주소 관련 정보를 나타내는 객체
//             // location.href : 현재 페이지 주소 + 쿼리스트링
//             // URL.searchParams : 쿼리 스트링만 별도 객체로 반환

//             // http://localhost:8080/community/board/detail?no=249&cp=6&type=1&key=c&query=9
//             const params = new URL(location.href).searchParams;

//             let cp;

//             if(params.get("cp") != null){ // 쿼리스트링에 cp가 있을 경우
//                 cp =  "cp=" + params.get("cp");     
//             }else{
//                 cp = "cp=1";
//             }

//             // 조립
//             //   /commy/board/list/1?cp=1
//             url += cp;


//             // 검색 key, query가 존재하는 경우 url에 추가
//             if(params.get("key") != null){
//                 const key = "&key=" + params.get("key");
//                 const query = "&query=" + params.get("query");

//                 url += key + query; // url 뒤에 붙이기
//             }


//             // location.href = "주소";  -> 해당 주소로 이동
//             location.href = url; 

//         });
//     }

// })();



// // 즉시 실행 함수
// (function(){
//     const thumbnail = document.getElementsByClassName("list-thumbnail");

//     if(thumbnail.length > 0){ // 목록에 썸네일 이미지가 있을 경우에만 이벤트 추가
      
//         const modal = document.querySelector('.modal');
//         const modalImage = document.getElementById("modal-image");
//         const modalClose = document.getElementById("modal-close");

//         for(let th of thumbnail){
//             th.addEventListener("click", function(){
//                 modalImage.setAttribute("src", th.getAttribute("src") );
               
//                 /* on/off 스위치 */
//                 // classList.toggle("클래스명") : 클래스가 없으면 추가(add) 
//                 //                                클래스가 있으면 제거(remove)
                
//                 modal.classList.toggle('show'); // add
//             });
//         }

//         // X버튼
//         modalClose.addEventListener("click", function(){
            
//             modal.classList.toggle('hide'); // hide 클래스 추가

//             setTimeout(function(){ // 0.45초 후 동작
//                 modal.classList.toggle('hide'); // hide 클래스 제거

//                 modal.classList.toggle('show'); // remove
//             }, 450);
//         });


//     }

// })();


// // 즉시 실행 함수 : 성능up, 변수명 중복 X
// (function(){
//     const deleteBtn = document.getElementById("deleteBtn"); // 존재하지 않으면 null

//     if(deleteBtn != null){ // 버튼이 화면에 존재할 때
//         deleteBtn.addEventListener("click", function(){
//             // 현재 : /board/detail/{boardCode}/{boardNo}
//             // 목표 : /board/delete/{boardCode}/{boardNo}
      
//             let url = contextPath + "/board/delete/" + boardCode + "/" +  boardNo;
//             // 삭제 성공 -> 해당 게시판 목록 조회 1페이지로 리다이렉트
//             // 삭제 실패 -> 요청 이전 페이지(referer)로 리다이렉트

//             // UPDATE BOARD SET
//             // BOARD_ST = 'Y'
//             // WHERE BOARD_NO = #{boardNo}


//             if( confirm("정말로 삭제 하시겠습니까?") ){
//                 location.href = url; // get방식으로 url에 요청
//             }

//         });
//     }

// })();


// // 검색창에 이전 검색기록 반영하기
// (function(){
//     const select = document.getElementById("search-key");

//     // const option = select.children;
//     const option = document.querySelectorAll("#search-key > option");

//     const input = document.getElementById("search-query");

//     if(select != null){ // 검색창이 화면이 존재할 때에만 코드 적용

//         // 현재 주소에서 쿼리스트링(파라미터) 얻어오기
//         const params = new URL(location.href).searchParams;

//         // 얻어온 파라미터 중 key, query만 변수에 저장
//         const key = params.get("key");
//         const query = params.get("query");

//         // input에 query 값 대입
//         input.value = query;

//         // option을 반복 접근해서 value와 key가 같으면 selected 속성 추가
//         for(let op of option){
//             if(op.value == key ){
//                 op.selected = true;
//             }
//         }
//     }

// })();



// // 검색 유효성 검사(검색어를 입력 했는지 확인)
// function searchValidate(){

//     const query = document.getElementById("search-query");

//     if(query.value.trim().length == 0){ // 미작성
//         query.value = ""; // 빈칸
//         query.focus();

//         return false;
//     }

//     return true;
// }





/*
 * InstagramFeed 관련 js
 *
 * @version 1.4.0
 *
 * @author Javier Sanahuja Liebana <bannss1@gmail.com>
 * @contributor csanahuja <csanahuja@gmail.com>
 *
 * https://github.com/jsanahuja/InstagramFeed
 *
 */
(function(root, factory) {
    if (typeof define === "function" && define.amd) {
        define([], factory);
    } else if (typeof exports === "object") {
        module.exports = factory();
    } else {
        root.InstagramFeed = factory();
    }
}(this, function() {
    var defaults = {
        'host': "https://www.instagram.com/",
        // 'username': '',
        'tag': '캠핑',
        'container': document.getElementById("instafeed"),
        'display_profile': true,
        'display_biography': true,
        'display_gallery': true,
        'display_igtv': false,
        'callback': null,
        'styling': true,
        'items': 8,
        'items_per_row': 4,
        'margin': 0.5,
        'image_size': 640,
        'lazy_load': false,
        'on_error': console.error
    };

    var image_sizes = {
        "150": 0,
        "240": 1,
        "320": 2,
        "480": 3,
        "640": 4
    };

    var escape_map = {
        '&': '&amp;',
        '<': '&lt;',
        '>': '&gt;',
        '"': '&quot;',
        "'": '&#39;',
        '/': '&#x2F;',
        '`': '&#x60;',
        '=': '&#x3D;'
    };
    function escape_string(str){
        return str.replace(/[&<>"'`=\/]/g, function (char) {
            return escape_map[char];
        });
    }

    return function(opts) {
        this.options = Object.assign({}, defaults);
        this.options = Object.assign(this.options, opts);
        this.is_tag = this.options.username == "";

        this.valid = true;
        if (this.options.username == "" && this.options.tag == "") {
            this.options.on_error("InstagramFeed: Error, no username or tag defined.", 1);
            this.valid = false;
        }
        if (typeof this.options.get_data !== "undefined") {
            console.warn("InstagramFeed: options.get_data is deprecated, options.callback is always called if defined");
        }
        if (this.options.callback == null && this.options.container == "") {
            this.options.on_error("InstagramFeed: Error, neither container found nor callback defined.", 2);
            this.valid = false;
        }

        this.get = function(callback) {
            var url = this.is_tag ? this.options.host + "explore/tags/" + this.options.tag + "/" : this.options.host + this.options.username + "/",
                xhr = new XMLHttpRequest();

            var _this = this;
            xhr.onload = function(e) {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        try{
                            var data = xhr.responseText.split("window._sharedData = ")[1].split("<\/script>")[0];
                        }catch(error){
                            _this.options.on_error("InstagramFeed: It looks like the profile you are trying to fetch is age restricted. See https://github.com/jsanahuja/InstagramFeed/issues/26", 3);
                            return;
                        }
                        data = JSON.parse(data.substr(0, data.length - 1));
                        data = data.entry_data.ProfilePage || data.entry_data.TagPage;
                        if(typeof data === "undefined"){
                            _this.options.on_error("InstagramFeed: It looks like YOUR network has been temporary banned because of too many requests. See https://github.com/jsanahuja/jquery.instagramFeed/issues/25", 4);
                            return;
                        }
                        data = data[0].graphql.user || data[0].graphql.hashtag;
                        callback(data, _this);
                    } else {
                        _this.options.on_error("InstagramFeed: Unable to fetch the given user/tag. Instagram responded with the status code: " + xhr.statusText, 5);
                    }
                }
            };
            xhr.open("GET", url, true);
            xhr.send();
        };

        this.parse_caption = function(igobj, data) {
            if (
                typeof igobj.node.edge_media_to_caption.edges[0] !== "undefined" && 
                typeof igobj.node.edge_media_to_caption.edges[0].node !== "undefined" && 
                typeof igobj.node.edge_media_to_caption.edges[0].node.text !== "undefined" && 
                igobj.node.edge_media_to_caption.edges[0].node.text !== null
            ) {
                return igobj.node.edge_media_to_caption.edges[0].node.text;
            }

            if (
                typeof igobj.node.title !== "undefined" &&
                igobj.node.title !== null &&
                igobj.node.title.length != 0
            ) {
                return igobj.node.title;
            }

            if (
                typeof igobj.node.accessibility_caption !== "undefined" &&
                igobj.node.accessibility_caption !== null &&
                igobj.node.accessibility_caption.length != 0
            ) {
                return igobj.node.accessibility_caption;
            }
            return (this.is_tag ? data.name : data.username) + " image ";
        }

        this.display = function(data) {
            // Styling
            if (this.options.styling) {
                var width = (100 - this.options.margin * 2 * this.options.items_per_row) / this.options.items_per_row;
                var styles = {
                    'profile_container': " style='text-align:center;'",
                    'profile_image': " style='border-radius:10em;width:15%;max-width:125px;min-width:50px;'",
                    'profile_name': " style='font-size:1.2em;'",
                    'profile_biography': " style='font-size:1em;'",
                    'gallery_image': " style='margin:" + this.options.margin + "% " + this.options.margin + "%;width:" + width + "%;float:left;'"
                };
            } else {
                var styles = {
                    'profile_container': "",
                    'profile_image': "",
                    'profile_name': "",
                    'profile_biography': "",
                    'gallery_image': ""
                };
            }

            // Profile
            var html = "";
            if (this.options.display_profile) {
                html += "<div class='instagram_profile'" + styles.profile_container + ">";
                html += "<img class='instagram_profile_image'" + (this.options.lazy_load ? " loading='lazy'" : '')  + " src='" + data.profile_pic_url + "' alt='" + (this.is_tag ? data.name + " tag pic" : data.username + " profile pic") + " profile pic'" + styles.profile_image + " />";
                if (this.is_tag)
                    html += "<p class='instagram_tag'" + styles.profile_name + "><a href='https://www.instagram.com/explore/tags/" + this.options.tag + "' rel='noopener' target='_blank'>#" + this.options.tag + "</a></p>";
                else
                    html += "<p class='instagram_username'" + styles.profile_name + ">@" + data.full_name + " (<a href='https://www.instagram.com/" + this.options.username + "' rel='noopener' target='_blank'>@" + this.options.username + "</a>)</p>";

                if (!this.is_tag && this.options.display_biography)
                    html += "<p class='instagram_biography'" + styles.profile_biography + ">" + data.biography + "</p>";

                html += "</div>";
            }

            // Gallery
            if (this.options.display_gallery) {
                var image_index = typeof image_sizes[this.options.image_size] !== "undefined" ? image_sizes[this.options.image_size] : image_sizes[640];

                if (typeof data.is_private !== "undefined" && data.is_private === true) {
                    html += "<p class='instagram_private'><strong>This profile is private</strong></p>";
                } else {
                    var imgs = (data.edge_owner_to_timeline_media || data.edge_hashtag_to_media).edges;
                    max = (imgs.length > this.options.items) ? this.options.items : imgs.length;

                    html += "<div class='instagram_gallery'>";

                    for (var i = 0; i < max; i++) {
                        var url = "https://www.instagram.com/p/" + imgs[i].node.shortcode,
                            image, type_resource,
                            caption = escape_string(this.parse_caption(imgs[i], data));

                        switch (imgs[i].node.__typename) {
                            case "GraphSidecar":
                                type_resource = "sidecar"
                                image = imgs[i].node.thumbnail_resources[image_index].src;
                                break;
                            case "GraphVideo":
                                type_resource = "video";
                                image = imgs[i].node.thumbnail_src
                                break;
                            default:
                                type_resource = "image";
                                image = imgs[i].node.thumbnail_resources[image_index].src;
                        }

                        if (this.is_tag) data.username = '';
                        html += "<a href='" + url + "' class='instagram-" + type_resource + "' title='" + caption + "' rel='noopener' target='_blank'>";
                        html += "<img" + (this.options.lazy_load ? " loading='lazy'" : '')  + " src='" + image + "' alt='" + caption + "'" + styles.gallery_image + " />";
                        html += "</a>";
                    }

                    html += "</div>";
                }
            }

            // IGTV
            if (this.options.display_igtv && typeof data.edge_felix_video_timeline !== "undefined") {
                var igtv = data.edge_felix_video_timeline.edges,
                    max = (igtv.length > this.options.items) ? this.options.items : igtv.length
                if (igtv.length > 0) {
                    html += "<div class='instagram_igtv'>";
                    for (var i = 0; i < max; i++) {
                        var url = "https://www.instagram.com/p/" + igtv[i].node.shortcode,
                            caption = this.parse_caption(igtv[i], data);

                        html += "<a href='" + url + "' rel='noopener' title='" + caption + "' target='_blank'>";
                        html += "<img" + (this.options.lazy_load ? " loading='lazy'" : '')  + " src='" + igtv[i].node.thumbnail_src + "' alt='" + caption + "'" + styles.gallery_image + " />";
                        html += "</a>";
                    }
                    html += "</div>";
                }
            }

            this.options.container.innerHTML = html;
        };

        this.run = function() {
            this.get(function(data, instance) {
                if(instance.options.container != ""){
                    instance.display(data);
                }
                if(typeof instance.options.callback === "function"){
                    instance.options.callback(data);
                }
            });
        };

        if (this.valid) {
            this.run();
        }
    };
}));