<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<div id="reply-area">
    <!-- 댓글 목록 -->
    <div class="reply-list-area">
        
        <ul id="reply-list">

            <c:forEach var="reply" items="${rList}">
                <li class='reply-row <c:if test="${reply.parentReplyNo != 0}"> child-reply </c:if>'>
                    <p class="reply-writer">

                        <c:if test="${empty reply.profileImage}">
                            <!-- 프로필 이미지가 없을 경우 -->
                            <img src="${contextPath}/resources/images/user.png">
                        </c:if>

                        <c:if test="${!empty reply.profileImage}">
                            <!-- 프로필 이미지가 있을 경우 -->
                            <img src="${contextPath}${reply.profileImage}">
                        </c:if>

                        <span>${reply.memberNickname}</span>
                        <span class="reply-date">(${reply.createDate})</span>
                    </p>
                    
                    <p class="reply-content">${reply.replyContent}</p>

                    <%-- 로그인한 회원의 댓글인 경우 수정, 삭제 가능--%>
                    <c:if test="${!empty loginMember}">
                        <div class="reply-btn-area">
                            <c:if test="${loginMember.memberNo == reply.memberNo}">
                                <button onclick="showUpdateReply(${reply.replyNo}, this);">수정</button>     
                                <button onclick="deleteReply(${reply.replyNo})">삭제</button>
                            </c:if>

                        </div>
                    </c:if>
                </li>
            </c:forEach>
            
        </ul>
    </div>
    

    <!-- 댓글 작성 부분 -->
    <div class="reply-write-area">
        <form class="mb-3" name="campReview_form" id="campReview_form" method="post">
			<fieldset>
				<span class="text-bold">별점을 선택해주세요</span>
				<input type="radio" name="reviewStar" value="5" id="rate1"><label
					for="rate1">★</label>
				<input type="radio" name="reviewStar" value="4" id="rate2"><label
					for="rate2">★</label>
				<input type="radio" name="reviewStar" value="3" id="rate3"><label
					for="rate3">★</label>
				<input type="radio" name="reviewStar" value="2" id="rate4"><label
					for="rate4">★</label>
				<input type="radio" name="reviewStar" value="1" id="rate5"><label
					for="rate5">★</label>
			</fieldset>
			<div>
				<textarea class="col-auto form-control" type="text" id="reviewContents"
						  placeholder="리뷰를 작성해주세요."></textarea>
			</div>
			<button id="addReply">
	            리뷰<br>
	            등록
	        </button>
		</form>
        
    </div>

</div>