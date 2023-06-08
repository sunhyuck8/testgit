<%@page import="com.home.pooh.domain.Member"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	Member member = (Member)session.getAttribute("userInfo");
%>
<!--
	Minimaxing by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Three Column - Minimaxing by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/resources/user/assets/css/main.css" />
	</head>
	<body>
		<div id="page-wrapper">

			<!-- Header -->
				<%@ include file="../inc/header.jsp" %>
			<!-- UnderHeader -->
				<%@ include file="../inc/underHeader.jsp" %>
			<!-- Main -->
				<div id="main">
					<div class="container">
						<div class="row main-row">
							<div class="col-3 col-12-medium">

								<section>
									<h2>Compelling links</h2>
									<ul class="link-list">
										<li><a href="#">Quis accumsan lorem</a></li>
										<li><a href="#">Sed neque nisi consequat</a></li>
										<li><a href="#">Eget et amet consequat</a></li>
										<li><a href="#">Dapibus sed mattis blandit</a></li>
										<li><a href="#">Vitae magna sed dolore</a></li>
										<li><a href="#">Eget et amet consequat</a></li>
										<li><a href="#">Dapibus sed mattis blandit</a></li>
									</ul>
								</section>

								<section>
									<h2>Something profound</h2>
									<p>Duis neque sed nisi, dapibus sed mattis rutrum accumsan sed.
									Suspendisse eu varius amet nibh. Suspendisse vitae magna eget odio amet
									mollis justo facilisis quis. Sed sagittis mauris amet tellus gravida
									lorem ipsum dolor consequat blandit tempus ipsum dolor lorem sit amet.</p>
								</section>

							</div>
							<div class="col-6 col-12-medium imp-medium">

								<section class="middle-content">
									<h2>Three Column (two sidebars)</h2>
									<p>test</p>
								</section>

							</div>
							<div class="col-3 col-12-medium">

								<section>
									<h2>Who are you guys?</h2>
									<ul class="small-image-list">
										<li>
											<a href="#"><img src="/resources/user/images/pic2.jpg" alt="" class="left" /></a>
											<h4>Jane Anderson</h4>
											<p>Varius nibh. Suspendisse vitae magna eget et amet mollis justo facilisis amet quis.</p>
										</li>
										<li>
											<a href="#"><img src="/resources/user/images/pic1.jpg" alt="" class="left" /></a>
											<h4>James Doe</h4>
											<p>Vitae magna eget odio amet mollis justo facilisis amet quis. Sed sagittis consequat.</p>
										</li>
									</ul>
								</section>

								<section>
									<h2>How about some links?</h2>
									<ul class="link-list">
										<li><a href="#">Quis accumsan lorem</a></li>
										<li><a href="#">Sed neque nisi consequat</a></li>
										<li><a href="#">Eget et amet consequat</a></li>
										<li><a href="#">Dapibus sed mattis blandit</a></li>
										<li><a href="#">Vitae magna sed dolore</a></li>
									</ul>
								</section>

							</div>
						</div>
					</div>
				</div>

			<!-- Footer -->
				<%@ include file="../inc/footer.jsp" %>

		</div>

		<!-- Scripts -->
			<script src="/resources/user/assets/js/jquery.min.js"></script>
			<script src="/resources/user/assets/js/browser.min.js"></script>
			<script src="/resources/user/assets/js/breakpoints.min.js"></script>
			<script src="/resources/user/assets/js/util.js"></script>
			<script src="/resources/user/assets/js/main.js"></script>

	</body>
</html>