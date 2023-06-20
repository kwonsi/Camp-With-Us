<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


       
<!-- 왼쪽 사이드 메뉴 -->
<section class="left-side">
    <h3>MENU</h3>
    <ul class="list-group">
        <c:forEach var="boardType" items="${boardTypeList}">
            <li><a href="${contextPath}/board/list/${boardType.boardCode}">${boardType.boardName}</a></li>
         </c:forEach>	
        </ul>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    </section>