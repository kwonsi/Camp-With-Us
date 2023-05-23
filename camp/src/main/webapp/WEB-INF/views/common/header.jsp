<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<header>

	<section>
	    <a href="${contextPath}">
	        <img src="${contextPath}/resources/images/camp_logo.jpg" id="home-logo">
			<!-- 로고 교체 예정 -->
	    </a>
		<h3 class="title">캠프 보내조</h3>
	</section>
	
	<section></section>

	<section>
		<ul class="menu">
			<li>
				<h4 id="board">게시판</h4>
				<ul class="submenu">
					<li><a href="${contextPath}/board/list1">캠핑장 추천</a></li>
					<li><a href="${contextPath}/board/list2">캠핑 나눔</a></li>
					<li><a href="${contextPath}/board/list3?type=3">캠핑 꿀팁</a></li>
					<li><a href="${contextPath}/board/list4?type=4">공지사항</a></li>
					<li><a href="${contextPath}/board/list5?type=5">문의사항</a></li>
					<!-- <c:forEach var="boardType" items="${boardTypeList}">
						<li><a href="${contextPath}/board/list/${boardType.boardCode}">${boardType.boardName}</a></li>
					</c:forEach> -->
				</ul>
			</li>

			<li>
				<h4 id="myPage">마이페이지</h4>
				
				<ul class="submenu">
					<li><a href="${contextPath}/member/myPage/reservation">예약 확인</a></li>
					<li>내 게시글</li>
					<li>내 리뷰</li>
					<li>회원 정보 변경</li>
					<li>회원 탈퇴</li>
				</ul>
				
			</li>
			
			<%-- 로그인이 되어있지 않은 경우 --%>
			<c:choose>
			
				<c:when test="${ empty sessionScope.loginMember }">
					<li>
						<h4 id="login">로그인</h4>
						
						<ul class="submenu">
							<li>로그인</li>
							<li>회원가입</li>
							<li>아이디/비밀번호<br>찾기</li>
						</ul>
					</li>
				</c:when>
				
				<c:otherwise>
					<li><h4>${loginMember.memberNick}님</h4></li>
					<li><h4 id="logout">로그아웃</h4></li>
				</c:otherwise>
				
			</c:choose>
			
		</ul>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script>
			jQuery(document).ready(function(){
				$('.menu>li').mouseover(function(){
					$(this).find('.submenu').stop().slideDown(250);
				}).mouseout(function(){
					$(this).find('.submenu').stop().slideUp(250);
				});
			});
		</script>

	</section>
	
</header>
