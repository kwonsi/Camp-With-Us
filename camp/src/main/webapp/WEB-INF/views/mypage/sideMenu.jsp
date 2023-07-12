<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


       
<!-- 왼쪽 사이드 메뉴 -->
<section class="left-side">
    <h3>MENU</h3>
    <ul class="list-group">
            <c:choose>
                <c:when test="${loginMember.loginST=='Y'}">
                    <li class="myPage-list"><a href="${contextPath}/member/myPage/myReservation">예약 확인</a></li>
                    <li class="myPage-list"><a href="${contextPath}/member/myPage/myBoard">내 게시글</a></li>
                    <li class="myPage-list"><a href="${contextPath}/member/myPage/myReview">내 리뷰</a></li>
                    <li class="myPage-list"><a href="${contextPath}/member/myPage/profile">회원 정보 변경</a></li>
                    <li class="myPage-list"><a href="${contextPath}/member/myPage/secession">회원 탈퇴</a></li>
                </c:when>
                <c:when test="${loginMember.manager=='Y'}">
                    <li class="myPage-list"><a href="${contextPath}/member/myPage/myReservation">전체 예약 확인</a></li>
                    <li class="myPage-list"><a href="${contextPath}/member/myPage/myBoard">전체 게시글</a></li>
                    <li class="myPage-list"><a href="${contextPath}/member/myPage/myReview">전체 리뷰</a></li>
                </c:when>
                <c:otherwise>
                    <li class="myPage-list"><a href="${contextPath}/member/myPage/myReservation">예약 확인</a></li>
                    <li class="myPage-list"><a href="${contextPath}/member/myPage/myBoard">내 게시글</a></li>
                    <li class="myPage-list"><a href="${contextPath}/member/myPage/myReview">내 리뷰</a></li>
                    <li class="myPage-list"><a href="${contextPath}/member/myPage/profile">회원 정보 변경</a></li>
                    <li class="myPage-list"><a href="${contextPath}/member/myPage/changePw">비밀번호 변경</a></li>
                    <li class="myPage-list"><a href="${contextPath}/member/myPage/secession">회원 탈퇴</a></li>
                </c:otherwise>
            </c:choose>



        </ul>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    </section>