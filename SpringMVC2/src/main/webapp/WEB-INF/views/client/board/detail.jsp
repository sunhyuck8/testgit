<%@page import="com.home.pooh.domain.Comment"%>
<%@page import="com.home.pooh.model.repository.common.page.Paging"%>
<%@page import="com.home.pooh.domain.Board"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Board board= (Board)request.getAttribute("board");
	List commentList = (List)request.getAttribute("commentList");
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
	
	function post_update() {
		console.log('update');
		$("#form1").attr({
			"action":"/col1/board/update",
			"method":"post"
		});
		$("#form1").submit();
	}

	function post_delete() {
		console.log('delete');
		$("form").attr({
			"action":"/col1/board/delete",
			"method":"post"
		});
		$("form").submit();
	}
	function post_list() {
		location.href="/col1";
	}
	
	function replyComments(){
		var formdata = $('#form2').serialize();
		$.ajax({
			url : "/col1/comments",
			type : "post",
			dataType :"json",
			data : formdata,
			success : function(result){
				var str = '';
				str += '<div>';
				str += '<input type="hidden" name="board_id" value="<%=board.getBoard_id()%>">';
				str += '<input type="text" value="'+result.cmsg+'" style="width: 60%" name="cmsg">';
				str += '<input type="text" value="'+result.cwriter+'" style="width: 20%" name="cwriter">';
				str +=' <input type="text" value="등록일" style="width: 10%" name="cdate">';
				str += '</div>';
				$('#commmentWrapper').append(str);
			}
		})
	}
	//댓글에 댓글 등록하기
	function registRecomment(comment_id) {
		var rmsg = $('#inputRecomment'+comment_id).val();
	 	$.ajax({
			url : "/col1/recommentRegist?comment_id="+comment_id,
			type : "post",
			dataType :"json",
			data : {"rmsg" : rmsg},
			success : function(result){
				alert('등록성공');
				var str = '';
				str += '<div>';
				str +=' recomment_id = '+result.recomments_id+'//'+result.rmsg+'';
				str += '</div>';
				$('#recommentsListShow'+comment_id).append(str);
			},
			error : function(jqXHR, textStatus, errorThrown){
				if(jqXHR.status==200){  //user이 null이라면 
					alert('로그인이 필요한 페이지 입니다.');
					location.href = "/login";
				}
			}
		}) 
		
	}
	///
	function replyCommentsList(comment_id){
		$.ajax({
			url : "/col1/recommentList?comment_id="+comment_id,
			type : "post",
			dataType :"json",
			success : function(result){
				$.each(result,function(index, item){
					var str = "";
					str += '<div>';
					str += index+"번 댓글 :"+item.rmsg;
					str += '</div>';
					$('#recommentsListShow'+comment_id).append(str);
				});
			}
		})
	}
	
	//댓글 하나 등록
	function registComment() {
		$("#form2").attr({
			"action":"/col1/commentRegist?board_id=<%=board.getBoard_id()%>",
			"method":"post"
		});
		$("#form2").submit();
	}
	//댓글 작성하는 창 붙이기
	function makeRecommentFrame(index) {
		var replyCommentFrame= document.getElementById(""+index);
			replyCommentFrame.style.display = 'block';
	}
	//댓글창 끄기
	function cancelRecommentFrame(index) {
		var replyCommentFrame= document.getElementById(""+index);
		replyCommentFrame.style.display = 'none';
	}
	//답글창 키고 끄기 
	function showRecomment(comment_id) {
		var recommentList = document.getElementById("recomment"+comment_id);
		var replyButton = document.getElementById("recommentListButton"+comment_id);
		   if(recommentList.style.display=='none'){ 		
			   recommentList.style.display = 'block'; 	
			   replyButton.style.color = "#0000ff";
			   replyCommentsList(comment_id);
           }else{ 		
        	   recommentList.style.display = 'none'; 
        	   replyButton.style.color = "#5d93a2";
        	   $('#recommentsListShow'+comment_id).children().remove();
           } 
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
							<h3>글 상세</h3>

							<div class="formContainer">
								<form id="form1">
									<input type="hidden" name="board_id" value="<%=board.getBoard_id()%>">
									<label for="fname">title</label> <input type="text"
										id="fname" name="title" placeholder="Your name.." value="<%=board.getTitle()%>">

									<label for="lname">writer</label> <input type="text"
										id="lname" name="writer" placeholder="Your last name.." value="<%= board.getWriter()%>">

									<textarea id="subject" name="content"
										placeholder="Write something.." style="height: 200px"><%=board.getContent() %></textarea>

									<input type="button" value="수정하기" onclick="post_update()">
									<input type="button" value="삭제하기" onclick="post_delete()">
									<input type="button" value="목록" onclick="post_list()">
								</form>
							</div>
							
							<div id="commentContainner">
								<div id="commmentWrapper">
									<div>
										<form id="form2">
											<input type="hidden" name="board_id" value="<%=board.getBoard_id()%>">
											<input type="text" value="내용" style="width: 60%" name="cmsg">
											<input type="text" value="작성자" style="width: 20%" name="cwriter">
											<input type="text" value="<%=commentList.size() %>개" style="width: 10%" name="cdate">
											<input type="button" value="등록" style="width: 5%" onclick="registComment()">
										</form>
									</div>
									<div id="commentRepeatFrame">
										<%for(int i=0;i<commentList.size();i++){ %>
										<%Comment comment = (Comment)commentList.get(i); %>
										<div>
												<input type="hidden" name="board_id" value="<%=board.getBoard_id()%>" readonly="readonly">
												<input type="hidden" name="board_id" value="<%=comment.getComments_id()%>" readonly="readonly">
												<input type="text" value="<%=comment.getCmsg() %>" style="width: 60%" name="cmsg" readonly="readonly">
												<input type="text" value="<%=comment.getCwriter() %>" style="width: 20%" name="cwriter" readonly="readonly">
												<input type="button" value="대댓" style="width: 5%" onclick="makeRecommentFrame(<%=i%>)">
										</div>
										<div id="<%=i%>" style="display: none">
											<input type="text" style="width: 60%">
											<input type="button" value="닫기" style="width: 5%" onclick="cancelRecommentFrame(<%=i%>)">
										</div>
										<a href="javascript:showRecomment(<%=comment.getComments_id()%>);" id="recommentListButton<%=comment.getComments_id()%>"> 답글</a>
										<br>
											<div id="recomment<%=comment.getComments_id()%>" style="display: none">
												<input type="text" style="width: 60%" value="" placeholder="내용 입력.." id="inputRecomment<%=comment.getComments_id()%>">
												<input type="button" value="댓글 등록" style="width: 20%" onclick="registRecomment(<%=comment.getComments_id()%>)"> 
												
												
												<div id="recommentsListShow<%=comment.getComments_id()%>" style="border: 1px solid black" >
												</div>
											</div>
										<%} %>
									</div>
								</div>
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





