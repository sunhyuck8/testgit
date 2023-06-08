<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="resources/admin/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="resources/admin/dist/css/adminlte.min.css">
<link rel="stylesheet" href="/resources/user/assets/css/main.css" />
<style>
#inlineSetting {
	display: block;
	width: 900px;
	margin: auto;
	padding-top: 200px;
}


.registform_container {
width : 80%;
	text-align: center;
  font-family: fantasy;
  margin: auto;
}
.frame , input::placeholder{
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}
input[type=text], input[type=password]{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  font-size: 30px;
}

input[type=button] {
  width: 100%;
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 20px;
  font-weight: bold;
}

input[type=button]:hover {
  background-color: #45a049;
}

div.wrapper {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.frame input{
	text-align: center;
	outline: none;	
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(function() {
		var btns = $("input[type='button']");
		
		$("input[type='button']").click(function() {
			if (this == btns[0]) {
				login();
			} else if (this == btns[1]) {
				regist();
			} else {
				cancel();
			}
		});
	});

	function login() {
		var id = document.getElementById('user_id').value;
		var pass = document.getElementById('user_pass').value;
		if(id=="" || pass==""	){
			alert('입력 정보를 확인해주세요');
			return;
		}		
		$("form").attr({
			"action" : "/rest/loginCheck",
			"method" : "post"
		});
		$("form").submit();
	};

	function regist() {
		let popUrl = "/member/registForm";
		let popOption = "width = 650px, height=700px, top=300px, left=300px, scrollbars=yes";
		window.open(popUrl, "회원 가입", popOption);
		console.log('regist');
	};

	function cancel() {
		console.log('cancel');
	};
</script>
</head>
<body>
	<div>
		<!-- Header -->
		<%@ include file="../inc/header.jsp"%>


		<div id="inlineSetting">

			<div class="registform_container">
				<h1>Pooh</h1>
				<p>로그인을 해주세요</p>
				<div class="wrapper">
					<div class="frame">
						<form id="login_info">
							<label for="fname">아이디</label> <input type="text" id="user_id"
								name="user_id" placeholder="Your ID.." value="user"> <label
								for="lname">비밀번호</label> <input type="password" id="user_pass"
								name="password" placeholder="Your Password.." value="2345">
						</form>
					</div>

					<input type="button" value="로그인" autofocus="autofocus">
					<hr>
					<input type="button" value="회원가입">

				</div>
			</div>
		



		</div>

	</div>

</body>
</html>