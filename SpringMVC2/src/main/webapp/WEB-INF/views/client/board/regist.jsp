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
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	function post_regist() {
		$("form").attr({
			"action":"/col1/board/regist",
			"method":"post"
		});
		$("form").submit();
	}
	
	function post_list() {
		location.href="/col1";
	}

</script>
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
							<h3>글 쓰기</h3>

							<div class="formContainer">
								<form>
									<input type="hidden" name= "writer" value="<%=member.getName()%>">
									
									 <input type="text"	id="fname" name="title" placeholder="Title..." value="">


									<textarea id="subject" name="content"
										placeholder="Write something.." style="height: 200px"></textarea>

									<input type="button" value="목록" onclick="post_list()">
									<input type="button" value="글등록" onclick="post_regist()">
								</form>
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

