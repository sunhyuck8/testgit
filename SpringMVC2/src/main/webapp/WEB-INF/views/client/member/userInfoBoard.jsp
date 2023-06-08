<%@page import="java.util.List"%>
<%@page import="com.home.pooh.domain.Board"%>
<%@page import="com.home.pooh.domain.Member"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	Member member = (Member)session.getAttribute("userInfo");
	String loginFlag = (member!=null) ? "inline" : "none"; 
	String userFilename = (member!=null) ? member.getFilename() : "";
	String userName=(member!=null) ? member.getName() : "비회원";
	
	List<Board> boardList = (List)request.getAttribute("boardList");
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
							<%@ include file="./inc/sideLeft.jsp" %>
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
			.myInfoBoard{
				width: 75%;
			}
			/* userInfoBoard */
			.myInfoBoard {
				width: 75%;
				height: 100%;
				overflow: hidden; 
				margin-bottom: 30px;
				padding-bottom: 10px;
				border: 1px solid black;
			}
			.myInfoBoard-Left-wrapper{
				width: 15%;
				height : 100px;
				border: 2px solid black;
				float: left;
			}
			.myInfoBoard-Right-wrapper {
				width: 75%;
				height : 100px;
				border: 2px solid black;
				float: left;
				padding: 10px;
				/* border-bottom: 1px solid #ced0b7;  */
			}
			.myInfoBoard-Right-wrapper a{
				text-decoration: none;
			}
			.myInfoBoard-Right-wrapper a:hover{
				 text-shadow: 1px 1px 1px #008ead;
			}
			.myInfoBoard-img {
				width: 100%;
				height: 100%;
				content: url("/resources/data/imgIcon/basicImgIcon.png");
			}
			.myInfoBoard-Right-top{
				font-weight: bold;
				font-size: 30px;
				
			}
			.myInfoBoard-Right-mid{
				font-size: 20px;
				padding-top: 5px; 
			}
			.myInfoBoard-Right-btm{
				font-size: 20px;
				padding-top: 5px;
			}
		</style>
		
							<div class="myInfoBoard">
								<section class="middle-content">
									<h2> 내가 작성한 글</h2>
									
								<%for(Board board : boardList){ %>
									<div class="myInfoBoard">
										<div class="myInfoBoard-Left-wrapper">
											<img src="" class="myInfoBoard-img">
										</div>
										<div class="myInfoBoard-Right-wrapper">
											<div class="myInfoBoard-Right-top"><a href="/<%=board.getBoardType().getBoardname() %>/board/detail?board_id=<%=board.getBoard_id() %>"><%=board.getTitle() %></a></div>
											<div class="myInfoBoard-Right-mid"><%=board.getBoardType().getBoardname() %></div>
											<div class="myInfoBoard-Right-btm"><%=board.getRegdate() %></div>
										</div>
									</div>
								<%} %>

								
								
								
									
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