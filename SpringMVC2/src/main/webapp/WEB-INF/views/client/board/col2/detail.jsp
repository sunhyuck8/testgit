<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URI"%>
<%@page import="com.home.pooh.domain.InputFiles"%>
<%@page import="com.home.pooh.domain.BoardVO"%>
<%@page import="com.home.pooh.domain.Member"%>
<%@page import="com.home.pooh.model.repository.common.page.Paging"%>
<%@page import="com.home.pooh.domain.Board"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Member member = (Member)session.getAttribute("userInfo");
	BoardVO boardVO = (BoardVO)request.getAttribute("boardVO");
	List<InputFiles> fileList = boardVO.getInputFiles();
	List list = new ArrayList();
		for(int i =0;i<fileList.size();i++){
			list.add(fileList.get(i).getRefilename());			
		}
	String str = list.toString();
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
							<h3>상세</h3>
							<div class="formContainer">
								<form>
									<h4>제목</h4>
									<input type="hidden" name= "writer" value="">
									 <input type="text"	id="fname" name="title" placeholder="Title..." value="<%=boardVO.getTitle() %>" readonly="readonly">
									 <h4>내용</h4>
									<!-- <div contenteditable="true"  class="content-area" id="contentman" > -->
									<div  class="content-area" id="contentman" >
									
									<input type="hidden" name="type" value="2">
									<input type="hidden" name="content">
									
									</div>
									<div id="file-List">
										<div class="file-container"><!-- 파일첨부 -->
											<input type="file" id="inputfiles" class="fileInputList" name=files style="display: none">
										</div>
									</div>
								</form>
									<div><!-- 버튼 -->
										<input type="button" value="목록" onclick="post_list()">
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
		document.execCommand('defaultParagraphSeparator', false, 'p');//p태그로 감싸줌 원래는 div
		let fileInput= document.getElementsByClassName('fileInputList');
		const frame = document.querySelector('.content-area');
			
		decodeCustom(frame);
		
		
		
		
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
	//db의 내용을 순서 대로 붙이는 작업 
	function decodeCustom(frame) {
		const content ="<%=boardVO.getContent()%>";
		var decodeSplit = content.split('--Et--');
		let strPre = "<%=str%>";
		strPre = strPre.substring(1, strPre.length-1);
		/* console.log(strPre); */
		let strArray = strPre.split(',');
		/* console.log(strArray); */ 
		
		for(let i=0;i<decodeSplit.length;i++){
					console.log(i+decodeSplit[i]);			
				const pTag = document.createElement("p");					
				
				if(decodeSplit[i].includes('--Pt--')){  //fsdklfsdafkl --pt--  사진일 때
					var cText = decodeSplit[i].split('--Pt--')[0];	
					pTag.innerHTML = cText;
					frame.appendChild(pTag);
			        
			        const pTag2 = document.createElement("p");
			        let pSrc =strArray[0];				// 0번째 사진 불러오기
			        pSrc = pSrc.trim();					// 공백문자 제거
			        console.log(pSrc);					
			        const img = document.createElement('IMG');		//이미지 태그 만들어서
			        img.classList.add('inputFile');								//클래스도 부여 해주고
			        img.src = "/resources/data/"+pSrc;						// 붙이기도 해 
			        pTag2.insertAdjacentElement('beforeend', img); 		//img 태그 beforeend에 주입
			        strArray.shift();												//사진 배열 0번째 날리기  >> 다음 1번쨰가 0번째가 되서 붙여짐
			        frame.appendChild(pTag2);
			    }else{
			    	pTag.innerHTML = decodeSplit[i];		    	
					frame.appendChild(pTag);
			    }
			
				
		}
	}
	
	
	/* input 초기화 */
	function initInput() {
		let fileInput= document.getElementsByClassName('fileInputList');
		const frame = document.querySelector('.content-area');
		
			for(let i=0;i<fileInput.length;i++){
				
				fileInput[i].addEventListener('input',function(){
					if(!isImage(fileInput[i].files[0])) {				
						alert('Image 파일만 업로드 할 수 있습니다.');
						return;
					}
					frame.innerHTML += "<p> p태그";		// 추가
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
	}
	/* 엔터키 trigger 첨부된 이미지 옆으로 커서가 가는걸 막아줌 */
	function hang(frame){
		setTimeout(function(){
			const str = "<br><br>";
			frame.innerHTML += str;
		},1500);
	}
	function setContent() {
		const frame = document.querySelector('.content-area');
		const frameChild = frame.childNodes;
		var innerText="";
		for(let i =0;i<frameChild.length;i++){
			innerText +=frameChild[i].textContent;
		}
		$("input[name=content]").attr("value",innerText);
		console.log($("input[name=content]").val());
		
		//input마지막요소 제거하기
		var inputList  = document.getElementsByClassName('fileInputList');
		inputList[inputList.length-1].remove();
	}
</script>
</html>

