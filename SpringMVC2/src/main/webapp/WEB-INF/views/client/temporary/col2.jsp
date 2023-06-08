<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.home.pooh.domain.InputFiles"%>
<%@page import="com.home.pooh.domain.Board"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.home.pooh.domain.Member"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	Map<Board, List<InputFiles>> map = (LinkedHashMap)request.getAttribute("boardData");
	Set set = map.entrySet();
	
	Member member = (Member)session.getAttribute("userInfo");
%>
<html>
	<head>
		<title><%=map.size() %></title>
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


	<script >
		function registForm() {
			location.href ="/col2/boardRegistForm";
		}
	</script>
	<style>
		.small-right-topList{
			right: 0;
			font-size: 10px;
			border-radius: 10px;
			margin-right: 10px;
			position: fixed;
		}
		/* 게시판의 큰 테두리 */
		.big-center-List{
			width: 90%;
			border-radius: 2%;
			margin: 50px;
		}
		/* 게시물의 큰 테두리 */
		.small-image-list{
			width : 90%;
			height :80%;
			background: white;
			border: 1px solid gray;
		}
		/* 게시물하나 올라오는 wrapper */
		.content-wrapper{
			width : 100%;
			overflow: hidden;
		}
		/* 게시물의 이미지 */
		.content-img{
			width: 80px;
			height : 80px;
			float: left;
		}
		/* 게시물 부차적 설명 */
		.content-text-wrapper{
			width: 70%;
			float: left;
		}
		.img-center{
			width: 60px;
			height: 60px; 
		
		}
		.img-list{
			width: 40px;
			height: 40px;
		}
		.button-board-container{
			width: 100%;
			overflow: hidden;
		}
		.button-board-wrapper{
			float: right;
			margin-right: 100px;
		}
	</style>
			<!-- Main -->
				<div id="main">
					<div class="container">
						<div class="row main-row">
						
						
							<div class="big-center-List">
								<section>
									<h2>게시판2</h2>
										<div class="button-board-container">
											<div class="button-board-wrapper">
												<button type="button" onclick="registForm()"> 글등록</button>
											</div>
										</div>
										<ul class="small-image-list">
											 <%for(Map.Entry<Board, List<InputFiles>> entry : map.entrySet()){%> 
											<li>
												<div class="content-wrapper">
													<div class="content-img">
														<!--<img src="/resources/user/images/pic2.jpg"  -->
														<a href="#"><img src="/resources/data/<%=entry.getKey().getFilename() %>" alt="" class="img-center" /></a>
													</div>
													<div class="content-text-wrapper">
														<div><a href="/col1/board/detail2?board_id=<%=entry.getKey().getBoard_id()%>"><h4><%=entry.getKey().getTitle() %></h4></a></div>
														<div><%=entry.getKey().getType() %></div>
														<div><%=entry.getKey().getRegdate()+"/"+entry.getKey().getWriter() %></div>
													</div>
												</div>
											</li>
											 <%} %> 
										</ul>
										<div style="text-align: center">
												<a>◀</a>
											<%for(int i =0;i<10;i++){ %>
												<a href="#"><%=i+1 %></a>
											<%} %>
											<a>▶</a>
										</div>
								</section>
							</div>
							
							
							<div class="small-right-topList">
								<!--  <section>
									<h2>조회수 많은 게시물</h2>
									<ul class="small-image-list">
										<li>
											<a href="#"><img src="/resources/user/images/pic2.jpg" alt="" class="img-list" /></a>
											<h4>Jane Anderson</h4>
											<p>Varius nibh. Suspendisse vitae magna eget et amet mollis justo facilisis amet quis.</p>
										</li>
										<li>
											<a href="#"><img src="/resources/user/images/pic1.jpg" alt="" class="img-list" /></a>
											<h4>James Doe</h4>
											<p>Vitae magna eget odio amet mollis justo facilisis amet quis. Sed sagittis consequat.</p>
										</li>
									</ul>
								</section> -->


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