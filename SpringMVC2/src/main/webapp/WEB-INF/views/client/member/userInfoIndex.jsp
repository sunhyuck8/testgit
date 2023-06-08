<%@page import="com.home.pooh.domain.Member"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	Member member = (Member)session.getAttribute("userInfo");
	String loginFlag = (member!=null) ? "inline" : "none"; 
	String userFilename = (member!=null) ? member.getFilename() : "";
	String userName=(member!=null) ? member.getName() : "비회원";
%>
<html>
	<head>
		<title>Three Column - Minimaxing by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/resources/user/assets/css/main.css" />
		
		
		<script>
			function confirmUpdate() {
				var result = confirm("수정하시겠습니까?");
				if(result){
					location.href = "/member/memberUpdateForm";
				}else{
					
				}
			}
			
			function deleteUser(member_id) {
				if(confirm("이 아이디를 삭제하시겠습니까?")){
					if(confirm("진짜로 삭제하시겠습니까?")){
						location.href = "/member/deleteUser?member_id="+member_id;
					}
				}
			}
		</script>
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
				
			<!-- Main -->
				<div id="main">
					<div class="container">
						<div class="row main-row">
							<div class="col-3 col-12-medium">

								<section>
									<h2>내정보 메뉴</h2>
									<ul class="link-list">
										<li><a href="/userInfo/board?writer="+<%=member.getName() %>>내가 작성한 글</a></li>
										<li><a href="#">내가 작성한 댓글</a></li>
										<li><a href="#">최근에 본 게시물</a></li>
									</ul>
								</section>

								<section>
									<h2>Something profound</h2>
									<p>Duis neque sed nisi, dapibus sed mattis rutrum accumsan sed.</p>
								</section>

							</div>
							
		<style>
			.myInfo {
				width: 100%;
				height: 30px;
				overflow: hidden;
				margin-bottom: 30px;
				padding-bottom: 10px;
				border-bottom: 1px solid #ced0b7;
			}
			.myInfo-center-left{
				width: 25%;
				height : 100%;
				float: left;
				font-family: cursive;
				font-size: 150%;
			}
			
			.myInfo-center-right{
				width: 75%;
				height : 100%;
				float: left;
				font-family: monospace;
				font-size: 120%;
			}
			.myInfo-container-button{
				position: relative;
				height: 100%;
				
			}
			.myInfo-center-wrapper{
				position: absolute;
				right: 0px;
				margin-top :100px;
				margin-right : 30px;
			}
			.myInfo-center-wrapper button{
				font-size: 30px;
				border-radius: 10%;
				border: 1px solid #ced0b7;
			}
			.myInfo-center-wrapper button:hover{
				cursor: pointer;
				box-shadow: 0px 0px 10px #ddd;
			}
			#my-Info-img{
				width: 200px;
				height : 200px;
				border-radius: 70%;
			}
			.tag-a a:hover{
				 font-weight: bold;
			}
		
		</style>
							<div class="col-6 col-12-medium imp-medium" >
								<section class="middle-content">
									<h2>내 상세정보</h2>
									
									<div class="myInfo">
										<div class="myInfo-center-left">ID</div>
										<div class="myInfo-center-right"><%=member.getUser_id() %></div>
									</div>
									<div class="myInfo">
										<div class="myInfo-center-left">Pass</div>
										<div class="myInfo-center-right"><%=member.getPassword() %></div>
									</div>
									<div class="myInfo">
										<div class="myInfo-center-left">Name</div>
										<div class="myInfo-center-right"><%=member.getName() %></div>
									</div>
									<div class="myInfo-container-button">
										<div class="myInfo-center-wrapper">
											<button onclick="confirmUpdate()">수정</button>
										</div>
									</div>
								</section>


							</div>
							<div class="col-3 col-12-medium">

								<section>
									<h2>사진</h2>
									<ul class="small-image-list">
										<li>
											<a href="#"><img src="/resources/data/<%=member.getFilename() %>" alt="" id="my-Info-img" /></a>
											<h4></h4>
											<p>Varius nibh. Suspendisse </p>
										</li>
										
									</ul>
								</section>

 								<section>
									<h2>회원탈퇴</h2>
									<ul class="link-list">
										<li class="tag-a"><a href="#"  onclick="deleteUser(<%=member.getMember_id()%>)">회원 탈퇴</a></li>
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