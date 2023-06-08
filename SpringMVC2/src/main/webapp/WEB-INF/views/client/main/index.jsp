<%@page import="com.home.pooh.domain.Member"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	
	Member member = (Member)session.getAttribute("userInfo");
	String loginFlag = (member!=null) ? "inline" : "none"; 
	String userFilename = (member!=null) ? member.getFilename() : "";
	String userName=(member!=null) ? member.getName() : "비회원";
 %>
<!DOCTYPE HTML>
<!--
	Minimaxing by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Minimaxing by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/user/assets/css/main.css" />
	</head>
	<body>
		<div id="page-wrapper">

			<!-- Header -->
				<%@ include file="../inc/header.jsp" %>

			<!-- UnderHeader -->
				<jsp:include page="../inc/underHeader.jsp">
				<jsp:param value="<%=loginFlag %>" name="display"/>
				<jsp:param value="<%=userFilename %>" name="filename"/>
				<jsp:param value="<%=userName %>" name="name"/>
				</jsp:include>
				
				
			<!-- Banner -->
				<div id="banner-wrapper">
					<div class="container">

						<div id="banner">
							<h2>do something</h2>
							<span>Success is not success, failure is not failure  </span>
						</div>
					</div>
				</div>

			<!-- Main -->
				<div id="main">
					<div class="container">
						<div class="row main-row">
							<div class="col-4 col-12-medium">

								<section>
									<h2>Welcome to Minimaxing!</h2>
									<p>This is <strong>Minimaxing</strong>, a fully <a href="http://twitter.com/ajlkn">AJ</a> and released for free by <a href="http://html5up.net">HTML5 UP</a>. displays.</p>
									<footer class="controls">
										<a href="http://html5up.net" class="button">More cool designs ...</a>
									</footer>
								</section>

							</div>
							<div class="col-4 col-6-medium col-12-small">

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

							</div>
							<div class="col-4 col-6-medium col-12-small">

								<section>
									<h2>How about some links?</h2>
									<div>
										<div class="row">
											<div class="col-6 col-12-small">
												<ul class="link-list">
													<li><a href="#">Sed neque nisi consequat</a></li>
												</ul>
											</div>
											<br>
											
											<div><p style="text-decoration: line-through;">1. view_cnt+ 1</div>
											<div><p>2. col1 form</div>
											<div><p>3. col2 form</div>
											<div><p>4. col3 form</div>
											<div><p>5. comment, recomment List</div>
											<div><p>6. index</div>
											
										</div>
									</div>
								</section>

							</div>
							<div class="col-6 col-12-medium">

								<section>
									<h2>An assortment of pictures and text</h2>
									<p>Duis</p>
									<ul class="big-image-list">
										<li>
											<a href="#"><img src="/resources/user/images/pic3.jpg" alt="" class="left" /></a>
											<h3>Magna Gravida Dolore</h3>
											<p>Varius nibh. </p>
										</li>
										<li>
											<a href="#"><img src="/resources/user/images/pic4.jpg" alt="" class="left" /></a>
											<h3>Magna Gravida Dolore</h3>
											<p>Varius</p>
										</li>
										<li>
											<a href="#"><img src="/resources/user/images/pic5.jpg" alt="" class="left" /></a>
											<h3>Magna Gravida Dolore</h3>
											<p>Varius nibh. </p>
										</li>
									</ul>
								</section>

							</div>
							<div class="col-6 col-12-medium">

								<article class="blog-post">
									<h2>Just another blog post</h2>
									<a class="comments" href="#">33 comments</a>
									<a href="#"><img src="/resources/user/images/pic6.jpg" alt="" class="top blog-post-image" /></a>
									<h3>Magna Gravida Dolore</h3>
									<p>Aenean </p>
									<footer class="controls">
										<a href="#" class="button">Continue Reading</a>
									</footer>
								</article>

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