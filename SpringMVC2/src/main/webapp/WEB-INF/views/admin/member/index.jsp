<%@page import="com.home.pooh.domain.Member"%>
<%@page import="com.home.pooh.domain.Admin"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Member member= (Member)session.getAttribute("member");
	String imgName ="";
	if(member.getFilename()==null){
		imgName = "/resources/admin/dist/img/AdminLTELogo.png";
	}else{
		imgName =	"/resources/data/"+member.getFilename();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminLTE 3 | Dashboard</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="/resources/admin/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="/resources/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="/resources/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/resources/admin/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="/resources/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="/resources/admin/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet"
	href="/resources/admin/plugins/summernote/summernote-bs4.min.css">
<!-- MemberDetail  -->
<link rel="stylesheet" href="/resources/admin/css/memberDetail.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
/* 이미지 바꾸기  */
	function readURL(input) {
	 	  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('preview').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('preview').src = "";
		  } 
		}
		
/* form 전송 */
 $(function(){
	var btns = $("button[type='button']");
	
	$("button[type='button']").click(function(){
		regist();
	});
});

function regist(){
	$("form").attr({
		action:"/admin/member/Update",
		method:"post",
		enctype:"multipart/form-data"
	});
	$("form").submit();
}
</script>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<!-- Preloader -->
		<div
			class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake"
				src="/resources/admin/dist/img/AdminLTELogo.png" alt="AdminLTELogo"
				height="60" width="60">
		</div>



		<!-- topNavi -->
		<%@ include file="./inc/topNavi.jsp" %>
		<!-- /topNavi -->

		<!-- sideNavi -->
		<%-- <%@ include file="./inc/sideNavi.jsp" %> --%>
		<jsp:include page="./inc/sideNavi.jsp">
			<jsp:param value="<%=member.getName() %>" name="name"/>
			<jsp:param value="<%=member.getFilename() %>" name="filename"/>
		</jsp:include>
		<!-- /sideNavi -->
<!--===================================================================  -->
		<!-- main Content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<%@ include file="./inc/mainHeader.jsp" %>
			
			<!-- content  -------------------------------------------------------->
			<div>
<!----------------------------------------------------------------------------------------  -->
			<form>
			  <div class="container">
			    <h1>회원 상세 정보</h1>
				<div class="container1">
				    <hr>
				    <input type="hidden" name="filename" value="<%=member.getFilename()%>">
				    <input type="hidden" name = "member_id" value="<%=member.getMember_id() %>">
				    <label for="email"><b>---YourId</b></label>
				    <input type="text" value="<%=member.getUser_id() %>" placeholder="your ID" name="user_id" id="email" required>
				
				    <label for="psw"><b>Password</b></label>
				    <input type="text" value="<%=member.getPassword() %>" placeholder="Enter Password" name="password" id="psw" required>
				
				    <label for="psw-repeat"><b>--N a m e  </b></label>
				    <input type="text" value="<%=member.getName() %>" placeholder="your Name" name="name" id="psw-repeat" required>
				    <hr>
				</div>	
				
				<div class="container2">
					<hr>
					<Strong style=" font-weight:bold;">Photo</Strong>		
					<p>
					<input name="photo" type="file" onchange="readURL(this);" >
					<div class="frame">
						<img id="preview" src="<%=imgName %>" style="width: 180px;height: 173px";>
					</div>
				<hr>				
				</div>

			    <button type="button" class="registerbtn">수정하기</button>
			  </div>
			
			  <div class="container signin">
			  </div>
			</form>
<!----------------------------------------------------------------------------------------  -->				
			</div>
			<!-- /content  ------------------------------------------------------->
			
			
		</div>
		<!-- /.content-wrapper -->
<!--===================================================================  -->		
		<!-- footer -->
		<%@ include file= "../inc/footer.jsp" %>





		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>

	<!-- jQuery -->
	<script src="/resources/admin/plugins/jquery/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="/resources/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>
	<!-- Bootstrap 4 -->
	<script
		src="/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- ChartJS -->
	<script src="/resources/admin/plugins/chart.js/Chart.min.js"></script>
	<!-- Sparkline -->
	<script src="/resources/admin/plugins/sparklines/sparkline.js"></script>
	<!-- jQuery Knob Chart -->
	<script src="/resources/admin/plugins/jquery-knob/jquery.knob.min.js"></script>
	<!-- daterangepicker -->
	<script src="/resources/admin/plugins/moment/moment.min.js"></script>
	<script
		src="/resources/admin/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="/resources/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- Summernote -->
	<script src="/resources/admin/plugins/summernote/summernote-bs4.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="/resources/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/resources/admin/dist/js/adminlte.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/resources/admin/dist/js/demo.js"></script>
</body>
</html>