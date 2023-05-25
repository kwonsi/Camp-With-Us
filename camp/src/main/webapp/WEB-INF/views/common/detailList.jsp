<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/detailList.css">

    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>

</head>
<body>
    <main>
		
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

               


            <div class="div1">111

                <div id="map" style="width:500px;height:400px;"></div>


            </div>
            <hr>

            <div class="div2">222
                <section class="imagesection">


                </section>
                <section class="listsection">

                    
                </section>

            </div>


    
            <div class="div3">333


            </div>
          


        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
        
    </main>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eb6841185807d60ca94c27f62bee498c"></script>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
 <script src="${contextPath}/resources/js/detailList.js"></script>

</body>
</html>