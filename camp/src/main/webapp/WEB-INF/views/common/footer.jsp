<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ======= Footer ======= -->
<footer id="footer">

    <div class="footer-top">
        <div class="container">
            <div class="row">

<!--             <div class="col-lg-3 col-md-6 footer-contact">
            <h3>캠핑보내조</h3>
            <p>
                A108 Adam Street <br>
                New York, NY 535022<br>
                United States <br><br>
                <strong>Phone:</strong> 010 0000 0000<br>
                <strong>Email:</strong> camp@camp.com<br>
            </p>
            </div> -->

            <div class="col-lg-3 col-md-6 footer-links">
                <h4>캠핑보내조</h4>
                <ul>
                    <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
                    <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
<!--                     <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
                    <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
                    <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li> -->
                </ul>
                </div>


            <div class="col-lg-3 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
                <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
<!--                 <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li> -->
            </ul>
            </div>

            <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
                <li><i class="bx bx-chevron-right"></i> <a href="#">Web </a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="#">Web </a></li>
<!--                 <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li> -->
            </ul>
            </div>

            <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Social </h4>
            <ul>
                <li><i class="bx bx-chevron-right"></i> <a href="#">Web </a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="#">Web </a></li>
<!--                 <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li> -->
            </ul>
            </div>

            </div>
        </div>
    </div>

    <div class="container py-4">
        
        <div class="copyright">
        &copy; Copyright <strong><span>캠핑보내조</span></strong>. All Rights Reserved Designed by <a href="https://bootstrapmade.com/"> BootstrapMade</a>
        &nbsp; &nbsp;
        </div>
        <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/ninestars-free-bootstrap-3-theme-for-creative/ -->
<!--         Designed by <a href="https://bootstrapmade.com/"> BootstrapMade</a>
        &nbsp; &nbsp; -->
        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
        </div>
    </div>
</footer><!-- End Footer -->



<%-- session에 message 속성이 존재하는 경우 alert창으로 해당 내용을 출력 --%>
<c:if test="${ !empty message }">
    <script>
    	console.log("${message}");
        alert("${message}");
        // EL 작성 시 scope를 지정하지 않으면
        // page -> request -> session -> application 순서로 검색하여
        // 일치하는 속성이 있으면 출력
    </script>
</c:if> 