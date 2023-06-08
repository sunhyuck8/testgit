<%@ page  contentType="text/html; charset=UTF-8"%>
	<script>
		window.addEventListener("keydown", function(e){
					
			
				  if(e.code=='Digit1'){
					location.href="/";
				}else if(e.code=='Digit2'){
					location.href="/col1";
				}else if(e.code=='Digit3'){
					location.href="/col2";
				}else if(e.code=='Digit4'){
					location.href="/col4";
				}else if(e.code=='Digit5'){
					location.href="/col3";
				}else if(e.code=='Digit6'){
					location.href="/userInfo";
				}else if(e.code=='Digit7'){
					location.href="/testpage";
				}		  
		});
	</script>
	<div id="header-wrapper">
					<div class="container">
						<div class="row">
							<div class="col-12">

								<header id="header">
									<h1><a href="/" id="logo">Pooh</a></h1>
									<nav id="nav">
									<!--class="current-page-item"  -->
										<a href="/">홈</a>
										<a href="/col1">게시판1</a>
										<a href="/col2">게시판2</a>
										<a href="/col3">게시판3</a>
										<a href="/col4">게시판4</a>
										<a href="/userInfo">내정보</a>
										<a href="/testpage">테스트</a>
									</nav>
								</header>

							</div>
						</div>
					</div>
	</div>
				