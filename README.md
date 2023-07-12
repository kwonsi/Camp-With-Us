<img src="https://capsule-render.vercel.app/api?type=waving&color=auto&height=200&section=header&text=Camp&nbsp;With&nbsp;Us&fontSize=90" />

### 프로젝트 설명
캠핑장 검색 및 예약 웹사이트

### 개발 목적
꾸준히 늘어나는 캠핑 수요에 따라 쉽고 빠른 캠핑장 검색 및 예약을 돕는 사이트 개발

### 전체 기능
- 캠핑장 검색기능(고캠핑 Api이용)
- 캠핑장 예약 및 결제
- 회원 가입 및 로그인 기능(일반 및 소셜(구글, 네이버, 카카오)) - 일반회원, 관리자 회원
- 회원정보 수정, 탈퇴
- 게시글 작성, 수정, 삭제(여행지 추천 게시판, 캠핑 나눔 게시판, 자유게시판, 공지사항, 문의사항)
- 리뷰 작성, 수정, 삭제
- 캠핑장 정보조회(상세정보, 지도/위치, 날씨, 리뷰)
- 캠핑장 예약정보 작성 페이지(달력, 인원선택, 예약자 정보작성)
- 캠핑장 예약 결제(무통장, 카드결제 선택)
- 캠핑장 예약확인(예약, 예약대기, 취소)
- 추천 캠핑장


### 내가 맡은 역할
- 메인페이지 <br>
  캠핑장 지역, 카테고리 선택 후 검색 페이지 이동 <br>
- 로그인, 회원가입 <br>
  회원가입<br>
    &nbsp;&nbsp;이메일 중복체크(AJAX), 이메일 인증(Java Mail Sender)<br>
    &nbsp;&nbsp;닉네임 중복체크(AJAX), 비밀번호 체크, 주소 검색(DAUM 주소 찾기 API)
  로그인 <br>
    &nbsp;&nbsp;입력한 ID와 PW가 일치하는 회원을 DB에서 조회
- ID / PW 찾기 <br>
  ID 찾기 <br>
    &nbsp;&nbsp;전화번호를 입력하여 ID 조회 <br>
  PW 찾기 <br>
    &nbsp;&nbsp;이메일, 전화번호를 입력 시 임시 비밀번호를 이메일로 발급 <br>
- 마이페이지, 관리자페이지 <br>
  &nbsp;&nbsp;DB 조회(예약내역, 게시글, 리뷰) 후 목록 출력 <br>
  &nbsp;&nbsp;회원정보 수정 <br>
  &nbsp;&nbsp;회원 탈퇴 <br>
- 캠핑장 검색 페이지 <br>
  &nbsp;&nbsp;캠핑장 검색(고캠핑 API 사용) <br>
  &nbsp;&nbsp;메인페이지에서 선택한 값을 이용한 캠핑장 검색 <br>
- 상세페이지(카카오맵 ,리뷰) <br>
  &nbsp;&nbsp;고캠핑 API에서 가져온 정보를 통해 캠핑장 위치 표시(카카오맵 API) <br>
  &nbsp;&nbsp;DB 리뷰 테이블 조회 후 해당 캠핑장의 리뷰 목록 출력 <br>
  &nbsp;&nbsp;리뷰 CRUD <br>
- 캠핑 나눔 게시판 썸네일 표시 <br>
- 게시판 이미지 저장 및 표시 <br>
  

<div align="center">
    <div align="center">
    Tech Stack<br>
</div>
	<img src="https://img.shields.io/badge/Java-007396?style=flat&logo=Java&logoColor=white" />
	<img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=HTML5&logoColor=white" />
	<img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=CSS3&logoColor=white" />
	<img src="https://img.shields.io/badge/javascript-F7DF1E?style=flat&logo=javascript&logoColor=white" />
  <img src="https://img.shields.io/badge/Oracle SQL-F80000?style=flat&logo=oracle&logoColor=white" />
  <img src="https://img.shields.io/badge/jQuery-0769AD?style=flat&logo=jquery&logoColor=white" />
</div>
<br>
<div align="center">
    <div align="center">
    Tools & WAS <br>
</div>
<div align="center">
    <img src="https://img.shields.io/badge/Spring-6DB33F?style=flat&logo=spring&logoColor=white" />
    <img src="https://img.shields.io/badge/eclipseIDE-2C2255?style=flat&logo=eclipseide&logoColor=white" />
    <img src="https://img.shields.io/badge/Visual Studio Code-007ACC?style=flat&logo=visualstudiocode&logoColor=white" />
    <img src="https://img.shields.io/badge/Apache&nbsp;Tomcat-F8DC75?style=flat&logo=apachetomcat&logoColor=black" />
</div>
<br>
<div align="center">
  <div align="center">
  Collaborations<br>
</div>
<div align="center">
    <img src="https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white" />
    <img src="https://img.shields.io/badge/amazon AWS-232F3E?style=flat&logo=amazonaws&logoColor=white" />
    <img src="https://img.shields.io/badge/Maven-C71A36?style=flat&logo=apachemaven&logoColor=white" />
</div>