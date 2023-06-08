<%@page import="com.home.pooh.model.repository.common.page.Paging"%>
<%@page import="com.home.pooh.domain.Board"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	
%>
<html>
<head>
<title>One Column - Minimaxing by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/user/assets/css/main.css" />

<script>
var img;
var div;
var a = 0.0;    //이미지 투명도
var b = 0.05;    //투명도 계수
var cFlag = false;   //투명도 판단 플래그
var equation = 0;
var flag = true;    //게임루프 플래그

    function init(){
        div = document.getElementById("start");
        img = document.createElement("img");
        img.src = "/resources/game/img/O2jam.png";
        div.appendChild(img);
        img.style.opacity=0.0;
    }
    
    function gameLoop(){
        if(flag){  // 조건에 맞으면 실행
            c = (equation%2==0 || equation>2)? cFlag = !cFlag : cFlag= cFlag
            equation = (cFlag == true)? a+=b : a-=b
            img.style.opacity=equation
            if(equation<-0.5){
                flag=!flag
                location.href="intro.html";
            }
        }
    }

   window.addEventListener("load",function(){
       init();
       
       setInterval("gameLoop()", 90)
   });
</script>

<style>
    #start{
        width: 1200px;
        height: 800px;
        background-color: black;
        margin: auto;
    }
</style>

</head>
<body>
	<div id="page-wrapper">

		<!-- Header -->
		<%@ include file="../inc/header.jsp"%>

		<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row main-row">
					<div class="col-12">
						<section>
						
						
					
							
							
							<div id="start">
							</div>
							
							
							
							
							
						</section>
					</div>
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
</html>