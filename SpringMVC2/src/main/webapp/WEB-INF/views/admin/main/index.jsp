<%@page import="com.home.pooh.domain.Member"%>
<%@page import="com.home.pooh.domain.Admin"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
Member member = (Member)session.getAttribute("test");
String path = session.getServletContext().getRealPath("/");
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
	href="resources/admin/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="resources/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="resources/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="resources/admin/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="resources/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="resources/admin/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet"
	href="resources/admin/plugins/summernote/summernote-bs4.min.css">

</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Preloader -->
		<div
			class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake"
				src="resources/admin/dist/img/AdminLTELogo.png" alt="AdminLTELogo"
				height="60" width="60">
		</div>

		<!-- side_top_navi -->
		 <%@ include file="../inc/top_navi.jsp"%> 
		<!-- /.navbar -->

		<!-- side_left_navi-->
		<!-- ####################################################### -->
		<!-- ######################side_navi  ########################## -->
		<!-- ####################################################### -->
		<%-- <%@ include file="../inc/side_navi.jsp"%>  --%>
		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="index3.html" class="brand-link"> <img
				src="resources/admin/dist/img/AdminLTELogo.png" alt="AdminLTE Logo"
				class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">AdminLTE 3</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="/resources/data/<%=member.getFilename() %>"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<a href="/admin/member/detail?member_id=<%=member.getMember_id() %>" class="d-block"><%=member.getName() %></a>
					</div>
				</div>

				<!-- SidebarSearch Form -->
				<div class="form-inline">
					<div class="input-group" data-widget="sidebar-search">
						<input class="form-control form-control-sidebar" type="search"
							placeholder="Search" aria-label="Search">
						<div class="input-group-append">
							<button class="btn btn-sidebar">
								<i class="fas fa-search fa-fw"></i>
							</button>
						</div>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item menu-open"><a href="#"
							class="nav-link active"> <i
								class="nav-icon fas fa-tachometer-alt"></i>
								<p>
									회원관리 <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="./index.html"
									class="nav-link active"> <i class="far fa-circle nav-icon"></i>
										<p>회원 조회/검색</p>
								</a></li>
								<li class="nav-item"><a href="./index2.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Dashboard v2</p>
								</a></li>
								<li class="nav-item"><a href="./index3.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Dashboard v3</p>
								</a></li>
							</ul></li>

						<li class="nav-item menu-open"><a href="#"
							class="nav-link active"> <i
								class="nav-icon fas fa-tachometer-alt"></i>
								<p>
									게시글관리 <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="./index.html"
									class="nav-link active"> <i class="far fa-circle nav-icon"></i>
										<p>Dashboard v1</p>
								</a></li>
								<li class="nav-item"><a href="./index2.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Dashboard v2</p>
								</a></li>
								<li class="nav-item"><a href="./index3.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Dashboard v3</p>
								</a></li>
							</ul></li>

					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>
		
		<!-- ####################################################### -->
		<!-- ######################side_navi  ########################## -->
		<!-- ####################################################### -->






		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
			
				<div class="container-fluid">
					<div class="row mb-2">
					
					
						<div class="col-sm-6" style="border: 1px solid black">
							<%-- <h1 class="m-0" style="background-color: red"><%=admin.getHost_id()%></h1> --%>
							<!-- ================================================ -->
							<div class="row" style="border: 1px solid black">
								<div class="col-12">
									<h4>게시판1</h4>
									<div class="post">
										<div class="user-block">
											<img class="img-circle img-bordered-sm"
												src="resources/admin/dist/img/user1-128x128.jpg"
												alt="user image"> <span class="username"> <a
												href="#">사용자1</a>
											</span> <span class="description">Shared publicly - 7:45 PM
												today</span>
										</div>
										<!-- /.user-block -->
										<p>내용1</p>

										<p>
											<a href="#" class="link-black text-sm"><i
												class="fas fa-link mr-1"></i> Demo File 1 v2</a>
										</p>
									</div>

									<div class="post clearfix">
										<div class="user-block">
											<img class="img-circle img-bordered-sm"
												src="resources/admin/dist/img/user7-128x128.jpg"
												alt="User Image"> <span class="username"> <a
												href="#">사용자2</a>
											</span> <span class="description">Sent you a message - 3 days
												ago</span>
										</div>
										<!-- /.user-block -->
										<p>내용2</p>
										<p>
											<a href="#" class="link-black text-sm"><i
												class="fas fa-link mr-1"></i> Demo File 2</a>
										</p>
									</div>

									<div class="post">
										<div class="user-block">
											<img class="img-circle img-bordered-sm"
												src="resources/admin/dist/img/user1-128x128.jpg"
												alt="user image"> <span class="username"> <a
												href="#">사용자3</a>
											</span> <span class="description">Shared publicly - 5 days
												ago</span>
										</div>
										<!-- /.user-block -->
										<p>내용3</p>

										<p>
											<a href="#" class="link-black text-sm"><i
												class="fas fa-link mr-1"></i> Demo File 1 v1</a>
										</p>
									</div>
								</div>
							</div>
							<div style="background-color: red">red</div>
							<!-- ================================================ -->
						</div>

						<!-- /.col -->
						<div class="col-sm-6" style="border: 1px solid black">
							<ol class="breadcrumb float-sm-right" style="width: 100%," >
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Dashboard v1</li>
							</ol>
							<!-- ================================================ -->
							<div class="row" style="border: 1px solid black">
								<div class="col-12">
									<h4>게시판1</h4>
									<div class="post">
										<div class="user-block">
											<img class="img-circle img-bordered-sm"
												src="resources/admin/dist/img/user1-128x128.jpg"
												alt="user image"> <span class="username"> <a
												href="#">사용자1</a>
											</span> <span class="description">Shared publicly - 7:45 PM
												today</span>
										</div>
										<!-- /.user-block -->
										<p>내용1</p>

										<p>
											<a href="#" class="link-black text-sm"><i
												class="fas fa-link mr-1"></i> Demo File 1 v2</a>
										</p>
									</div>

									<div class="post clearfix">
										<div class="user-block">
											<img class="img-circle img-bordered-sm"
												src="resources/admin/dist/img/user7-128x128.jpg"
												alt="User Image"> <span class="username"> <a
												href="#">사용자2</a>
											</span> <span class="description">Sent you a message - 3 days
												ago</span>
										</div>
										<!-- /.user-block -->
										<p>내용2</p>
										<p>
											<a href="#" class="link-black text-sm"><i
												class="fas fa-link mr-1"></i> Demo File 2</a>
										</p>
									</div>

									<div class="post">
										<div class="user-block">
											<img class="img-circle img-bordered-sm"
												src="resources/admin/dist/img/user1-128x128.jpg"
												alt="user image"> <span class="username"> <a
												href="#">사용자3</a>
											</span> <span class="description">Shared publicly - 5 days
												ago</span>
										</div>
										<!-- /.user-block -->
										<p>내용3</p>

										<p>
											<a href="#" class="link-black text-sm"><i
												class="fas fa-link mr-1"></i> Demo File 1 v1</a>
										</p>
									</div>
								</div>
							</div>
							<div style="background-color: red"><%=member %></div>
							<!-- ================================================ -->
							
						</div>
						<!-- /.col -->
					</div>
					
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->







		<!-- footer -->
		<%@ include file="../inc/footer.jsp"%>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>

	<!-- jQuery -->
	<script src="resources/admin/plugins/jquery/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="resources/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>
	<!-- Bootstrap 4 -->
	<script
		src="resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- ChartJS -->
	<script src="resources/admin/plugins/chart.js/Chart.min.js"></script>
	<!-- Sparkline -->
	<script src="resources/admin/plugins/sparklines/sparkline.js"></script>
	<!-- jQuery Knob Chart -->
	<script src="resources/admin/plugins/jquery-knob/jquery.knob.min.js"></script>
	<!-- daterangepicker -->
	<script src="resources/admin/plugins/moment/moment.min.js"></script>
	<script
		src="resources/admin/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="resources/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- Summernote -->
	<script src="resources/admin/plugins/summernote/summernote-bs4.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="resources/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="resources/admin/dist/js/adminlte.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="resources/admin/dist/js/demo.js"></script>
</body>
</html>