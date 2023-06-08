<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script >
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
</script>
</head>
<body>

</body>
</html>