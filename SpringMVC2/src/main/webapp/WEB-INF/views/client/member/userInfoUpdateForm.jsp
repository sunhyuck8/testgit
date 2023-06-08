<%@page import="com.home.pooh.domain.Member"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
Member member = (Member) session.getAttribute("userInfo");
String loginFlag = (member != null) ? "inline" : "none";
String userFilename = (member != null) ? member.getFilename() : "";
String userName = (member != null) ? member.getName() : "비회원";
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
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/user/assets/css/main.css" />

	

</head>
<body>
	<div id="page-wrapper">

		<!-- Header -->
		<%@ include file="../inc/header.jsp"%>
		<!-- UnderHeader -->
		<jsp:include page="../inc/underHeader.jsp">
			<jsp:param value="<%=loginFlag%>" name="display" />
			<jsp:param value="<%=userFilename%>" name="filename" />
			<jsp:param value="<%=userName%>" name="name" />
		</jsp:include>

		<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row main-row">
					<div class="col-3 col-12-medium">

						<section>
							<h2>내정보 메뉴</h2>
							<ul class="link-list">
								<li><a href="#">내가 작성한 글</a></li>
								<li><a href="#">내가 작성한 댓글</a></li>
							</ul>
						</section>

						<section>
							<h2>Something profound</h2>
							<p>Duis neque sed nisi, dapibus sed mattis rutrum accumsan
								sed.</p>
						</section>

					</div>
					<div class="col-6 col-12-medium imp-medium">
<style>
.myInfo {
	width: 100%;
	height: 30px;
	overflow: hidden;
	margin-bottom: 30px;
	padding-bottom: 10px;
	border-bottom: 1px solid #ced0b7;
}

.myInfo-center-left {
	width: 25%;
	height: 100%;
	float: left;
	font-family: cursive;
	font-size: 150%;
}

.myInfo-center-right {
	width: 75%;
	height: 100%;
	float: left;
	font-family: monospace;
	font-size: 120%;
}

.myInfo-container-button {
	position: relative;
	height: 100%;
}

.myInfo-center-wrapper {
	position: absolute;
	right: 0px;
	margin-top: 100px;
	margin-right: 30px;
}

.myInfo-center-wrapper button {
	font-size: 30px;
	border-radius: 10%;
	border: 1px solid #ced0b7;
}

.myInfo-center-wrapper button:hover {
	cursor: pointer;
	box-shadow: 0px 0px 10px #ddd;
}

#my-Info-img {
	width: 200px;
	height: 200px;
	border-radius: 70%;
}

.myInfo-UpdateTextForm {
	width: 75%;
	height: 40px;
	border: none;
	font-size: 25px;
	padding-bottom: 20px;
	outline: none;
}

.btn-upload-div {
	width: 150px;
	height: 30px;
	background: #fff;
	border: 1px solid rgb(77, 77, 77);
	border-radius: 10px;
	font-weight: 500;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center; 
}
.btn-upload-div:hover{
	background : rgb( 77, 77, 77);
	color: #fff;
}
#btn-upload{
	display: none;
}



</style>
						<section class="middle-content">
							<h2>상세정보 변경</h2>
							
							
						<form>
							<input type="hidden" name="member_id" value="<%=member.getMember_id()%>">
							<input type="hidden" name="user_id" value="<%=member.getUser_id()%>">
							<div class="myInfo">
								<div class="myInfo-center-left">ID</div>
								<div class="myInfo-center-right" ><%=member.getUser_id()%></div>
							</div>
							<div class="myInfo">
								<div class="myInfo-center-left">Pass</div>
								<input type="text" class="myInfo-UpdateTextForm" name="password"
									value="<%=member.getPassword()%>">
							</div>
							<div class="myInfo">
								<div class="myInfo-center-left">RePass</div>
								<input type="text" class="myInfo-UpdateTextForm" value=""
									placeholder="password.." name="repassword">
							</div>
							<div class="myInfo">
								<div class="myInfo-center-left">Name</div>
								<input type="text" class="myInfo-UpdateTextForm" name="name"
									value="<%=member.getName()%>">
							</div>
							<input type="file" id="btn-upload" name="photo">
						</form>
						
							<div class="myInfo-container-button">
								<div class="myInfo-center-wrapper">
									<button onclick="userUpdate()">확인</button>
									<button onclick="goBack()">되돌아가기</button>
								</div>
							</div>
						</section>


					</div>
					<div class="col-3 col-12-medium">

						<section class="sec-fileUpload">
							<h2>사진</h2>
							<ul class="small-image-list">
								<li>
									<div class="wrapper-fileupload">
										<div id="img-frame">
											<img	src="/resources/data/<%=member.getFilename()%>" id="my-Info-img" />
										</div>
										<label for="btn-upload">
											<div class="btn-upload-div">파일 업로드하기</div>
										</label> 
										
									</div>
									
									
									<p>Don't waste your youth.</p>
								</li>
							</ul>
						</section>
					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<%@ include file="../inc/footer.jsp"%>

	</div>

	<!-- Scripts -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script src="/resources/user/assets/js/jquery.min.js"></script>
	<script src="/resources/user/assets/js/browser.min.js"></script>
	<script src="/resources/user/assets/js/breakpoints.min.js"></script>
	<script src="/resources/user/assets/js/util.js"></script>
	<script src="/resources/user/assets/js/main.js"></script>
	
	


	<script>
 	window.addEventListener('load', function(){ 
 
			const section = document.querySelector('.middle-content');
			const fileInput = section.querySelector('input[type="file"]');
			const imgfile = document.getElementById('my-Info-img');
			const frame = document.getElementById('img-frame');

			 	 fileInput.addEventListener('input', ()=> {
					if(!isImage(fileInput.files[0])){
						alert('image 파일만 업로드가 가능합니다.');
						return
					} 
					if(imgfile.src!=null){
						imgfile.remove();
					}
				
					const reader = new FileReader();
				
					reader.addEventListener('load', ()=>{
						const img = document.createElement('IMG');	
						img.id = 'my-Info-img'; 		
						img.src = reader.result;
						frame.insertAdjacentElement('beforeend', img);
					
					});
					reader.readAsDataURL(fileInput.files[0]);  
				});   
	
	 }); 
	function isImage(file){
		return file.type.indexOf('image') >=0;
	}

	
	
	function userUpdate() {
		var result = confirm("수정 완료 하시겠습니까?");
		var pass =$('input[name = password]').val();
		var repass = $('input[name = repassword]').val();
		if(pass!=repass){
			alert('비밀번호를 확인해 주세요.')
			return
		}
		
		if (result) {
			$("form").attr({
				action:"/member/memberUpdate",
				method:"post",
				enctype:"multipart/form-data"
			});
			$("form").submit();	
		}
	}

	function goBack() {
		window.history.back();
	}
	function userChangeImg() {

	}
</script>
</body>
</html>