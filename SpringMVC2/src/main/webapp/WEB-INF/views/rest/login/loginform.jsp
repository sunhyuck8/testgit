<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="resources/admin/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="resources/admin/dist/css/adminlte.min.css">


<style>
#inlineSetting {
	display : block;
	width: 900px;
	margin: auto;
	padding-top: 200px;
	
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>


$(function(){
	var btns = $("button[type='button']");
	
	$("button[type='button']").click(function(){
		if(this==btns[0]){
			login();
		}else if(this==btns[1]){
			regist();
		}else{
			cancel();
		}
	});
});

function login(){
	console.log('login');
	$("form").attr({
		"action":"/rest/loginCheck",
		"method":"post"
	});
	$("form").submit();
};

function regist(){
	let popUrl = "/rest/member/registForm";
	let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
	window.open(popUrl,"회원 가입",popOption);
	console.log('regist');
};

function cancel(){
	console.log('cancel');
};
</script>
</head>
<body>
	<div id="inlineSetting">
		<div class="card card-info">
			<div class="card-header">
				<h3 class="card-title">로그인</h3>
			</div>
			<!-- /.card-header -->
			<!-- form start -->
			<form class="form-horizontal">
				<div class="card-body">
					<div class="form-group row">
						<label for="inputEmail3" class="col-sm-2 col-form-label">ID</label>
						<div class="col-sm-10">
							<input type="test" class="form-control" id="inputEmail3" name="user_id"
								placeholder="ID">
						</div>
					</div>
					<div class="form-group row">
						<label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="inputPassword3" name="password"
								placeholder="Password">
						</div>
					</div>
					<div class="form-group row">
						<div class="offset-sm-2 col-sm-10">
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck2"> <label class="form-check-label"
									for="exampleCheck2">Remember me</label>
							</div>
						</div>
					</div>
				</div>
				<!-- /.card-body -->
				<div class="card-footer">
					<button type="button" class="btn btn-info">로그인</button>
					<button type="button" class="btn btn-info">회원가입</button>
					<button type="button" class="btn btn-default float-right">취소하기</button>
				</div>
				<!-- /.card-footer -->
			</form>
		</div>
	</div>

</body>
</html>