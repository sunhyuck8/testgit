<%@page import="com.home.pooh.domain.Member"%>
<%@page import="com.home.pooh.model.repository.common.page.Paging"%>
<%@page import="com.home.pooh.domain.Board"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Board> list = (List)request.getAttribute("boardList"); 
	Paging paging = (Paging)request.getAttribute("paging");
	

	int totalRecord = paging.getTotalRecord();
	int currentPage=paging.getCurrentPage();
	int pageSize = 5;
	int totalPage = (int)Math.ceil(((float)totalRecord/pageSize));
	int blockSize=1;
	
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
select {
    appearance:none;
    
}
.searchBar{
	background-color: gray;
	overflow: hidden;
}
.searchBar input[type=text], button{
	float: right;
	padding: 6px;
	margin-top: 8px;
	margin-right: 20px;
	font-size: 17px;
	border: none;
	display: flex;
	left: 50%;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(function(){
		$("button[name=search]").click(function(){
			searchBoard2();
		});
	});
	
	function searchBoard2() {
		$("form").attr({
			action :"/co1/board/list",
			method : "post"
		});
		$("form").submit();
	} 
	//비동기 쓸때 사용 jo-coder.tistory.com/31 참고
	function searchBoard() {
		$.ajax({
			url: "",
			type:"",
			data : {},
			success : function(data){
				
			},
			error : function () {
				alert('f');
			}
		})
	}
</script>
</head>
<body>
	<div id="page-wrapper">

		<!-- Header -->
		<%@ include file="../inc/header.jsp"%>

				<!-- UnderHeader -->
				<%@ include file="../inc/underHeader.jsp" %>

		<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row main-row">
					<div class="col-12">

						<section>
							<h2>Test게시판 1</h2>
							<p><%=currentPage %></p>
							<p><%=paging.getCurrentBlockSize() +" : 블록사이즈" %></p>
							<!-- 검색기능 -->
							<div class="searchBar">
								<form>
									<input type="text" placeholder="search..." name = "searchItem" >
									<button name="search"> 검색</button> 
								</form>
							</div>
							<!-- 검색기능 끝-->
							<table>
								<tr>
									<th>분류</th>
									<th>제목</th>
									<th>글쓴이</th>
									<th>날짜</th>
									<th>조회</th>
									<th>추천</th>
								</tr>
								
								
								<%for(int i=0;i<pageSize;i++){ %>
								<%if(i+paging.getCurrentBlockSize()==totalRecord)break; %>
								<%Board board = list.get(i+paging.getCurrentBlockSize()); %>
								<tr>
									<td><%=i %></td>
									<td><a href="/col1/board/detail?board_id=<%=board.getBoard_id() %>"><%=board.getTitle() %></a></td>
									<td><%=board.getWriter()%></td>
									<td><%=board.getRegdate() %></td>
									<td><%=board.getView_cnt() %></td>
									<td><%=board.getLike_cnt() %></td>
								</tr>
								<%} %>
							</table>
								
							
							<div style="text-align: center">
								
								<a href="col1?게시판&currentPage=<%=paging.getMinBlock() %>"">◀</a>
								<%for(int i =1; i<totalPage+1;i++){ %>
									<%if(currentPage==i){ %>
									<a href="col1?게시판&currentPage=<%=i %>"" style="background-color: black"> <%= i %> </a>
									<%}else{ %>
									<a href="col1?게시판&currentPage=<%=i %>"" >[ <%= i %>] </a>
									<%} %>
								<%} %>
								<a href="col1?게시판&currentPage=<%=paging.getAddBlock() %>"">▶</a>
								
							</div>
							<button onclick="location.href='col1/board/registform'">글쓰기</button>
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