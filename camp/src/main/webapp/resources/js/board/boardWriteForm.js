// 미리보기 관련 요소 모두 얻어오기
// -> 동일한 개수의 요소가 존재함 == 인덱스가 일치함
const inputImage = document.getElementsByClassName("inputImage");
const preview = document.getElementsByClassName("preview");
const deleteImage = document.getElementsByClassName("delete-image");

// 게시글 수정 시 삭제된 이미지의 레벨(위치)를 저장할 input 요소
const deleteList = document.getElementById("deleteList");

// 게시글 수정 시 삭제된 이미지의 레벨(위치)를 기록해둘 Set 생성
const deleteSet = new Set(); // 순서 X, 중복 허용 X (여러번 클릭 시 중복 값 저장 방지)

//
const file = document.getElementById("btnAtt");



for(let i=0 ; i<inputImage.length ; i++){

    // 파일이 선택 되었을 때의 동작
    inputImage[i].addEventListener("change", function(){

        if(this.files[0] != undefined){ // 파일이 선택 되었을 때
            const reader = new FileReader(); // 선택된 파일을 읽을 객체 생성
            reader.readAsDataURL(this.files[0]);
            // 지정된 파일을 읽음 -> result에 저장(URL 포함) -> URL을 이용해서 이미지 볼 수 있음

            reader.onload = function(e){ // reader가 파일을 다 읽어온 경우
                // e.tartget == redaer
                // e.target.result == 읽어들인 이미지의 URL
                // preview[i] == 파일이 선택된 input태그와 인접한 preview 이미지 태그
                preview[i].setAttribute("src", e.target.result);

                // 이미지가 성공적으로 불러와졌을 때
                // deleteSet에서 해당 레벨을 제거(삭제 목록에서 제외)
                deleteSet.delete(i);
            }
      
        } else { // 파일이 선택되지 않았을 때 (취소)
            preview[i].removeAttribute("src"); // src 속성 제거
        }
    });



    // 미리보기 삭제 버튼(x)이 클릭 되었을 때의 동작
    deleteImage[i].addEventListener("click", function(){
        console.log("file : " +file.value);
        // 미리보기가 존재하는 경우에만 (이전에 추가된 이미지가 있을 때만 X버튼 동작)
        if( preview[i].getAttribute("src")  !=  "" ){

            // 미리보기 삭제
            preview[i].removeAttribute("src");

            // input의 값을 "" 만들기
            inputImage[i].value = "";

            // deleteSet에 삭제된 이미지 레벨(i) 추가
            deleteSet.add(i);
        }

    });

}


// 게시글 작성 유효성 검사
function writeValidate(){
    const boardTitle = document.getElementsByName("boardTitle")[0];
    const boardContent = document.querySelector("[name='boardContent']");

    if(boardTitle.value.trim().length == 0){
        alert("제목을 입력해주세요!!!");
        boardTitle.value = "";
        boardTitle.focus();
        return false;
    }

    if(boardContent.value.trim().length == 0){
        alert("내용을 입력해주세요!!!");
        boardContent.value = "";
        boardContent.focus();
        return false;
    }

    // 제목, 내용이 유효한 경우
    // deleteList(input 태그)에 deleteSet(삭제된 이미지 레벨)을 추가
    // -> JS 배열 특징 사용
    //  --> JS 배열을 HTML요소 또는 console 에 출력하게 되는 경우 1,2,3 같은 문자열로 출력됨
    //      (배열 기호가 벗겨짐)

    // * Set -> Array로 변경 -> deleteList.value에 대입

    // Array.from(유사배열 | 컬렉션) : 유사배열 | 컬렉션을 배열로 변환해서 반환
    // deleteList.value = Array.from(deleteSet);


    return true;
}



// 서머노트
$(document).ready(function() {

    var toolbar = [
            // 글꼴 설정
            ['fontname', ['fontname']]
            // 글자 크기 설정
            ['fontsize', ['fontsize']],
            // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
            // 글자색
            ['color', ['forecolor','color']],
            // 글머리 기호, 번호매기기, 문단정렬
            ['para', ['ul', 'ol', 'paragraph']],
            // 줄간격
            ['height', ['height']],
            // 그림첨부, 링크만들기, 동영상첨부
            ['insert',['picture','link','video']],
            // 코드보기, 확대해서보기('fullscreen'), 도움말
            ['view', ['codeview', 'help']]
        ];

    var setting = {
            placeholder: '내용을 작성해주세요!',
            disableResizeEditor: true,
            // height : 300,
            minHeight : 300,
           maxHeight : null,
            lang : 'ko-KR',
            toolbar : toolbar,
            callbacks : { //여기 부분이 이미지를 첨부하는 부분

                onImageUpload : function(files, editor, welEditable) {
                // 파일 업로드(다중업로드를 위해 반복문 사용)
                for (var i = 0; i < files.length; i++) {
                    uploadSummernoteImageFile(files[i], this);
                }
            }
        }                 
    }; 

    $('.summernote').summernote(setting);
    
    const jsonArray = [];
    
    function uploadSummernoteImageFile(file, el) {
        var data = new FormData();
        data.append("file", file);
        $.ajax({
            data : data,
            type : "POST",
            url : contextPath + '/board/upload',
            contentType : false,
            enctype : 'multipart/form-data',
            processData : false,
            dataType : "JSON",
            success : function(data) {

                for(let i=0; i<data.length; i++) {

                    $(el).summernote('editor.insertImage', data[i]["url"]);
                    jsonArray.push(data[i]["url"]);
                   
                }

            },
            error : function(){
                // 비동기 통신(ajax) 중 오류가 발생한 경우
                console.log("에러 발생");
            }
        });

    }   
    console.log(jsonArray);
    
    
});






// 사진파일 추가
 /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
//  (    imageView = function imageView(att_zone, btn){

//         var attZone = document.getElementById(att_zone);
//         var btnAtt = document.getElementById(btn)
//         var sel_files = [];
        
//         // 이미지와 체크 박스를 감싸고 있는 div 속성
//         var div_style = 'display:inline-block;position:relative;'
//                         + 'width:150px;height:120px;margin:5px;border:1px solid #999;z-index:1';
//         // 미리보기 이미지 속성
//         var img_style = 'width:100%;height:100%;z-index:none';
//         // 이미지안에 표시되는 체크박스의 속성
//         var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
//                         + 'right:0px;border:none;z-index:999;background-color:rgba(255,255,255,0.0);color:#0af';
        
//         btnAtt.onchange = function(e){
//             var files = e.target.files;
//             var fileArr = Array.prototype.slice.call(files)
//             for(f of fileArr){
//                 imageLoader(f);
//             }
//         }  
        
        
//         // 탐색기에서 드래그앤 드롭 사용
//         attZone.addEventListener('dragenter', function(e){
//             e.preventDefault();
//             e.stopPropagation();
//         }, false)
        
//         attZone.addEventListener('dragover', function(e){
//             e.preventDefault();
//             e.stopPropagation();
            
//         }, false)
        
//         attZone.addEventListener('drop', function(e){
//             var files = {};
//             e.preventDefault();
//             e.stopPropagation();
//             var dt = e.dataTransfer;
//             files = dt.files;
//             for(f of files){
//                 imageLoader(f);
//             }
            
//         }, false)
        

        
        /*첨부된 이미지들을 배열에 넣고 미리보기 */ 
        // imageLoader = function(file){
        //     sel_files.push(file);
        //     var reader = new FileReader();
        //     reader.onload = function(ee){
        //         let img = document.createElement('img')
        //         img.setAttribute('style', img_style)
        //         img.src = ee.target.result;
        //         // img.src = '/resources/images/board' + file.name;
        //         attZone.appendChild(makeDiv(img, file));
        //         console.log(file);
        //     }
            
        //     reader.readAsDataURL(file);
        // }



        
        /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
//         makeDiv = function(img, file){
//             var div = document.createElement('div')
//             div.setAttribute('style', div_style)
            
//             var btn = document.createElement('input')
//             btn.setAttribute('type', 'button')
//             btn.setAttribute('value', 'x')
//             btn.setAttribute('delFile', file.name);
//             btn.setAttribute('style', chk_style);
//             btn.onclick = function(ev){
//             var ele = ev.srcElement;
//             var delFile = ele.getAttribute('delFile');
//             for(var i=0 ;i<sel_files.length; i++){
//                 if(delFile== sel_files[i].name){
//                     sel_files.splice(i, 1);      
//                 }
//             }
            
//             dt = new DataTransfer();
//             for(f in sel_files) {
//                 var file = sel_files[f];
//                 dt.items.add(file);
//             }
//             btnAtt.files = dt.files;
//             var p = ele.parentNode;
//             attZone.removeChild(p)
//             }
//             div.appendChild(img)
//             div.appendChild(btn)
//             return div
//         }
//     }
// )('att_zone', 'btnAtt')


// 파일 추가 버튼
//  $(function () {
//     $('#btn-upload').click(function (e) {
//         e.preventDefault();
//         $('#btnAtt').click();
//     });
// });







