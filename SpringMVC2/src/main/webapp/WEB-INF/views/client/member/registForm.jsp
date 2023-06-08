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
window.addEventListener('load', function() { //1. 윈도우 로드 될시 function이하의 코딩시작
	
	const container = document.querySelector('.container');
	const frame = container.querySelector('.frame');
	const fileInput = container.querySelector('input[type="file"]');
	
	fileInput.addEventListener('input', () => {		//2. input 이 될시 실행 함수 
		
		if(!isImage(fileInput.files[0])) {				//3. 파일이 아닐경우 return
			alert('Image 파일만 업로드 할 수 있습니다.');
			return;
		}
		
		const reader = new FileReader();			//4. 파일 읽어낼 리더 생성
		reader.addEventListener('load', () => {  
			
			const img = document.createElement('IMG');	//5. img 요소를 생성
			img.classList.add('thumbnail'); 		// 6.img요소에 'thumbnail'클래스를 부여
			img.src = reader.result;
			frame.insertAdjacentElement('beforeend', img);
		});
		reader.readAsDataURL(fileInput.files[0]);
	});
	function isImage(file){			//파일이 들어 왔을때 file에 'image'의 요소가 없을 시 -1, 있을 땐 0이기 때문에 '>='를 통해 0 보다 크면 true를 반환 
		return file.type.indexOf('image') >= 0;	
	}
});
//===================================
$(function(){
	var btns = $("button[type='button']");
	
	$("button[type='button']").click(function(){
			regist();
	});
	
	$("#user_id").keyup(function(){
		idDuplicateCheck();
	});
});
	

function idDuplicateCheck() { // url이 ajaxTest인데 왜 되는거지
	var idVal =$('input[name=user_id]').val();
	$.ajax({
	  url : "ajaxTest",
	  type : "post",
	  data : {"id" :idVal},
	  success : function(data) {
	  	if(data==1){
		  	$('#id_check').html('이미 사용중인 아이디 입니다.');
		  	$('#id_check').attr('color','#Black');
	  	}else if(data==0){
		  	$('#id_check').html('사용가능한 아이디 입니다.');
		  	$('#id_check').attr('color','#Black');
	  	}
	  },
	  error : function() {
	  	alert("error");
	  }
	})
}


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
			<label for="email"><b>Id</b></label> 
				<input type="text" placeholder="Your Id..." name="user_id" id="user_id" required> 
				<div><font id="id_check"></font></div>
				<p>
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
