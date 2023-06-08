<%@page import="com.home.pooh.domain.Member"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	Member loginMember = (Member)session.getAttribute("userInfo");
	boolean userLoginState = (loginMember==null)? false: true;
	String infoBoxFlag = (userLoginState) ? "":"none";
	String inputBoxFlag = (userLoginState)? "none":"";
	String userName = (userLoginState)? loginMember.getName():"";
	
	
%>

	<style>
		#user-info-wrapper {
			border: 1px solid black;
			overflow: hidden;
			background-color: #008ead;
		}
		.user-info-container {
			padding: 10px;
			height: auto;
			display: inline-block;
			float: right;
			font: bold;
			color: white;
			font-size: 30px;
		}
		.user-info-container img{
			width: 40px;
			height: 40px;
			border-radius: 70%;
		}
		
		.log_button {
			background-color: transparent;
			border: none;
			width: 120px;
			height: 40px;
		}
		.log_button img{
			background-color: transparent;
			border: none;
			width: 120px;
			height: 40px;
		}
		.test {
			width: 50px;
			height: 50px;
			background: gray;
		}
		
		#container-login{
			width : 100%;
			overflow: hidden;		
		}
		.wrapper-login{
			width : 1000px;
			margin: auto;
			float: right;
			position: relative;
		}
		#btn-login-underHeader{
			border-radius: 2px;
			display: inline;
			border: thick;
			margin: 0;
			font-size: 12px;
			padding: 7px;
			float: none;
		}
		#btn-logout-underHeader{
			border-radius: 2px;
			display: inline;
			border: thick;
			margin: 0;
			font-size: 12px;
			padding: 7px;
			float: none;
		}
		#btn-login-underHeader:hover{
			opacity: 0.7;
		}
		#btn-logout-underHeader:hover{
			opacity: 0.7;
			
		}
		#loginInfo input[type=text],[type=password]{
			outline: none;
			border: none;
		}
		a {
			text-decoration: none;
		}
		a:hover {
			font-weight: bold;
		}
		span {
			padding: 5px;
		}
		#logout-box{
			width: 40%;
			box-sizing: 	inherit;		
			float: right;
		}
	</style>
	<script>
	function login() {
		var id = document.getElementById('user_id').value;
		var pass = document.getElementById('user_pass').value;
		if(id=="" || pass==""	){
			alert('입력 정보를 확인해주세요');
			return;
		}		
		$("#loginInfo").attr({
			"action" : "/rest/loginCheck",
			"method" : "post"
		});
		$("#loginInfo").submit();
	};
	</script>
	<div id="container-login">
		<div class="wrapper-login">
				<div style="display: <%=inputBoxFlag%>">
						<form id="loginInfo">
							<span><a>회원가입</a></span>
							<span><a>아이디,비밀번호 찾기</a></span>
							<input type="text" placeholder="id" name="user_id" id="user_id">
							<input type="password" placeholder="pass" name="password" id="user_pass">
							<span><button id="btn-login-underHeader" type="button" onclick="login()">login</button></span>
						</form>
				</div>
				<div style="display: <%=infoBoxFlag%>" id="logout-box">
							<span><%=userName %>님</span>
							<span><button id="btn-logout-underHeader" type="button" onclick="location.href='/logout'">로그아웃</button></span>
				</div>
		</div>
	</div>
	