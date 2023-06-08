<%@page import="com.home.pooh.domain.Member"%>
<%@page import="com.home.pooh.model.repository.common.page.Paging"%>
<%@page import="com.home.pooh.domain.Board"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Member member = (Member)session.getAttribute("userInfo");
%>
<html>
<head>
<title>One Column - Minimaxing by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/user/assets/css/main.css" />
<style>
table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	border: 1px solid #ddd;
}

th, td {
	text-align: left;
	padding: 16px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}


body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=button] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=button]:hover {
  background-color: #45a049;
}

.formContainer {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
.content-area{
	height: 600px;
	border: 1px solid black;
	text-decoration: none;
	text-align: center;
	overflow: scroll;
}
.inputFile{
	width: 450px;
	height: 450px;
}
</style>

</head>
<body>
	<div id="page-wrapper">

		<!-- Header -->
		<%@ include file="../../inc/header.jsp"%>

		<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row main-row">
					<div class="col-12">

						<section>
							<h3>글 쓰기</h3>
							<div class="formContainer">
								<form>
									<h4>제목</h4>
									<input type="hidden" name= "writer" value="<%=member.getName()%>">
									 <input type="text"	id="fname" name="title" placeholder="Title..." value="">
									 <h4>내용</h4>
									<div contenteditable="true"  class="content-area" id="contentman" >
										<input type="hidden" name="type" value="2">
										<input type="hidden" name="content" id="hdContent"> 
									
									
									
									</div>
									<div id="file-List">
										<div class="file-container"><!-- 파일첨부 -->
											<input type="file" id="inputfiles" class="fileInputList" name=files>
										</div>
									</div>
								</form>
									<div><!-- 버튼 -->
										<input type="button" value="목록" onclick="post_list()">
										<input type="button" value="글등록" onclick="registContent()">
									</div>
							</div>
						</section>

					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<%@ include file="../../inc/footer.jsp"%>

	</div>

	<!-- Scripts -->
	<script src="/resources/user/assets/js/jquery.min.js"></script>
	<script src="/resources/user/assets/js/browser.min.js"></script>
	<script src="/resources/user/assets/js/breakpoints.min.js"></script>
	<script src="/resources/user/assets/js/util.js"></script>
	<script src="/resources/user/assets/js/main.js"></script>


</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	let level = 0; //글쓰기와 사진의 높이를 나타낼 변수
	const frame = document.querySelector('.content-area');
	function registContent(){
		setContent();
		$("form").attr({
			action:"/col2/boardContentRegist",
			method:"post",
			enctype:"multipart/form-data"
		});
		$("form").submit();
	}
	
	function post_list() {
		location.href="/col2";
	}
	
	/* 파일 다중 업로드 처리  */
	window.addEventListener('load',function(){
				initInput();
	});
 
	function isImage(file){			 
		return file.type.indexOf('image') >= 0;	
	}
	/* 파일 추가 나타내기 */
	function addButtonFileInput() {
		const str = '<br><input type="file" id="inputfiles" class="fileInputList" name=files>';
		$(".file-container").append(str);
		
		initInput();
	}
	
	/* input 초기화 */
	function initInput() {
		let fileInput= document.getElementsByClassName('fileInputList');
		
			for(let i=0;i<fileInput.length;i++){
				
				fileInput[i].addEventListener('input',function(){
					if(!isImage(fileInput[i].files[0])) {				
						alert('Image 파일만 업로드 할 수 있습니다.');
						return;
					}
					frame.innerHTML += "\n 　";		// 추가
					const reader = new FileReader();	
					reader.addEventListener('load', function(){
						const img = document.createElement('IMG');
						
						const divImg = document.createElement('div');
						img.classList.add('inputFile');
						img.src = reader.result;
						
						divImg.insertAdjacentElement('beforeend', img);
						frame.insertAdjacentElement('beforeend', divImg);
					});
						reader.readAsDataURL(fileInput[i].files[0]);
						addButtonFileInput();
						hang(frame);
				});  
			}
			/* divideLevel(); */
	}
	/* 엔터키 trigger 첨부된 이미지 옆으로 커서가 가는걸 막아줌 */
	function hang(frame){
		setTimeout(function(){
			const str = "<br><br>";
			frame.innerHTML += str;
		},1500);
	}
	function setContent() {
		const hdContent = document.getElementById('hdContent');
		var innerText=frame.innerText;
		var customEncodeEt = innerText.replaceAll('\n','--Et--');
		var customEncodeEtPt = customEncodeEt.replaceAll('　','--Pt--');
		/* const encodeText = encodeURIComponent(innerText); */
		//decodeURIComponent
		/* const frameChild = frame.childNodes; */
		/* for(let i =0;i<frameChild.length;i++){
			innerText +=frameChild[i].textContent;
		} */
		
		$("input[name=content]").attr("value",customEncodeEtPt);
		
		//input마지막요소 제거하기
		var inputList  = document.getElementsByClassName('fileInputList');
		inputList[inputList.length-1].remove();
	}
	window.addEventListener("keyup", function(e){
		if(event.keyCode==13){
			//divideLevel();
		}
	});
	function divideLevel() {
		const str = "<p style='display: none'>"+"--boundary"+level+"</p>";
		frame.innerHTML += str;
		level++;
	}
	
	
</script>
</html>

