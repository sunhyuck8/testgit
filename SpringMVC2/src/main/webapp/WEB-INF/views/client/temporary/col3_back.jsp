<%@ page contentType="text/html; charset=UTF-8"%>
<!--
	Minimaxing by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Two Column 2 - Minimaxing by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/user/assets/css/main.css" />

<style>
.container-left-div {
	width: 20%;
	height: 100%;
	float: left;
	background-color: #007294;
}

.container-right-div {
	float: left;
	width: 80%;
	height: 100%;
	border: 30px solid gray;
}

#main {
	padding-top: 0 !important;
	overflow: hidden;
}

.navi-left-element {
	width: 100%;
	margin: auto;
	padding: 0;
	font-size: 30px;
	cursor: pointer;
	text-align: center;
	margin: auto;
}

ul {
	padding: 0;
	width: 100%;
}

li {
	width: 100%;
	margin: 0;
	color: white;
	padding: 20px;
	background: transparent
}

li:hover {
	background: gray;
}
/* 글쓰기 */
:root { -
	-bgColor: #3a3a3a; -
	-hoverBg: #616161; -
	-text: #bbb;
}

.container-write {
	/* width: clamp(0px, 100%, 512px); */
	width: 100%;
	margin: auto;
	text-align: center;
}

.label {
	width: 100%;
	height: 100%;
	margin: 0px auto;
	cursor: pointer;
	background-color: var(- -bgColor);
}

.inner {
	width: 100%;
	height: 128px margin: 64px auto;
	border-radius: 8px;
	font-size: 16px;
	line-height: 128px;
	background-color: var(- -bgColor);
	color: var(- -text);
}

@media ( any-hover : hover) {
	.inner:hover {
		background-color: var(- -hoverBg);
	}
}

.label--hover {
	background-color: var(- -hoverBg);
}

.preview-title {
	font-size: 32px;
	margin-bottom: 8px;
}

.preview {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 16px;
	padding: 16px;
	margin-bottom: 16px;
	border-radius: 8px;
	align-items: center;
	background-color: var(- -bgColor);
}

.embed-img {
	width: 100%;
	height: 128px;
	object-position: center;
	object-fit: cover;
	border-radius: 8px;
}

.underline {
	border-bottom: 2px solid gray !important;
	font-weight: bold;
}
/* 글쓰기 끝 */
/* fullpage */
.section {
	width: 100%;
	height: 100%;
	position: relative;
}

#section1 {
	background-color: aliceblue;
}

#section2 {
	background-color: lightpink;
}

#section3 {
	background-color: coral;
}

#section4 {
	background-color: aqua;
}

#section-wrapper {
	width: 100%;
	height: 100%;
	margin: auto;
	/* overflow: hidden; */
	position: relative;
}

#section-container {
	width: 100%;
	height: 100%;
	margin: auto;
	position: relative;
	overflow: hidden;
}
/* fullpage 끝 */
/* 게시판 목록 */
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
/* 게시판 목록 끝*/
/* 게시판 글쓰기 */
.formContainer input[type=text], select, textarea {
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

.content-area {
	height: 600px;
	border: 1px solid black;
	text-decoration: none;
	text-align: center;
	overflow: scroll;
}

.inputFile {
	width: 450px;
	height: 450px;
}
/* 게시판 글쓰기 끝*/
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<div id="page-wrapper">

		<!-- Header -->
		<%@ include file="../inc/header.jsp"%>
		<!-- UnderHeader -->
		<%@ include file="../inc/underHeader.jsp"%>

		<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="container-left-div">
					<div class="wrapper-left-div">
						<nav class="navi-left-element">
							<ul>
								<li>navi1</li>
								<li>navi2</li>
								<li>navi3</li>
								<li>navi4</li>
							</ul>
						</nav>
					</div>
				</div>
				<div class="container-right-div">

					<main class="container-write">

					<!-- 	<h2>글쓰기</h2>
						<input type="text" class="underline" value=""
							placeholder="title...">

						<div contenteditable="true"></div>
						<label class="label" id="label" for="input">
							<div class="inner" id="inner">드래그하거나 클릭해서 업로드</div>
						</label>
						 <input id="input" class="input" accept="image/*" type="file" required="true" multiple="true" hidden="true">
						<p class="preview-title">preview</p>
						<div class="preview" id="preview"></div> -->

						<div id="section-container">
							<div id="section-wrapper">
								<div class="section" id="section1">
									<div id="section1_detail">
										<h2>게시판 3</h2>
										<table>
											<tr>
												<th>분류</th>
												<th>제목</th>
												<th>글쓴이</th>
												<th>날짜</th>
												<th>조회</th>
												<th>추천</th>
											</tr>

											<tr>
												<td>0</td>
												<td>1<a href="#">제목</a></td>
												<td>1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
											</tr>
											<tr>
												<td>0</td>
												<td>1<a href="#">제목</a></td>
												<td>1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
											</tr>
											<tr>
												<td>0</td>
												<td>1<a href="#">제목</a></td>
												<td>1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
											</tr>
										</table>
									</div>
								</div>
								<!-- -------------------------------------section2 -->
								<div class="section" id="section2">
									<h3>글 쓰기</h3>
									<div class="formContainer">
										<form>
											<h4>제목</h4>
											<input type="hidden" name="writer" value=""> <input
												type="text" id="fname" name="title" placeholder="Title..."
												value="">
											<h4>내용</h4>
											<div contenteditable="true" class="content-area"
												id="contentman">
												<input type="hidden" name="type" value="2"> <input
													type="hidden" name="content" id="hdContent">

											</div>
											<div id="file-List">
												<div class="file-container">
													<!-- 파일첨부 -->
													<input type="file" id="inputfiles" class="fileInputList"
														name=files>
												</div>
											</div>
										</form>
										<div>
											<!-- 버튼 -->
											<input type="button" value="목록" onclick="post_list()">
											<input type="button" value="글등록" onclick="registContent()">
										</div>
									</div>
								</div>
								<!-- -------------------------------------section2 끝-->
								<div class="section" id="section3"></div>
								<div class="section" id="section4"></div>
							</div>
						</div>

					</main>


				</div>
			</div>
		</div>

		<!-- Footer -->
		<%@ include file="../inc/footer.jsp"%>

	</div>

	<!-- Scripts -->
	<script src="/resources/user/assets/js/jquery.min.js"></script>
	<script src="/resources/user/assets/js/browser.min.js"></script>
	<script src="/resources/user/assets/js/breakpoints.min.js"></script>
	<script src="/resources/user/assets/js/util.js"></script>
	<script src="/resources/user/assets/js/main.js"></script>
</body>

<script>


/* 스크롤 구현 */
 var wrapperScroll = $("#section-wrapper"); 
 var page = 1; //현재 navi의 수준
 var preNum = 0; // 이전 navi의 수준
 $('nav.navi-left-element ul li')[0].style.background = "gray";//첫페이지니까[0]
 
window.addEventListener("wheel", function(e){ //스크롤방지 
    e.preventDefault();	
},{passive : false});

wrapperScroll.animate({scrollTop : 0},10);

$(window).on("wheel", function(e) {
    if(wrapperScroll.is(":animated")) return;
    if(e.originalEvent.deltaY > 0) {
        if(page == 4) return;
        page++;
    } else if(e.originalEvent.deltaY < 0) {
        if(page == 1) return;
        page--;
    }
    var posTop =(page-1) * wrapperScroll.height();
    wrapperScroll.animate({top : -posTop});
    
    $('nav.navi-left-element ul li')[preNum].style.background = "#007294";
    $('nav.navi-left-element ul li')[page-1].style.background = "gray";
    preNum = page-1;
});
/* 스크롤 구현 끝 */
/* 글쓰기 게시판 */
	const frame = document.querySelector('.content-area');
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
/* 글쓰기 게시판 끝*/
/* drag and drop */

	var input = document.getElementById("inputfiles");
	var inputDiv = document.getElementById("contentman");
	
	input.addEventListener("change", (event) => {
		  /* const files = changeEvent(event);
		  handleUpdate(files); */
		  console.log("변함");
		});
	inputDiv.addEventListener("mouseover", (event) => {
		   event.preventDefault();
		  /*const label = document.getElementById("label");
		  label?.classList.add("label--hover"); */
		console.log("마우스오버1");
		});
	inputDiv.addEventListener("mouseout", (event) => {
		 event.preventDefault();
		 /* const label = document.getElementById("label");
		  label?.classList.remove("label--hover"); */
		  console.log("마우스아웃1");
		});
	document.addEventListener("dragenter", (event) => {
		  event.preventDefault();
		  console.log("dragenter");
		  /* if (event.target.className === "inner") {
		    event.target.style.background = "#616161"; 
		  }*/
		});
	document.addEventListener("dragover", (event) => {
		  console.log("dragover");
		  event.preventDefault();
		});
	document.addEventListener("dragleave", (event) => {
		  event.preventDefault();
		  console.log("dragleave");
		 /*  if (event.target.className === "inner") {
		    event.target.style.background = "#3a3a3a";
		  } */
		});

		document.addEventListener("drop", (event) => {
		  event.preventDefault();
		  console.log("drop");
		  /* if (event.target.className === "inner") {
		    const files = event.dataTransfer?.files;
		    event.target.style.background = "#3a3a3a";
		    handleUpdate([...files]);
		  } */
		}); 
/* 
var input = document.getElementById("input");
var initLabel = document.getElementById("label");

input.addEventListener("change", (event) => {
  const files = changeEvent(event);
  handleUpdate(files);
});

initLabel.addEventListener("mouseover", (event) => {
  event.preventDefault();
  const label = document.getElementById("label");
  label?.classList.add("label--hover");
});

initLabel.addEventListener("mouseout", (event) => {
  event.preventDefault();
  const label = document.getElementById("label");
  label?.classList.remove("label--hover");
});

document.addEventListener("dragenter", (event) => {
  event.preventDefault();
  console.log("dragenter");
  if (event.target.className === "inner") {
    event.target.style.background = "#616161";
  }
});

document.addEventListener("dragover", (event) => {
  console.log("dragover");
  event.preventDefault();
});

document.addEventListener("dragleave", (event) => {
  event.preventDefault();
  console.log("dragleave");
  if (event.target.className === "inner") {
    event.target.style.background = "#3a3a3a";
  }
});

document.addEventListener("drop", (event) => {
  event.preventDefault();
  console.log("drop");
  if (event.target.className === "inner") {
    const files = event.dataTransfer?.files;
    event.target.style.background = "#3a3a3a";
    handleUpdate([...files]);
  }
}); */


function changeEvent(event){
  const { target } = event;
  return [...target.files];
};

function handleUpdate(fileList){
  const preview = document.getElementById("preview");

  fileList.forEach((file) => {
    const reader = new FileReader();
    reader.addEventListener("load", (event) => {
      const img = el("img", {
        className: "embed-img",
        src: event.target?.result,
      });
      const imgContainer = el("div", { className: "container-img" }, img);
      preview.append(imgContainer);
    });
    reader.readAsDataURL(file);
  });
};

function el(nodeName, attributes, ...children) {
  const node =
    nodeName === "fragment"
      ? document.createDocumentFragment()
      : document.createElement(nodeName);

  Object.entries(attributes).forEach(([key, value]) => {
    if (key === "events") {
      Object.entries(value).forEach(([type, listener]) => {
        node.addEventListener(type, listener);
      });
    } else if (key in node) {
      try {
        node[key] = value;
      } catch (err) {
        node.setAttribute(key, value);
      }
    } else {
      node.setAttribute(key, value);
    }
  });

  children.forEach((childNode) => {
    if (typeof childNode === "string") {
      node.appendChild(document.createTextNode(childNode));
    } else {
      node.appendChild(childNode);
    }
  });

  return node;
}
</script>
</html>