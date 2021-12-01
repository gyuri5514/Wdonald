<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<<script type="text/javascript">
	$(function(){
		$("#updateBoard").click(function(){
			var title = $.trim($("#notice_title").val());
			if(title == ""){
				alert("제목을 입력하세요.");
				$("#notice_title").focus();
				return false;
			}
			var content = $.trim($("#notice_content").val());
			if(content == ""){
				alert("내용을 입력하세요.");
				$("#notice_content").focus();
				return false;
			}
			$("#boardUpdate").submit();
		});
	});
	function detail(index){
		var val =${Board};
		console.log(val);
		for(var i=0; i<val.length; i++){
			if(val[i].notice_seq==index){
				$("#notice_title").val(val[i].notice_title);
				$("#notice_regdate").val($("#"+index+"").find("#notice_regdate").text());
				$("#notice_content").val(val[i].notice_content);
				if (val[i].admin_seq = 1) {
					$("#admin_seq").val('admin');
				}else if (val[i].admin_seq = 0) {
					$("#admin_seq").val('admin');
				}
				$("#update").attr("style","block");
				$("#notice_seq").val(index);
				return;
			}
		}
	}
</script>
<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">관리자 공지사항 관리</h1> <!-- 최고 관리자: 매장테이블, 매장: 메뉴테이블 -->
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.mdo">WDonald</a></li>
				<li class="breadcrumb-item active">관리자 공지사항 관리</li>
			</ol>
			<div class="card mb-4">
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i>관리자 공지사항 관리
				</div>
				<div class="card-body">
					<button class="addboard" id="addboard"
						onclick="location='addboard.mdo'"
						style="background-color: #0d6efd; width: 150px; font-size: 15px; padding: 0px; color: white; border-radius: 5px; border: solid 1px #0d6efd;">공지사항
						등록</button>
					<hr>
					<form id="boardUpdate" action="boardUpdate.mdo" method="post">
					<div class="update" id="update" style="display: none;">
						제목 : <input name="notice_title" id="notice_title" class="form-control" type="text" style="margin-bottom: 10px"/>
						등록일 : <input name="notice_regdate" id="notice_regdate" class="form-control" type="text" readonly="readonly" style="margin-bottom: 10px"/>
						내용 : <textarea name="notice_content" id="notice_content" class="form-control" style="margin-bottom: 10px"></textarea>
						작성자 : <input name="admin_seq" id="admin_seq" class="form-control" type="text" readonly="readonly" style="margin-bottom: 10px">
						
						<button class="boardUpdate" id="updateBoard" type="submit" style="background-color: #0d6efd; color:white; border-radius: 5px; border : solid 1px #0d6efd;">수정</button>
					</div>
					<input type="hidden" name="notice_seq" id="notice_seq">
					</form>
					<hr>
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>제목</th>
								<th>내용</th>
								<th>등록일</th>
								<th>작성자</th>
								<th>공지사항 삭제</th>
							</tr>
						</thead>
						<tbody id="ajaxBoard">
						<c:forEach var="Board" items="${BoardList}" varStatus="status">
							<tr class="test" id="${Board.notice_seq}" onclick="detail(${Board.notice_seq})">
								<td id="notice_title">${Board.notice_title}</td>
								<td id="notice_content">${Board.notice_content}</td>
								<td id="notice_regdate"><fmt:formatDate value="${Board.notice_regdate}" pattern="yyyy-MM-dd"/></td>
								<td id="admin_seq">admin</td>
								<td><button class="boardDelete" id="boardDelete" onClick="noticeDelete(${Board.notice_seq})" style="background-color: #0d6efd; color:white; border-radius: 5px; border : solid 1px #0d6efd;">삭제</button></td>
							</tr>					
						</c:forEach>							
						</tbody>
					</table>
				</div>
			</div>
		</div>	
	</main>
	<script type="text/javascript">
	function noticeDelete(notice_seq){
		var chk = confirm("정말 삭제하시겠습니까?");
		if(chk){
			location.href='deleteBoard.mdo?notice_seq='+notice_seq;
		}
	}
	</script>


	<footer class="py-4 bg-light mt-auto">
		<div class="container-fluid px-4">
			<div class="d-flex align-items-center justify-content-between small">
				<div class="text-muted">WinDelivery &copy; 대표이사 : Tommy.Lee </div>
				<div>
					<a href="../main.mdo">Privacy Policy</a> &middot; <a href="#">Term
						&amp; Conditions</a>
				</div>
			</div>
		</div>
	</footer>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script	src="${pageContext.request.contextPath}/resources/js/adminScripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script	src="${pageContext.request.contextPath}/resources/js/adminDatatables-simple-demo.js"></script>
</body>
</html>


