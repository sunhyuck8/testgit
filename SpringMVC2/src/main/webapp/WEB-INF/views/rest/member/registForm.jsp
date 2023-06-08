<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	background-color: black;
}

* {
	box-sizing: border-box;
}

/* Add padding to containers */
.container {
	padding: 16px;
	background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	display: inline-block;
	border: none;
	background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
	background-color: #ddd;
	outline: none;
}

/* Overwrite default styles of hr */
hr {
	border: 1px solid #f1f1f1;
	margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
	background-color: #04AA6D;
	color: white;
	padding: 16px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
	opacity: 0.9;
}

.registerbtn:hover {
	opacity: 1;
}

/* Add a blue text color to links */
a {
	color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
	background-color: #f1f1f1;
	text-align: center;
}

.thumbnail {
	width: 200px;
	height: 200px;
	border-radius: 70%;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
window.addEventListener('load', function() {
	
	const container = document.querySelector('.container');
	const frame = container.querySelector('.frame');
	const fileInput = container.querySelector('input[type="file"]');
	
	fileInput.addEventListener('input', () => {
		
		if(!isImage(fileInput.files[0])) {
			alert('Image 파일만 업로드 할 수 있습니다.');
			return;
		}
		
		const reader = new FileReader();
		reader.addEventListener('load', () => {
			
			const img = document.createElement('IMG');
			img.classList.add('thumbnail');
			img.src = reader.result;
			frame.insertAdjacentElement('beforeend', img);
		});
		reader.readAsDataURL(fileInput.files[0]);
	});
	function isImage(file){
		return file.type.indexOf('image') >= 0;
	}
});
//===================================
$(function(){
	var btns = $("button[type='button']");
	
	$("button[type='button']").click(function(){
		regist();
	});
});

function regist(){
	$("form").attr({
		action:"/rest/registMember",
		method:"post",
		enctype:"multipart/form-data"
	});
	$("form").submit();
}
</script>
</head>
<body>

	<form>
		<div class="container">
			<h1>회원가입</h1>
			<hr>
			<label for="email"><b>Id</b></label> <input type="text"
				placeholder="Your Id..." name="user_id" id="email" required>
			<label for="psw"><b>Password</b></label> <input type="password"
				placeholder="Your Password..." name="password" id="psw" required>

			<label for="psw-repeat"><b>Name</b></label> <input type="text"
				placeholder="Your Name.." name="name" id="psw-repeat" required>

			<b>Photo</b>
			<div class="container">
				<input name="photo" type="file" >
				<hr>
				<div class="frame"></div>
			</div>
			<hr>
	</form>

			<button type="button" class="registerbtn">회원 등록</button>
		</div>

		<div class="container signin">
			<p>
				이미 회원이신가요? <a href="javascript:window.close();">로그인 페이지</a>
			</p>
		</div>

</body>
</html>
