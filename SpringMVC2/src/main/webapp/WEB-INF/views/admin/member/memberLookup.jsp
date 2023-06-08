<%@page import="java.util.List"%>
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
		List <Member> list = (List)session.getAttribute("memberList");
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
			
<!----------------------------------------------------------------------------------------  -->
			            <div class="card">
              <div class="card-header border-0">
                <h3 class="card-title">Products</h3>
                <div class="card-tools">
                  <a href="#" class="btn btn-tool btn-sm">
                    <i class="fas fa-download"></i>
                  </a>
                  <a href="#" class="btn btn-tool btn-sm">
                    <i class="fas fa-bars"></i>
                  </a>
                </div>
              </div>
              <div class="card-body table-responsive p-0">
                <table class="table table-striped table-valign-middle">
                  <thead>
                  <tr>
                    <th>No.</th>
                    <th>Name</th>
                    <th>ID</th>
                    <th>Password</th>
                    <th>Auth</th>
                  </tr>
                  </thead>
                  <tbody>
                  
                  <% for(Member selectMember : list){ %>
                  <tr>
                    <td>
                      <%=selectMember.getMember_id() %>
                    </td>
                    <td>
                      <img src="/resources/data/<%=selectMember.getFilename() %>" alt="Product 1" class="img-circle img-size-32 mr-2">
                      <a href="/admin/member/detail?member_id=<%=selectMember.getMember_id() %>"><%=selectMember.getName() %></a>
                    </td>
                    <td><%=selectMember.getUser_id() %></td>
                    <td>
                      <%=selectMember.getPassword() %>
                    </td>
                    <td>
                      <%
                     	 String auth = "";
                      	if(selectMember.getAuth()==0){
                      		auth = "관리자";
                      	}else if(selectMember.getAuth()==1){
                      		auth = "운영자";
                      	}else{
                      		auth = "사용자";
                      	}
                      %>
                      <%=auth %>
                    </td>
                  </tr>
              	<% } %>
                  </tbody>
                </table>
              </div>
            </div>
              <div  style="text-align: center">
              	<a href="#"><<</a>
                <%for(int i = 0;i<13;i++){ %>
                <a href="?page=<%=i %>" onclick="style.fontWeight='bold'"><%= i %></a>
                <%} %>
                <a href="#">>></a>
              </div>
              <button type="button" onclick="location.href='/admin/member/test'">test2</button>
<!----------------------------------------------------------------------------------------  -->				
			
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