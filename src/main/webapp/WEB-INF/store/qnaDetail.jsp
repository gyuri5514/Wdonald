<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
	.textareaCSS{
		margin-top : 20px;
		height: 500px;
	}
	
	table, td, th {
		border : 1px solid #dddddd;
		border-collapse : collapse;	
		margin: 15px;
		padding: 10px;
		font-size: 20px;
	};
</style>
<body>
	<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">1:1 고객문의</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.sdo">WDonald</a></li>
				<li class="breadcrumb-item active">1:1 고객문의</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					WDonald 1:1 고객문의 <a target="_blank" href="main.do">WDonald</a>
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 고객문의
					<div>
						<input type="button" onclick="formSubmit()" class="btn btn-warning" style="margin-left:1000px; margin-top: -20px; float: right;" value="확인">
					</div>
				</div>
				<div style="margin-left: 100px;">
				<form id="qaaForm" method="post" action="qnaQaInsert.sdo">
					
					<input type="hidden" name="admin_seq" value="${sessionScope.store_admin.admin_seq}">
					<input type="hidden" id="qa_seq" name="qa_seq" value="${qnaDetail.qa_seq}">
					<table style="width: 90%;"> 	
						<tr>
							<td style="text-align: center">제목</td>
							<td>${qnaDetail.qa_title}</td>
						</tr>
						<tr>
							<td style="text-align: center">문의내용</td>
							<td style="margin-bottom: 0;">${qnaDetail.qa_content}</td>
						</tr>
						<tr>
							<td style="text-align: center">답변</td>
							<c:if test="${qnaDetail.qa_status eq 0}">
								<td><textarea name="qaa_content" class="int w1029" style="width: 100%; height:400px"></textarea></td>
							</c:if>
							<c:if test="${qnaDetail.qa_status eq 1}">
								<td><textarea name="qaa_content" class="int w1029" style="width: 100%; height:400px" readonly="readonly">답변완료</textarea></td>
							</c:if>
						</tr>
					</table>
					
					
				</form>
				</div>
			</div>
		</div>
	</main>
	
	

<%@ include file="footer.jsp" %>
<script type="text/javascript">
function formSubmit() {
	var qaForm = document.getElementById("qaaForm");
	qaForm.submit();
}
/*---smartEditor---*/

	/* $(function() {
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : document.getElementById('ACPT_DESC'), //textareaID
			sSkinURI : "Editor/SmartEditor2Skin.html", //경로를 맞춰주기 
			fCreator : "createSEditor2",
			htParams : {
				//툴바 사용 여부 (true:사용)
				bUseToolbar : true,

				//입력창 크기 조절바 사용 여부 (true : 사용)
				bUseVerticalResizer : false,

				//모드 탭 (Editor/HTML/TEXT) 사용 여부
				bUseModeChanger : false
			}
		});
	}) */
</script>