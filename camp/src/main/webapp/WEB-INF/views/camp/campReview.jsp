<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<div id="reply-area">

    <!-- 리뷰 작성 부분 -->
    <c:choose>
        <c:when test="${!empty campName}">
            <div class="reply-write-area">
                <form class="mb-3" name="campReview_form" id="campReview_form">
                    <fieldset>
                       
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
                            <span id = "starspan">별점을 선택해주세요</span>
                    </fieldset>
                    <div>
                        <textarea class="col-auto form-control" type="text" id="reviewContents"
                                placeholder="리뷰를 작성해주세요."></textarea>
                        <button id="addReply" type="button">
                            리뷰<br>
                            등록
                        </button>
                    </div>
                    
                </form>
                
            </div>
        </c:when>
    </c:choose>


    <!-- 리뷰 목록 -->
    <div class="reply-list-area">
        
        <ul id="reply-list">


            
        </ul>

        <div id="pagination" class="pagination"></div>
    </div>
    

    

</div>